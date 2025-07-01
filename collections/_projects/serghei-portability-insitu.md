---
layout: post
title: Performance-portability and in-situ visualisation with SERGHEIi - HPC solutions
date: 2025-06-04
updated: 2025-07-01
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - apps
  - prog_lang
keywords:
  - Performance-portability
  - In-situ visualization
  - flood modelling 
head: iserte_s
members:
  - caviedes-voullieme_d
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

## Results for 2025

None yet.

## Visits and meetings

 * May 2025: JLESC Workshop lead to establishing the project

## Impact and publications

None yet.

## Future plans


## References

{% bibliography --file external/serghei-pp-iv.bib %}
