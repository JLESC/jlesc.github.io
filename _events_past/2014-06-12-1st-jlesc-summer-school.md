---
layout: page_event
title: 1st JLESC Summer School
date: 2016-02-15
updated:
navbar: Events
event_location: Sophia Antipolis, France
event_start: 2014-06-12
event_end: 2014-06-13
event_short_url:
event_url: http://mescal.imag.fr/membres/arnaud.legrand/research/events/puf_jlpc_workshop_14.php
wayback_url: http://web.archive.org/web/20151228221113/http://mescal.imag.fr/membres/arnaud.legrand/research/events/puf_jlpc_workshop_14.php
kind: summer_school
institute: inria
permalink:
page_type: event_page
---

The Joint Laboratory for Petascale Computing focuses on software challenges found in complex 
high-performance computers. The Joint Laboratory is based at the University of Illinois at 
Urbana-Champaign and includes researchers from the French national computer science institute Inria, 
Argonne National Laboratory, Illinois' Center for Extreme-Scale Computation, and the National Center
for Supercomputing Applications. The Barcelona Supercomputer Center also recently joined this effort. 

The 11th workshop of the INRIA-Illinois-ANL Joint Laboratory will be held at Sophia Antipolis, 
on the French riviera, from June 9th to June 11th 2014.

The first summer school of the Joint-Laboratory will follow at the same location on June 12th-13th. 
Both events are supported by the PUF in the context of the NEXTGN project. 
The theme of this summer school will be on performance metrics, modeling and simulation of large HPC systems. 
This summer school is offered to students (mainly PhD students and post-docs although Master students may also be interested) 
of the collaboration and open to students and faculties outside of the collaboration, if room. 
We are considering a maximum of 30 students. 

### Schedule

Modern computing systems have become increasingly complex and large scale. 
Understanding their performance has thus become dramatically more difficult than it has ever been.
The aim of this summer school is to provide attendees a presentation of modern tools and techniques 
which allow to study the performances of large HPC systems. Four series of lectures (including hands on) 
on trace/workload analysis/visualization and system simulation/emulation will be given by domain experts. 
Although classical API (s.a MPI, CHARM++, OmpSs) will be used to illustrate techniques, the fundamental 
problems remain identical and interesting to any student working with HPC systems and less classical APIs 
or applications. 

Thursday, June 12th 2014, 8:30AM-12PM:<br/> HPC Application Tracing and Analysis (J. Labarta)
: In a first part, we will present the basics of tracing and what the major issues are. 
We will present some of the main tracing environments and try to compare them. 
We will focus on extrae and present some mechanisms that allow to increase scalability. 
We will also describe some of the analysis capabilities motivating such mechanisms and how to use them. 
In particular, we will present a couple of recent developments with clustering and processing sampled data ("folding"). 
We will illustrate the resulting analysis with paraver.
: In a second part, a few traces will be provided and attendees will have the opportunity of analyzing them or even 
to obtain traces from their own code if time allows

Thursday, June 12th 2014, 13:20PM-16:30PM: <br/> HPC Applications Performance Analysis and Debugging (S. Kale)
: Performance of parallel applications is notoriously hard to optimize. 
This gets even more challenging when running a large number of processors, and/or during strong scaling of an 
application to the limit of its scaling. Fortunately, one can obtain detailed performance data in the form of traces or summaries.
However, it requires skill and expertise to use this data to identify the major bottleneck that is holding up performance. 
This is further compounded by the "whack a mole" nature of performance debugging: when you fix one problem, another problem that was 
masked by the first one emerges as the next bottleneck. 

Friday, June 13th 2014, 8:30AM-12PM: <br/> Simulation of HPC systems (M. Quinson)
: Modern computing systems have become increasingly complex and large scale. 
This irreducible complexity of creates a large gap between our understanding of the system and its reality, 
between the facts and our analysis. Simulation is thus an appealing alternative to study such systems. 
Indeed, in silico studies have proved their usefulness in most other scientific and engineering disciplines. 
SimGrid is an open source framework to study the behavior of large-scale distributed systems such as Grids, Clouds, HPC or P2P systems. 
It can be used to evaluate heuristics, prototype applications or even assess legacy MPI applications. 
It is developed and optimized since more than 10 years and allows to develop simulators that are several orders of magnitude faster than 
many ad hoc simulators while relying on fluid (coarse-grain) resource models whose validity has been thoroughly studied. 
These models allow to account for network topology (e.g., contention, performance heterogeneity, communication locality) and resource 
capacity fluctuations as well as non trivial network protocol peculiarities (e.g., protocol switches, fairness, reverse traffic impact).
: This tutorial will provide attendees with clear perspectives on the challenges for experimental research in the area of parallel and 
large-scale distributed computing, and on current technology for conducting experiments with real-world testbeds, emulated testbeds, 
or simulated testbeds.
It will particularly emphasize on the capabilities and limitations of simulation.

Friday, June 13th 2014, 13:20PM-16:30PM: <br/> Reproducible Research (A. Legrand)
: Reproducibility of experiments and analysis by others is one of the pillars of modern science. 
Yet, the description of experimental protocols (particularly in computer science articles) is often lacunar and rarely allows to reproduce a study. 
Such inaccuracies may not have been too problematic 20 years ago when hardware and operating systems were not too complex. However nowadays are 
made of a huge number of heterogeneous components and rely on an software stack (OS, compiler, libraries, virtual machines, …) that are so complex 
that they cannot be perfectly controlled anymore. As a consequence some observations have become more and more difficult to reproduce and to explain 
by other researchers and even sometimes by the original researchers themselves. Although computer systems are theoretically deterministic systems, 
the state explosion problem and the inability to perfectly observe and control their state leave no other option than considering them as rather stochastic systems.
: Yet, the analysis of stochastic systems is more complex and the graphs provided in articles are generally insufficient to draw solid conclusions. 
Although simple graphs may illustrate the point of view of the authors, they rarely convey information about the variability of the system, which is
yet critical to evaluate how much confidence can be put in the analysis.
: In the last decade there has been an increasing number of article withdrawal even in prestigious journals and the realization by both the scientific community 
and the general public that many research results and studies were actually flawed and wrong.
: Open science is the umbrella term of the movement to make scientific research, data and dissemination accessible to all levels of an inquiring society. 
In particular, it encompasses practices such as the use of open laboratory notebooks and reproducible research, which refers to the idea that the ultimate product 
of academic research is the paper along with the full computational environment used to produce the results in the paper such as the code, data, etc. that can be u
sed to reproduce the results and create new work based on the research. 
