---
layout: page_project
title: Exploiting Active Storage for Resilience
date: 2016-01-01
updated: 2016-02-05
navbar: Projects
footer: true
project_url:
status: closing
topics:
  - resilience
keywords:
  - Blue Gene Active Storage
  - Global View Resilience
head: pleiter_d
members:
  - chien_a
  - dun_n
  - vandenbergen_n
---

## Research topic and goals
The research in this topic is based on a hardware and a software architecture, which both are currently under development: GVR and BGAS.
GVR (Global View Resilience) is a user-level library that enables portable, efficient, application-controlled resilience {% cite ChienEtAl2015 --file external/activestorage_project.bib %}.
It focusses on achieving scalability and maximization of error recovery.
BGAS (Blue Gene Active Storage) is a realisation of an active storage architecture based on custom flash memory cards which are integrated into Blue Gene/Q I/O drawers.
Here JSC continues previous work on integration of non-volatile memory {% cite SayedEtAl2013 --file external/activestorage_project.bib %}.
In this subproject our goal is to explore the opportunities of both architectures by integrating them.
More specifically the following research questions are addressed:

* How well can the software architecture of GVR exploit the BGAS hardware architecture?
* How efficiently can both architectures be exploited?
* What is the value of active storage for a which classes of large-scale scientific computing?


## Results for 2014/2015
The project only started early this year and focussed on reaching the first milestone, i.e. completing the port of GVR to BGAS.
Based on a non-production version of MPI, namely MPICH3, this goal has been achieved with both GVR running on the Blue Gene/Q system at JSC and the BGAS run-time system adapted and recompiled for this version of MPI.

## Visits and meetings
Beyond regular contacts via email the following meetings involving most of the participants took place:

* Meeting of A. Chien, N. Dun and D. Pleiter at SC14 on November 17, 2014.
* Technical update meeting on February 5, 2015.

We plan for the following meetings:

* Monthly telephone conferences starting from May 2015.
* Technical update meeting at JLESC workshop, June/July 2015.
* Architecture evaluation meeting at the end of July 2015.
* Data transport analysis and technical update meeting during SC15, November 2015.

## Impact and publications
The project just started and thus did not result in any publications, yet.

<!--

-->
{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2014/2015

The efforts of the participants so far are as follows:

{:.table.table-bordered.table-hover.table-sm}
| Andrew Chien (ANL)   | 0.1 PM |
| Dirk Pleiter, (JSC)  | 0.1 PM |
| Nan Dun, (ANL)       | 2 PM   |
| Nicholas Vandenbergen | 0.5 PM |


## Future plans
Within this subproject the next steps will be:

* Complete the already started performance evaluation and perform a scalability analysis.
* Explore possible changes to both the GVR software architecture as well as the BGAS architecture (DSA interface to the flash memory, run-time system services).
* Explore and evaluate different data transport mechanisms including optimized RDMA protocols for compute node to I/O node as well as I/O node to flash memory communication.


## References
{% bibliography --file external/activestorage_project.bib %}
