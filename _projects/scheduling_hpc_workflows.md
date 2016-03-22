---
layout: page_project
title: Resource Management and Scheduling for Data-Intensive HPC Workflows
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
---

## Research topic and goals

To cope with the ever increasing size of data and the resulting increase in the number and complexity of workflows running on Extreme-scale HPC systems, it becomes necessary to share the HPC resources across multiple scientific workflows, as is already the case on cloud infrastructures. The goal of this research project is to investigate approaches for resource sharing and scheduling that can preserve QoS requirements of scientific applications running concurrently on a shared HPC system, while ensuring a high resource utilisation of the infrastructure. We plan to investigate the possible trade-offs including Isolation vs. performance guarantee, consolidation vs. resource utilisation, and dynamicity vs. resource provisioning.

## Results for 2015/2016

This project effectively started in 2016.

## Visits and meetings

Internship of Nathanael Cheriere at Argonne National Lab from January 2016 to June 2016, under the supervision of Matthieu Dorier and Rob Ross.

## Impact and publications

This project effectively started in 2016.

{% bibliography --cited --file jlesc.bib %}

## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person cheriere_n %} | 6 PM |
| {% person dorier_m %}   | 2 PM |
| {% person ross_r %}     | 1 PM |
| {% person ibrahim_s %}  | 2 PM |
| {% person antoniu_g %}  | 1 PM |


## Future plans

This project started in 2016. Currently we are investigating the limitations of the current static allocations of the HPC resources when running HPC workflows (i.e., allocating a fixed set of cores for a fixed duration) and the resulting resource waste. Our goal is to introduce new dynamic resource management techniques for workflow-type jobs running on HPC platforms. 

## References
