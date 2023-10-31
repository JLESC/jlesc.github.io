---
layout: post
title: Scalability Enhancements to FMM for Molecular Dynamics Simulations
date: 2016-01-01
updated: 2019-03-30
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - prog_lang
  - numerics
keywords:
  - Fast Multipole Method, tasking, MPI-3, MPI-4
head: kabadshow_i
members:
  - balaji_p
  - haensel_d
  - amer_a
---

## Research topic and goals
This joint-lab cooperation covers the topic of parallel programming and numerical algorithms.
We are especially interested in increasing the scalability (strong scaling) of the Fast Multipole Method (FMM) for very large numbers of ranks.
Therefore, we will examine and extend the JSC-developed, high-performance FMM library called FMSolvr.
This will allow us to improve the usability of the FMM Coulomb solver in molecular dynamics simulations with only a few particles per rank.
Initial research already discovered, that the current intrinsic parallel scaling limitations stem from thread synchronization (intranode) and process synchronization (internode) on large-scale systems.
We will investigate weak and delayed synchronization models, as well as node-level tasking approaches and other techniques with MPI-3 and upcoming MPI-4 extensions to alleviate some of these performance bottlenecks.

## Results for 2015/2016
The project was initiated at the JLESC meeting in November 2014 between ANL and JSC.
To provide a consistent interface for measuring and tuning parallel code performance some profound changes had to be made to the code.
We started implementing an abstract parallelization layer for the FMSolvr library.
This especially includes a flexible parallelization approach for inter-node communication via MPI.
The adopted abstraction layer allows easier replacement/improvement of different synchronization strategies within the code.
Besides the structural changes, a latency-avoiding communication scheme was implemented to improve the strong scaling.
Together with the automatic testing framework, scaling bottlenecks of the method can be investigated much easier.

## Results for 2016/2017
During the visit of David Haensel at ANL we implemented a data-driven version of the FMM on top of Argobots.
With the experience from this implementation we implemented a tasking framework with C++ standard library features.
This tasking library is specialized for communication bound problems like they arose in MD simulations.
For the fine grained resolution of dependencies we implemented a dependency resolver which is configurable at compile time via template meta programming.

## Results for 2017/2018
The task engine was extended with compile-time type-driven priority scheduling.
This step was necessary to reduce the runtime overhead of the multiqueue.
In order to increase the scalability for an increasing number of cores per node, the task engine was enhanced with NUMA-aware work stealing and NUMA-aware allocations.
Both features ensure that data locality is maintained and data crosses the NUMA boundary only if absolutely necessary.
Another source of performance degradation was tackled by exchanging the standard mutex locks with scalable MCS locks.
Several strategies have been tested and the overall runtime could be reduced by more than 15% for high core numbers where lock contention exists.
Finally the tasking layer was extended with a preliminary version of the internode communication layer and hybrid dispatching.
This will allow to scale the task engine beyond the node boundary.

## Results for 2018/2019
Up until now the task engine was designed solely to strong-scale workloads on a single node.
Exchanging data between nodes was not supported due to the lack of a communication layer.
The aforementioned task engine was extended to support communication between multiple nodes via MPI.
Therefore, the task model had to provide communication and computation tasks.
As an initial step, input and output data were distributed equally among the nodes.
During the simulation each rank will independently compute the forces and potentials of the particles it is responsible for.
Since the rank owning a certain set of data already knows which other ranks need to process it, the communication task is required to send that data.
For such a scheme to be efficient, we need a tasking engine on every rank that operates with multiple workers (threads).
We therefore need a communication library that can handle communication from multiple threads on different ranks.
In our case, we used multithreaded MPI in the following way:
We allow each thread on each rank to send multipoles it has already computed, but we only permit receiving of multipoles by a single thread.
This way we avoid the problem of multiple threads concurrently receiving and writing data.
Initial benchmarks exhibit good scaling, but show room for improvements through reducing/hiding the communication overhead.

## Visits and meetings
{% person haensel_d %} joined the group of {% person balaji_p %} in Mai/June 2016 to develop a tasking scheme for FMSolvr on top of Argobots. This visit was vital to the success of this project, since we require a very flexible and fine-grained tasking scheme with only minimal overhead from the tasking runtime (e.g. Argobots).

## Impact and publications
A master thesis on the extension of the task engine was written by Laura Morgenstern at TU Chemnitz {% cite morgenstern2017 --file external/fmm_project.bib %}.

<!--

-->
{% bibliography --cited --file jlesc.bib %}


## Future plans
The internode communication layer needs to be tested in depth on different platforms.
Especially since we are dealing with latency-critical problems arising in MD simulations, the communication layer overhead needs to be minimized.

## References

{% bibliography --file external/fmm_project.bib %}
