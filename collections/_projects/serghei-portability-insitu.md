---
layout: post
title: Performance-portability and in-situ visualisation with SERGHEI - HPC solutions
date: 2025-06-04
updated: 2026-01-31
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - apps
  - prog_lang
keywords:
  - Performance-portability
  - In-situ visualization
  - flood modelling 
head: caviedes-voullieme_d
members:
  - rizzi_s
  - goebbert_j
  - villalobos_j
---

## Research topic and goals

This project is concerned with facilitating the performance-portability, usability and HPC site portability of SERGHEI, in particular aiming towards demonstrating its potential applicability in flash flood warning systems. SERGHEI is performance-portable via Kokkos, but porting and deploying on different HPC systems still requires a certain effort. In order for the prototype to be usable, portability should be demonstrated and require minimal effort. Additionally, for flash flood emergency assessment, in situ visualisation is required to generate information for decision making on the fly, in particular because very frequent output is required, which if written to disk and then visualised would create large bottlenecks, potentially rendering the early warning prototype too slow for use. Finally, in this project we will explore multi-site workflows in which SERGHEI may be deployed for the same purpose on multiple HPC sites (internationally, between Germany, USA, and Costa Rica), operating, for example at different resolutions, or with different forcings, which would feed the same early warning simulation workflow.

This project aims to:
<ul>
<li> demonstrate and evaluate performance portability of all modules in SERGHEI</li>
<li> investigate portable optimisations for SERGHEI-SWE, and potentially other modules</li>
<li> prototype of in-situ visualisation for SERGHEI-SWE, exploring the use of CINEMA and OpeanSeaDragon for interactive data explorationI</li>
<li> exploring multi-site, M-to-N workflows coupling geographically distant HPC resources</li>
</ul>

## Results for 2025/2026

Achieved performance-portability on all thre GPU vendors on pre- and exascale machines (JUWELS, JEDI, Aurora, Forntier).

## Visits and meetings

 * May 2025: JLESC Workshop lead to establishing the project

## Impact and publications
Contributed a paper to SBAC-PAD (Towards Portability at Scale: A Cross-Architecture Performance Evaluation of a GPU-enabled Shallow Water Solver){% cite Villalobos2025 --file external/serghei-pp-iv.bib %}.


## Future plans
Performance optimisations. Re-take in-situ visualisation

## References
{% bibliography --file external/serghei-pp-iv.bib %}

