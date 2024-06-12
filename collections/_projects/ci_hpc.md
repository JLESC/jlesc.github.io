---
layout: post
title: Continuous integration for HPC codes
date: 2022-02-11
updated: 2024-01-26
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - storage
keywords:
  - CI pipelines
  - Research software engineering
  - Workflows
head: speck_r
members:
  - fritz_j
  - kabadshow_i
  - murai_h
  - nakamura_y
---

## Research topic and goals
Scientific software is becoming increasingly important for the success of research and to generate new knowledge. Certain codes, critical for a scientific field, have all the characteristics of a research infrastructure: they are developed and maintained over decades, must meet the highest quality requirements, and need specialized personnel for operation and training of users. Therefore, Research Software Engineering (RSE) is forming as a new subject of investigation in many research centers, universities and laboratories.

For HPC codes, clean and careful software engineering becomes even more crucial, but also more challenging. This is in particular true for continuous testing, integration, benchmarking, deployment (CT/CI/CB/CD = Cx): different architectures, different compilers, different degrees and types of parallelism, different software stacks, restricted access to machines and so on. All these aspects need to be addressed and while various approaches exist, a common strategy in the field of HPC is still missing.

It is the goal of this project to investigate the different approaches taken by the JLESC HPC centers, to gather own, hands-on experiences with those approaches and to evaluate their pros and cons. The initial focus will be on continuous integration, a later extension to Cx is intended. Further partners are welcome at any time.

Expected contributions:

* Overview of CI solutions for HPC centers and codes
* Best practice guide for teams/centers thinking about employing CI for their HPC machine
* Community building and exchange in the field of RSE and Cx within the JLESC

## Results for 2021/2022
The project started in early 2022 and the partners met during the 14th JLESC Workshop for a joint break-out session for the first time. There, topics like the connection between Github Actions and Gitlab runners, flaky tests, overflowing parameter spaces and CI on different HPC machines were discussed and further meetings of this kind are planned.

## Results for 2022/2023

Based on the outcome of the meeting during the 2022 workshop, we started implementing a gitlab-Github coupling to enable the usage of custom gitlab runners for Github-hosted repositories automatically. The code as been released with a demo and documentation on Github: https://github.com/jakob-fritz/github2lab_action and is tested within the pySDC code developed at JSC.

## Results for 2023/2024

We have worked on continuous testing as well as continuous benchmarking in this period. In the field of continuous testing, the solution to automatically mirror code from github to gitlab was further improved. Now different workflows are supported better (e.g. not only working with branches in the same repository but also working with Pull-Requests from forks). The development of the tool can be found on github: https://github.com/jakob-fritz/github2lab_action. Furthermore, continuous testing has been extended to enhance storage and visualization the recorded performance data. See an example of that approach here: https://gitlab.jsc.fz-juelich.de/SLPP/pepc/pepc.

## Visits and meetings
None.

## Impact and publications
None.

{% bibliography --cited --file jlesc.bib %}

## Future plans

Planned results:

* Internal report on existing CI solutions
* White paper/best practice guide on CI for HPC
* Similar results for Cx, if feasible



## References
<!-- {% bibliography --file external/activestorage_project.bib %} -->
