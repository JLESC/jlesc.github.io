---
layout: page_project
title: "Extreme-Scale Workflow Tools: Swift, Decaf, Damaris, FlowVR"
date: 2016-03-21
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - storage
keywords:
head: peterka_t
members:
  - wozniak_j
  - dreher_m
  - ross_r
  - antoniu_g
  - ibrahim_s
  - dorier_m
  - raffin_b
---

## Research topic and goals

The goal of the Swift/Decaf/Damaris/FlowVR collaboration is to enhance the programmability of advanced applications composed of simulation and analysis modules. The Decaf project (Peterka), primarily funded by the U.S. Dept. of Energy, is developing a transport layer, high-level data flow primitives (selection, aggregation, pipelining, and buffering), and a high-level data description layer.  Swift (Wozniak), funded through Argonne LDRD, offers a rich, implicitly parallel programming language and scalable, load-balanced runtime.  Damaris (Antoniu) provides dedicated-core asynchronous resources that can be used for I/O, analysis, and visualization. FlowVR (Raffin) is a generic framework for building complex dataflows by plugging components into a Python interface. We intend to compare and contrast these tools and combine some of them to investigate computer science challenges in creating a highly useful, efficient analysis system.

## Results for 2015/2016

 * M. Dorier led the authorship of the ISAV 2015 workshop paper on lessons learned developing all four tools {% cite DorierEtAl2015 %}.
 * M. Dreher and J. Wozniak developed an initial integration plan for Swift and Decaf.
 * M. Dreher presented an initial suite of workflows at the December 2015 meeting.
 * T. Peterka co-organized SC15 BOF on scientific workflows.
 * M. Dreher and B. Raffin integrated the Decaf redistribution component with FlowVR and we are in the process of submitting a Cluster 2016 paper on this research.


## Visits and meetings

None

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person wozniak_j %} | 1 PM |
| {% person peterka_t %} | 1 PM |
| {% person dreher_m %} | 1 PM |
| {% person ross_r %} | 1 PM |
| {% person antoniu_g %} | 1 PM |
| {% person ibrahim_s %} | 1 PM |
| {% person dorier_m %} | 1 PM |
| {% person raffin_b %} | 1 PM |

## Future plans

This summer we will implement the main integration between Decaf and Swift. A paper about the MPI details of integration between Swift and Decaf would be a good submission to EuroMPI. A paper about realistic LAMMPS or HACC simulation/analysis workflows would be a good submission to SC.

## References
