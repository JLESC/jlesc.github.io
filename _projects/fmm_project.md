---
layout: page_project
title: Scalability Enhancements to FMM for Molecular Dynamics Simulations
date: 2016-01-01
updated: 2016-03-30
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - numerics
  - prog_lang
keywords:
  - Fast Multipole Method
  - MPI-3
  - MPI-4
head: kabadshow_i
members:
  - balaji_p
  - haensel_d
---

## Research topic and goals
The goal of this joint-lab cooperation covers the topic of parallel programming.
We are especially interested in increasing the scalability (strong scaling) of the Fast Multipole Method (FMM) for very large numbers of ranks.
FMSolvr is a high-performance FMM library being developed by JSC.
However, the current intrinsic parallel scaling limitations stem from process synchronization on large-scale systems.
We will investigate weak and delayed synchronization models, tasking approaches and other techniques with MPI-3 and upcoming MPI-4 extensions to alleviate some of these performance bottlenecks.

## Results for 2014/2015
The project was initiated at the JLESC meeting in November 2014.
To provide a consistent interface for measuring and tuning parallel code performance some profound changes had to be made to the code.
We started implementing an abstract parallelization layer for the FMSolvr library.
This especially includes a parallelization approach for inter-node communication via MPI.
The adopted abstraction layer allows easier replacement/improvement of different synchronization strategies within the code.
Besides the structural changes, a latency-avoiding communication scheme was implemented to improve the strong scaling.
Together with the automatic testing framework, scaling bottlenecks of the method can be investigated much easier.


## Visits and meetings
David Haensel will join the group of Pavan Balaji in Mai/June 2016 to develop a tasking scheme for the FMM based on Argobots.


## Impact and publications
none yet.

<!--

-->
{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2014/2015
Since December 2014:

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person balaji_p %}    | 0.1 PM |
| {% person kabadshow_i %} | 0.1 PM |
| {% person haensel_d %}   | 1 PM   |

The efforts are likely to increase, once the code base includes a near-complete parallelization layer.


## Future plans
The next step will be the development of a task-based scheme for the intranode communication.
This will also help to reduce load imbalances due to non-homogeneous particle distributions.


## References
{% bibliography --file external/fmm_project.bib %}
