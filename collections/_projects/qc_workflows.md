---
layout: post
title: "Quantum-Classical Workflows in HPC Environments"
date: 2026-05-01
updated: 2026-05-18
navbar: Research
subnavbar: Projects
project_url: 
status: starting
topics: 
  - qc
  - prog_lang
keywords: 
  - Workflow management
  - QC-HPC
  - Performance modeling 
head: cainolores_s
members: 
  - antoniu_g
  - baboulin_m
  - badia_r
  - conejero_f
  - renard_s
  - tejedor_m

---

{% comment %}

================================
=== HOW TO USE THIS TEMPLATE ===
================================

Copy this file to `_projects` and rename it to a very short version of your project's title, e.g.
the project "Scalability Enhancements to FMM for Molecular Dynamics Simulations" chooses
"fmm_project.md".

Also copy the file `_templates/project.bib` to `_bibliography/external` and name it exactly as this
one, but the file extension, e.g. "fmm_project.bib".

For citing references, use the Liquid citing syntax as explained in the wiki:
https://github.com/JLESC/jlesc.github.io/wiki/Markup-Language#cite-and-list-publications

!IMPORTANT!
Remember to adjust the file name of the BibTeX file at the very bottom of this file!!

Then fill in the YAML header variables above.

  title            (required)
                   the full title of the project
                   WARNING: do not use quotation marks, colons and the likes

  date             (required)
                   the date this page was created in the format: YYYY-MM-DD; this will get displayed
                   at the very bottom of the generated website

  updated          (optional)
                   in case you or somebody else came back later and edited significant parts of the
                   page, put in the date (format: YYYY-MM-DD) of that change;
                   if present, this will get displayed at the very bottom of the generated website

  project_url      (optional)
                   optional URL to some external website of the project.

  status           (optional)
                   the current status of the project;
                   you have to use one of the keys defined in '_data/project_states.yml'

  topics           (required)
                   a YAML list of topic keys (as defined in '_data/topics.yml') for this project;
                   each topic on a new line with a leading dash

  keywords         (optional)
                   a YAML list of keywords for this project;
                   each topic on a new line with a leading dash.

  head             (required)
                   the dedicated project leader;
                   this is the identifier of a person as found in '_data/people.yml'

  members          (optional)
                   a YAML list of members of this project excluding the head;
                   each member must be listed as its identifier as found in '_data/people.yml'

Now, fill in the details for the current report below. Please do not change headings, headings level
or order.
Read the comments carefully!

{% endcomment %}

## Research topic and goals

Quantum Computing (QC) systems are being increasingly explored as the next high-impact extension to the computing spectrum, particularly in terms of their integration into supercomputers as QC-HPC couplings. The successful interoperability between classical and quantum systems depends on middleware that can interact with heterogeneous hardware technologies and their associated software stacks and data management methods. However, approaches to high-level hybrid programming remain limited today.

Workflow abstractions and workflow management tools have proved successful in overcoming the challenge of heterogeneity in tasks, data, and computational resources across multiple scientific domains. This opens up an exciting new area at the intersection of workflow research and the integration of QC into classical environments. However, adopting workflow abstractions and workflow management tools in hybrid use cases leads to significant challenges. This collaboration explores pathways for profiling, characterizing, modeling and analyzing dataflow and task control patterns in hybrid quantum-classical applications with the overarching goal of facilitating workflow management in QC-HPC environments. We aim to contribute to the following outcomes:

**Insights into the applicability of task-based abstractions and execution models for QC-HPC applications.** To date, few studies have attempted to systematically represent QC-HPC workflow motifs, mainly due to the limited availability of use cases and practical application scenarios. We aim to identify hybrid QC-HPC use cases in the scope of this collaboration in order to inform the design of methodologies and tools for workflow management.

**Composition, deployment, and monitoring of hybrid workflows on QC-HPC resources.** A major issue when it comes to practical analysis of hybrid workflows is the limited availability of telemetry data, especially for inbound and outbound data transfers to QPUs. We will address this by developing methods to systematically collect telemetry data from hybrid workflows deployed and executed on QC-HPC systems.

**Methodologies and tools for studying QC-HPC workflows.** Breakthroughs in hybrid workflow profiling, modeling, characterization and analysis are required to assess the effectiveness of software integration for hybrid workflows in QC-HPC environments. We aim to develop and share methodologies and tools to support further research in interoperability between QC and HPC systems, and to facilitate the assessment of different QC-HPC environments.

## Results for 2025/2026

* Co-organized Birds-of-a-Feather session on *Scientific Computational Workflows in Hybrid Quantum-Classical Environments* (ISC High Performance 2025; Hamburg, Germany)
* Co-organized Birds-of-a-Feather session on *Bridging the Gap: Making Quantum-Classical Hybridization Work in HPC* (SC25; St. Louis, USA)
* Started a dedicated working group within the Workflows Community Initiative: <https://workflows.community/groups/quantum/>
* The Inria side is working on the refinement of data collection and analysis methodologies on simulated QC-HPC environments running on existing classical resources, in particular for Qdislib workflows on PyCOMPSs {% cite TejedorEtAl2025 --file qc_workflows.bib %}. Preliminary results will be presented at the 18th JLESC Workshop (Juelich, Germany) as *A Case Study on Hybrid Quantum-Classical Workflow Modeling* by {% person renard_s %}.

## Visits and meetings

## Impact and publications

{% comment %}
=============================
== CITING OWN PUBLICATIONS ==
=============================

You can list your own publications below in case you did not cite them in the text
(which you should do, though).
Use the Liquid citing syntax as explained in the wiki:
https://github.com/JLESC/jlesc.github.io/wiki/Markup-Language#cite-and-list-publications
Remember to use the `--file jlesc.bib` with the `cite` tag.
{% endcomment %}

{% bibliography --cited --file jlesc.bib %}

## Future plans

We are planning for a visit of Inria researchers to BSC for collection of telemetry data from BSC's on-premises QC-HPC system onsite for validation of emulated results against on-premises measurements. A subsequent visit of BSC researchers to Inria will be dedicated to the exploration of additional use cases that could be suitable for implementation and deployment as a PyCOMPSs application, and replication of experimental protocols on CEA's TGCC QC-HPC system.

## References

{% bibliography --file external/qc_workflows.bib %}