---
layout: page_project
title: Enhancing Asynchronous Parallelism in OmpSs with Argobots
date: 2016-03-14
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - prog_lang
keywords:
  - OmpSs
  - Argobots
  - thread
  - task
  - asynchronous parallelism
head: balaji_p
members:
  - seo_s
  - amer_a
  - badia_r
  - labarta_j
  - teruel_x
  - beltran_v
---

## Research topic and goals

As future applications on exascale systems are expected to contain billions of
threads or tasks to exploit concurrency provided by the underlying hardware,
parallel programming models need to evolve to efficiently support massive
parallelism with low overhead. OmpSs is a programming model that extends OpenMP
with new directives to support asynchronous parallelism. It enables
asynchronous parallelism by using data-dependencies between different tasks of
the application. Argobots is a low-level infrastructure that supports
lightweight user-level threads (ULTs) and tasks for massive concurrency.
It directly leverages the lowest-level constructs in the hardware and OS,
such as lightweight notification mechanisms, data movement engines, memory
mapping, and data placement strategies.

In this project, we aim at improving asynchronous parallelism support in OmpSs
with Argobots. As a first step, we will evaluate the possible integration of
Argobots into the OmpSs runtime. Since Argobots provides two kinds of work
units (one is a ULT that has context-switching ability, and the other is a
tasklet that is suitable for atomic execution), efficient mapping between OmpSs
tasks and Argobots' work units will be beneficial to improve performance.
If this evaluation is positive, we will proceed to a prototype implementation
of the integration. Also, we will investigate how OmpSs can take advantage of
two-level parallelism and deterministic threading model in Argobots. Argobots
abstracts its execution model with hierarchical constructs and exposes their
execution to users. OmpSs can exploit this model to optimize multi-level
parallelism required for recursive algorithms. Finally, we will explore
scheduling capability of Argobots in OmpSs. Argobots allows users to write
their own scheduler and to stack different schedulers with different scheduling
strategies. We will implement a locality-aware scheduler in Argobots, which
will boost the execution performance of OmpSs tasks.


## Results for 2015/2016

We started working on the implementation of the OmpSs runtime on top of
Argobots.  We have integrated Argobots into the Nanos++ runtime (Nanos6) and
implemented a prototype runtime that is compatible with the existing one and
can work with the Mercurium compiler.  We have also tested basic functionalities
including `#pragma omp task`, `#pragma omp taskwait`, and task dependencies.
From the collaboration, we found some functionalities that need to be supported
by Argobots (e.g., retrieving the work unit argument at run-time) and
implemented them in Argobots as well.


## Results for 2015/2016

We have discussed the feasibility of integrating OmpSs and Argobots. We reviewed
both runtimes and compared their functionalities. The first observation is that
Argobots and OmpSs runtime are overlapped in some basic functionalities and
components, which are strongly embedded in the OmpSs runtime, and thus porting
directly OmpSs runtime on top of Argobots ULTs will add many layers of
components and scheduler overheads. We think that it needs more time and results
to evaluate both runtimes and to come up with appropriate integration
approaches.


## Visits and meetings

We had a telecon meeting on December 15, 2014, where we discussed the current
status of Argobots and OmpSs and interaction between two runtimes. We started
our collaboration after this meeting.  In 2015, we had F2F meetings at SC 2015
and the 4th JLESC workshop in Bonn and discussed implementation issues (e.g.,
retrieving the work unit argument) and interoperability between different
programming models.  We have also exchanged emails to discuss the integration
between Argobots and OmpSs runtime, current issues, and implementation plans.
We will schedule more telecon meetings for discussion and plan visits as needed.
There are no planned visits yet.


## Impact and publications

This project will have the future impact and contributions as follows:

* Improving the OmpSs programming model with a new lightweight threading/tasking library, Argobots
* Exploring lightweight user-level threads to support asynchronous parallelism and enhancing asynchronous parallelism support in directive-based programming models
* Implementing a runtime prototype that integrates Argobots and supports OmpSs
* Performance evaluation of the runtime prototype



{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person balaji_p %}  | 0.5 PM |
| {% person seo_s %}     | 1.0 PM |
| {% person amer_a %}    | 1.0 PM |
| {% person badia_r %}   | 0.5 PM |
| {% person labarta_j %} | 0.5 PM |
| {% person teruel_x %}  | 1.5 PM |
| {% person beltran_v %} | 0.5 PM |


## Future plans

Next steps in this project are to have a more complete implementation of
the Nanos++ runtime over Argobots, to evaluate the performance of our
implementation with OmpSs applications, and to optimize the runtime.
We also plan to publish one or two papers to share our work on interaction
between OmpSs and Argobots with the HPC community and to make our runtime
prototype open source software at the end of the project.


## References

{% bibliography --file external/ompss_argobots_project.bib %}
