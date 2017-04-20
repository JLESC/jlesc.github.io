---
layout: page_project
title: Resource Management, Scheduling, and Fault-Tolerance for HPC Workflows
date: 2016-03-21
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics: 
  - storage
keywords:
head: ibrahim_s
members:
  - cheriere_n
  - dorier_m
  - ross_r
  - antoniu_g
  - wozniak_j
---

## Research topic and goals

This project focuses on challenges posed by the increasing complexity of HPC workflows. To cope with the ever increasing size of data and the resulting increase in the number and complexity of workflows running on Extreme-scale HPC systems, it becomes necessary to share the HPC resources across multiple scientific workflows, as is already the case on cloud infrastructures. The goal of this research project is to investigate approaches for resource sharing and scheduling that can preserve QoS requirements of scientific applications running concurrently on a shared HPC system, while ensuring a high resource utilisation of the infrastructure. We plan to investigate the possible trade-offs including Isolation vs. performance guarantee, consolidation vs. resource utilisation, and dynamicity vs. resource provisioning. Additionaly, HPC workflows pose important challenges related to fault-tolerance. When a workflow fails, we need to make sure this does not affect other independent workflows. Inside a workflow when a task fails, the workflow management system should be able to reschedule the task without affecting other independent tasks.

## Results for 2015/2016

### Goal:

Our first sub-goal consisted of investigating the potential gain of sharing resources in a "cloud way" for HPC workflows. This initial study would provide an uper bound of the gain in resource usage when independent workflow share common resources in an HPC platform. This study was mainly conducted by Nathanael Cheriere at Argonne from January to June 2016.

### Results:

Results obtained using simulations with traces of real workflows showed no clear potential for resource sharing in the context of HPC workflows. Contrary to cloud workflows that can scale up and down depending on usage patterns, most HPC workflows already make the best use they can of the provided parallelism. Sharing resources presents more drawbacks than advantages and, in most cases, degrades resource utilization rather than improving it.

## Visits and meetings

Internship of Nathanael Cheriere at Argonne National Lab from January 2016 to June 2016, under the supervision of Matthieu Dorier and Rob Ross.

## Impact and publications

None yet.

{% bibliography --cited --file jlesc.bib %}


## Future plans

We plan to investigate the fault-tolerance aspect of HPC workflows and propose solutions to task-level fault-tolerance.

## References

{% bibliography --file external/scheduling_hpc_workflows.bib %}
