#!/usr/bin/env python3
"""
Build JLESC institution collaboration data and visualizations from project markdown files.

What this script does
---------------------
1. Scans a directory of markdown project files.
2. Parses the YAML front matter of each file.
3. Keeps only projects whose status is "running" or "starting".
4. Extracts the project lead ("head") and project members ("members").
5. Resolves each person's affiliation(s) using people.yml.
6. Builds a detailed table with one row per project-person-affiliation combination.
7. Builds a project-to-institution table.
8. Builds an institution-to-institution edge list where edge weight equals the
   number of joint projects.
9. Creates collaboration network visualizations for:
   - all institutions found in the data
   - JLESC partner institutions only

Typical usage
-------------
Run in a directory containing project markdown files and people.yml:

python jlesc_institution_network.py --project-dir . --people people.yml --out-prefix jlesc

You can also explicitly provide the JLESC partner institution IDs to retain in the
partner-only network:

python jlesc_institution_network.py \
  --project-dir . \
  --people people.yml \
  --out-prefix jlesc \
  --jlesc-partners anl bsc inria jsc riken uiuc utk ncsa

Outputs
-------
_project_person_affiliation.csv
  Detailed long-format table. One row per project/person/affiliation.

_project_institutions.csv
  Project-to-institution table.

_institution_edges.csv
  Institution-to-institution weighted edge list using all institutions.

_institution_edges_jlesc_only.csv
  Institution-to-institution weighted edge list restricted to JLESC partners.

_institution_network.png
  Network visualization using all institutions.

_institution_network_jlesc_only.png
  Network visualization restricted to JLESC partners.

Notes
-----
- If a person has multiple affiliations, one row is emitted per affiliation.
- If a referenced person ID is missing from people.yml, the script keeps a row
  with an empty affiliation and prints a warning.
- The partner-only filtering is applied at the institution level, not the person level.
"""

import argparse
import csv
import itertools
import re
from collections import Counter, defaultdict
from pathlib import Path

import matplotlib.pyplot as plt
import networkx as nx
import yaml

DEFAULT_JLESC_PARTNERS = ["anl", "bsc", "inria", "jsc", "riken", "uiuc", "utk"]


def log(msg=""):
    print(msg, flush=True)


def load_people(path: Path):
    log(f"[INFO] Loading people database: {path}")
    raw = path.read_text(encoding="utf-8")

    try:
        data = yaml.safe_load(raw)
    except yaml.YAMLError as e:
        log(f"[WARN] Standard YAML parsing failed: {e}")
        log("[WARN] Retrying after replacing tab characters with spaces")
        cleaned = raw.replace("\t", " ")
        data = yaml.safe_load(cleaned)

    people = {}
    for pid, entry in (data or {}).items():
        aff = entry.get("affiliation", [])
        if isinstance(aff, str):
            affs = [aff]
        elif isinstance(aff, list):
            affs = [a for a in aff if a]
        else:
            affs = []

        people[pid] = {
            "given_name": entry.get("given_name", ""),
            "sur_name": entry.get("sur_name", ""),
            "affiliations": affs,
        }

    log(f"[INFO] Loaded {len(people)} people entries")
    return people


def canonical_affiliation(aff):
    mapping = {
        "ncsa": "uiuc",
    }
    return mapping.get(aff, aff)


def extract_front_matter(text: str):
    m = re.match(r"^---\s*\n(.*?)\n---\s*\n?", text, flags=re.S)
    if not m:
        return None
    return yaml.safe_load(m.group(1)) or {}


def find_projects(project_dir: Path):
    log(f"[INFO] Scanning markdown files in: {project_dir}")
    all_md = sorted(project_dir.glob("*.md"))
    log(f"[INFO] Found {len(all_md)} markdown files")

    projects = []
    skipped_no_front_matter = []
    skipped_status = []
    status_counter = Counter()

    for path in all_md:
        text = path.read_text(encoding="utf-8")
        fm = extract_front_matter(text)
        if not fm:
            skipped_no_front_matter.append(path.name)
            continue

        status = str(fm.get("status", "")).strip().lower()
        status_counter[status or ""] += 1
        if status not in {"running", "starting"}:
            skipped_status.append((path.name, status or ""))
            continue

        title = fm.get("title", path.stem)
        lead = fm.get("head")
        members = fm.get("members", []) or []
        if isinstance(members, str):
            members = [members]

        projects.append(
            {
                "file": path.name,
                "title": title,
                "status": status,
                "lead": lead,
                "members": members,
            }
        )

    log(f"[INFO] Parsed project front matter from {len(all_md) - len(skipped_no_front_matter)} files")
    if skipped_no_front_matter:
        log(f"[WARN] Skipped {len(skipped_no_front_matter)} files without YAML front matter")
    log(f"[INFO] Project status distribution: {dict(sorted(status_counter.items()))}")
    log(f"[INFO] Retained {len(projects)} projects with status running/starting")

    if skipped_status:
        preview = ", ".join(f"{name}({status})" for name, status in skipped_status[:10])
        log(f"[INFO] Example skipped files by status: {preview}")

    return projects


def build_project_person_affiliation(projects, people):
    log("[INFO] Building project-person-affiliation table")
    rows = []
    missing_people = set()
    project_person_counts = {}

    for proj in projects:
        persons = []
        if proj["lead"]:
            persons.append(("lead", proj["lead"]))
        persons.extend(("member", p) for p in proj["members"])
        project_person_counts[proj["title"]] = len(persons)

        for role, pid in persons:
            p = people.get(pid)
            if p is None:
                missing_people.add(pid)
                rows.append(
                    {
                        "project": proj["title"],
                        "file": proj["file"],
                        "status": proj["status"],
                        "role": role,
                        "person_id": pid,
                        "person_name": "",
                        "affiliation": "",
                    }
                )
                continue

            name = f"{p.get('given_name', '').strip()} {p.get('sur_name', '').strip()}".strip()
            affs = [canonical_affiliation(a) for a in (p["affiliations"] or [""])]

            for aff in affs:
                rows.append(
                    {
                        "project": proj["title"],
                        "file": proj["file"],
                        "status": proj["status"],
                        "role": role,
                        "person_id": pid,
                        "person_name": name,
                        "affiliation": aff,
                    }
                )

    log(f"[INFO] Built {len(rows)} project-person-affiliation rows")
    if project_person_counts:
        avg_people = sum(project_person_counts.values()) / len(project_person_counts)
        log(f"[INFO] Average listed people per retained project: {avg_people:.2f}")

    if missing_people:
        log(f"[WARN] Missing {len(missing_people)} people IDs from people.yml: {', '.join(sorted(missing_people))}")
    else:
        log("[INFO] All referenced people IDs were found in people.yml")

    return rows, missing_people


def build_institution_edges(rows, allowed_affiliations=None):
    proj_to_affs = defaultdict(set)

    for r in rows:
        aff = canonical_affiliation((r.get("affiliation") or "").strip())
        if not aff:
            continue
        if allowed_affiliations is not None and aff not in allowed_affiliations:
            continue
        proj_to_affs[r["project"]].add(aff)

    edge_weights = defaultdict(int)
    inst_project_count = defaultdict(int)

    for project, affs in proj_to_affs.items():
        for aff in affs:
            inst_project_count[aff] += 1
        for a, b in itertools.combinations(sorted(affs), 2):
            edge_weights[(a, b)] += 1

    return proj_to_affs, edge_weights, inst_project_count


def write_csv(path: Path, rows, fieldnames):
    with open(path, "w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)
    log(f"[INFO] Wrote CSV: {path} ({len(rows)} rows)")


def summarize_network(label, proj_to_affs, edge_weights, inst_project_count):
    log(f"[INFO] Network summary [{label}]")
    log(f"       Projects contributing nodes/edges: {len(proj_to_affs)}")
    log(f"       Institutions: {len(inst_project_count)}")
    log(f"       Collaboration edges: {len(edge_weights)}")

    if inst_project_count:
        top_nodes = sorted(inst_project_count.items(), key=lambda x: (-x[1], x[0]))[:10]
        log(f"       Top institutions by project count: {top_nodes}")

    if edge_weights:
        top_edges = sorted(edge_weights.items(), key=lambda x: (-x[1], x[0][0], x[0][1]))[:10]
        log(f"       Top institution pairs by joint projects: {top_edges}")


def draw_network(edge_weights, inst_project_count, out_png: Path, title: str):
    G = nx.Graph()

    for inst, count in inst_project_count.items():
        G.add_node(inst, project_count=count)

    for (a, b), w in edge_weights.items():
        G.add_edge(a, b, weight=w)

    if not G.nodes:
        fig, ax = plt.subplots(figsize=(8, 6), dpi=220)
        ax.text(0.5, 0.5, "No collaboration edges found", ha="center", va="center", fontsize=16)
        ax.axis("off")
        fig.tight_layout()
        fig.savefig(out_png, bbox_inches="tight")
        plt.close(fig)
        log(f"[INFO] Wrote PNG: {out_png}")
        return

    pos = nx.spring_layout(
        G,
        seed=4,
        weight="weight",
        k=0.75,
        iterations=1000,
    )

    strength = dict(G.degree(weight="weight"))
    node_sizes = [500 + 250 * strength[n] for n in G.nodes]
    edge_widths = [1.0 + 0.9 * G[u][v].get("weight", 1) for u, v in G.edges]

    fig, ax = plt.subplots(figsize=(8, 6), dpi=220)

    nx.draw_networkx_edges(
        G,
        pos,
        ax=ax,
        width=edge_widths,
        alpha=0.45,
        edge_color="#6b7280",
    )

    nx.draw_networkx_nodes(
        G,
        pos,
        ax=ax,
        node_size=node_sizes,
        node_color="#cfe8ff",
        alpha=1.0,
        linewidths=1.2,
        edgecolors="#1f2937",
    )

    labels = {n: n.upper() for n in G.nodes}
    nx.draw_networkx_labels(
        G,
        pos,
        labels=labels,
        ax=ax,
        font_size=10,
        font_weight="bold",
        font_color="#111827",
    )

    edge_labels = {
        (u, v): G[u][v]["weight"]
        for u, v in G.edges
        if G[u][v].get("weight", 1) > 1
    }
    if edge_labels:
        nx.draw_networkx_edge_labels(
            G,
            pos,
            edge_labels=edge_labels,
            font_size=8,
            rotate=False,
            ax=ax,
        )

    ax.set_title(title, fontsize=12, pad=10)
    ax.axis("off")
    fig.tight_layout(pad=0.3)
    fig.savefig(out_png, bbox_inches="tight")
    plt.close(fig)
    log(f"[INFO] Wrote PNG: {out_png}")


def main():
    parser = argparse.ArgumentParser(
        description="Build institution collaboration tables and visualizations from JLESC project markdown files."
    )
    parser.add_argument(
        "--project-dir",
        type=Path,
        default=Path("."),
        help="Directory containing project markdown files (default: current directory)",
    )
    parser.add_argument(
        "--people",
        type=Path,
        default=Path("people.yml"),
        help="Path to people.yml (default: people.yml)",
    )
    parser.add_argument(
        "--out-prefix",
        type=Path,
        default=Path("jlesc_collab"),
        help="Prefix for output files (default: jlesc_collab)",
    )
    parser.add_argument(
        "--jlesc-partners",
        nargs="*",
        default=DEFAULT_JLESC_PARTNERS,
        help=f"Institution IDs to retain for the partner-only network (default: {' '.join(DEFAULT_JLESC_PARTNERS)})",
    )
    args = parser.parse_args()

    log("[INFO] Starting analysis")
    log(f"[INFO] Project directory: {args.project_dir.resolve()}")
    log(f"[INFO] People file: {args.people.resolve()}")
    log(f"[INFO] Output prefix: {args.out_prefix}")
    log(f"[INFO] JLESC partner filter: {args.jlesc_partners}")

    people = load_people(args.people)
    projects = find_projects(args.project_dir)
    rows, missing_people = build_project_person_affiliation(projects, people)

    out1 = Path(f"{args.out_prefix}_project_person_affiliation.csv")
    out2 = Path(f"{args.out_prefix}_project_institutions.csv")
    out3 = Path(f"{args.out_prefix}_institution_edges.csv")
    out4 = Path(f"{args.out_prefix}_institution_network.png")
    out5 = Path(f"{args.out_prefix}_institution_edges_jlesc_only.csv")
    out6 = Path(f"{args.out_prefix}_institution_network_jlesc_only.png")

    write_csv(
        out1,
        rows,
        ["project", "file", "status", "role", "person_id", "person_name", "affiliation"],
    )

    proj_to_affs_all, edge_weights_all, inst_project_count_all = build_institution_edges(rows)

    proj_rows_all = []
    for project, affs in sorted(proj_to_affs_all.items()):
        for aff in sorted(affs):
            proj_rows_all.append({"project": project, "affiliation": aff})
    write_csv(out2, proj_rows_all, ["project", "affiliation"])

    edge_rows_all = []
    for (a, b), w in sorted(edge_weights_all.items(), key=lambda x: (-x[1], x[0][0], x[0][1])):
        edge_rows_all.append({"institution_a": a, "institution_b": b, "joint_projects": w})
    write_csv(out3, edge_rows_all, ["institution_a", "institution_b", "joint_projects"])

    summarize_network("all institutions", proj_to_affs_all, edge_weights_all, inst_project_count_all)
    draw_network(
        edge_weights_all,
        inst_project_count_all,
        out4,
        "Institution Collaboration Network\n(edge weight = number of joint projects)",
    )

    partner_set = set(canonical_affiliation(a) for a in args.jlesc_partners)
    proj_to_affs_j, edge_weights_j, inst_project_count_j = build_institution_edges(
        rows, allowed_affiliations=partner_set
    )

    edge_rows_j = []
    for (a, b), w in sorted(edge_weights_j.items(), key=lambda x: (-x[1], x[0][0], x[0][1])):
        edge_rows_j.append({"institution_a": a, "institution_b": b, "joint_projects": w})
    write_csv(out5, edge_rows_j, ["institution_a", "institution_b", "joint_projects"])

    summarize_network("JLESC partners only", proj_to_affs_j, edge_weights_j, inst_project_count_j)
    draw_network(
        edge_weights_j,
        inst_project_count_j,
        out6,
        "JLESC Partner Collaboration Network\n(edge weight = number of joint projects)",
    )

    log("[INFO] Analysis complete")
    log(f"[INFO] Retained projects: {len(projects)}")
    log(f"[INFO] Missing people IDs: {len(missing_people)}")
    log("[INFO] Output files created:")
    for p in [out1, out2, out3, out4, out5, out6]:
        log(f"       - {p}")


if __name__ == "__main__":
    main()
