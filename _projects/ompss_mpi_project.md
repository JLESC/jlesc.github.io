---
layout: page_project
title: Hybrid resilience for MPI + tasks codes
date: 2016-03-22
updated:
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics: 
  - resilience
keywords: 
  - OmpSs+MPI
  - Fault-tolerance protocol
head: subasi_o
members: 
  - martsinkevich_t
  - labarta_j
  - cappello_f
  - unsal_o
---

## Research topic and goals

The research topic is to design a fault tolerance protocol for applications that adopt the hybrid OmpSs+MPI programming model.

## Results for 2015/2016

The contributors introduced an extended version of NanoCheckpoints {% cite SubasiEtAl2015 %} that provides a resiliency solution for
OmpSs+MPI applications. 
It can gracefully handle faults by rolling back and restarting tasks in which a fault has occurred and transparently resolves recovery of tasks that have MPI calls inside thanks to the message logging.

Evaluation of the execution in the presence of faults showed that task granularity and coupling play a very important role in hiding task recovery: The more there are tasks that can be executed independently while some other task is recovering from a fault, the less impact faults will have on the total execution time. 
However, if the program was not taskified well, recovery of even one task may slow down the program significantly.

In summary, the contributions were: 

* A scalable fault tolerance protocol for hybrid task-parallel message passing applications that has a reasonable fault-free overhead.
* An extended evaluation of a fault-free execution as well as an execution with faults and discussed what may have a big impact on the execution in both cases.

## Visits and meetings

{% person martsinkevich_t %} visited BSC for three months in summer 2015.

## Impact and publications

A paper {% cite MartsinkevichEtAl2015 %} has been published in Cluster 2015 proceedings as part of FTS 2015 workshop.

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person martsinkevich_t %} | 5.0 PM |
| {% person subasi_o %} | 2.0 PM |

## Future plans

There will be a journal submission based on this work.

## References
