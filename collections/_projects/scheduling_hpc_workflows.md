---
layout: post
title: Resource Management, Scheduling, and Fault-Tolerance for HPC Workflows
date: 2016-03-21
updated: 2019-05-31
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics:
  - storage
keywords:
head: dorier_m
members:
  - cheriere_n
  - ross_r
  - antoniu_g
  - wozniak_j
  - ibrahim_s
---

## Research topic and goals

This project focuses on challenges posed by the increasing complexity of HPC workflows. To cope with the ever increasing size of data and the resulting increase in the number and complexity of workflows running on Extreme-scale HPC systems, it becomes necessary to share the HPC resources across multiple scientific workflows, as is already the case on cloud infrastructures. The first goal of this research project is to investigate approaches for resource sharing and scheduling that can preserve QoS requirements of scientific workflows running concurrently on a shared HPC system, while ensuring a high resource utilization of the infrastructure. We plan to investigate the possible trade-offs including Isolation vs. performance guarantee, consolidation vs. resource utilization, and dynamicity vs. resource provisioning. Additionally, it becomes necessary to make HPC workflows fault-tolerant at the relevant granularity level. The typical behavior of an HPC workflow when one of its tasks fails it to fail entirely, requiring user intervention to restart it. Yet depending on task dependencies and/or communications, the workflow management system should be able to reschedule a failed task without affecting other independent tasks, as done in the cloud for frameworks such as Hadoop. This project will focus on the Swift/T workflow management system. First we will find a way to provide task-level fault tolerance for independent tasks with no dependencies. The immediate application of this will be in managing ensemble simulations. As a second step we will explore ways to maintain fault tolerance for interdependent tasks, and in particular for tasks linked together with dataflows.

## Results for 2015/2016

Our first sub-goal consisted of investigating the potential gain of sharing resources in a "cloud way" for HPC workflows. This initial study would provide an upper bound of the gain in resource usage when independent workflow share common resources in an HPC platform. This study was mainly conducted by Nathanael Cheriere at Argonne from January to June 2016.

Results obtained using simulations with traces of real workflows showed no clear potential for resource sharing in the context of HPC workflows. Contrary to cloud workflows that can scale up and down depending on usage patterns, most HPC workflows already make the best use they can of the provided parallelism. Sharing resources presents more drawbacks than advantages and, in most cases, degrades resource utilization rather than improving it.

## Results for 2016/2017

The second goal of the project will investigate mechanisms by which an HPC workflow can become fault-tolerant at task-level, so that failure of a single task has the smallest impact possible on the overall workflow. We plan to implement and demonstrate these mechanisms on real HPC workflows. This study was mainly conducted by Matthieu Dorier and Justin Wozniak from November 2016 to March 2017.

In terms of fault-tolerance, we proposed the addition of a new primitive, MPI_Comm_launch, for the MPI standard. This function enables to launch an MPI application inside another MPI application in a fault-tolerant manner. We leveraged a first implementation of MPI_Comm_launch to implement new constructs in the Swift/T language enabling a Swift workflow to be decomposed into sub-workflows. Failures in sub-workflows are reported to the parent workflow without causing it to fails, thus enabling task-level fault tolerance. We demonstrated these new features in the CODES-ESW workflow, a workflow meant for design-space exploration of network simulations.

## Results for 2017/2018

A paper with the aforementioned results has been published at the WORKS 2017 workshop {% cite DorierWORKS2017 --file jlesc.bib %}, held jointly with Supercomputing. We improved the Swift/T usage of MPI_Comm_launch to support launching multiple executables, and started working on in situ analysis use-cases of MPI_Comm_launch, with ADIOS and DataSpaces as transport layers between launched tasks.

## Results for 2018/2019

We worked  with Cray to add support for functionalities similar to MPI_Comm_launch in Cray MPICH. A Paper has been submitted at CUG 2019 on "Implementing and Standardizing In Situ Job Launch for HPC Workflows". In parallel, we started discussing with members of the MPI Forum to have the functionalities added to the MPI standard.

## Visits and meetings

Internship of Nathanael Cheriere at Argonne National Lab from January 2016 to June 2016, under the supervision of Matthieu Dorier and Rob Ross.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}

## Future plans

We plan to propose our MPI_Comm_launch feature to the MPI standard committee. We also plan to use MPI_Comm_launch in multiple other real-life use cases, in particular with in situ analysis workflows.

## References

{% bibliography --file external/scheduling_hpc_workflows.bib %}
