---
layout: page_project
title:  Automatic I/O scheduling algorithm selection for parallel file systems
date: 2016-09-08
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - storage
keywords:
  -
head: cortes_t
members: 
  - zanon_f
  - nou_r
  - mehaut_j
  - navaux_p

---

## Research topic and goals
This short proposal describes an ongoing research collaboration
between researchers from the Barcelona Supercomputing Center (BSC) and
the Federal University of Rio Grande do Sul (UFRGS). This
collaboration focuses on automatic I/O scheduling algorithm selection
for parallel file systems.  

During IOLanes European project (FP7-248615), Ramon Nou, from BSC,
used pattern matching to automatically select the best disk scheduling
algorithm (in the level of block requests to a device) depending on
the access pattern observed at a given moment.  

Francieli Zanon Boito,
from UFRGS, focused on a similar subject during her Ph.D. thesis
(concluded earlier this year). On her thesis, machine learning
algorithms were used to generate decision trees based on previously
obtained results to select the best scheduling algorithm to parallel
file system servers (in the context of file offset requests). This
decision is taken based on information about applications' access
pattern and the servers' platform characteristics.  

Due to the good
results obtained with both strategies, during the last JLESC workshop
(in Barcelona), Francieli and Ramon discussed this collaboration,
aiming at using the pattern matching strategy to select between
scheduling algorithms in the context of parallel file systems. In
order to validate this idea, the technique will be implemented in the
AGIOS scheduling library, developed at UFRGS, and tested with the PVFS
parallel file system.  Besides Francieli and Ramon, other people from
their research groups will be involved in this collaboration, and
joint publications are expected.


BSC, INRIA and UFRGS are involved
in the H2020/EUB HPC4E project. HPC4E applications would be interesting as use cases
for experimentations to validate the contributions of this JLESC collaboration.

## Results for 2015/2016
We have results with an armed-bandid approach, which tries to select the I/O scheduler based on a probability-guided approach. The results are better than the original OrangeFS behaviour. This approach was used to see if AGIOS and the workloads are working with changes of the scheduler every 5 seconds (i.e.). 

## Results for 2016/2017
We have some new results, but the progress is slow due to the lack of personnel.
Key points: 
* Armed bandit implementation, with a 4s window, show a 15% of performance improvement over OrangeFS original scheduler.
* We analyzed MPI-IO Test benchmark with different patterns, request size, and processes.
* We provided 120 executions to the DTW pattern matching mechanism from IOAnalyzer.
* The precision of the match goes from 0.65 to 0.8, depending on the DTW threshold selected.
* The executions using different orders, provide a right prediction rate over 0.75.
* We also predict the next pattern, the results show that the prediction is 70% right.

## Visits and meetings
Email interaction. Meetings in JLESC'16 at Kobe.
Telco to discuss new results.

## Impact and publications
None yet.

<!--
{% comment %}
=============================
== CITING OWN PUBLICATIONS ==
=============================

You can list your own publications below in case you did not cite them in the text
(which you should do, though).
Use the Liquid citing syntax as explained in the wiki:
https://github.com/JLESC/jlesc.github.io/wiki/Markup-Language#cite-and-list-publications
Remember to use the `--file jlesc.bib` with the `cite` tag.

=====================================
== START HERE WITH YOUR ADDITIONAL REFERENCES ==
{% endcomment %}



{% comment %}
== NO MORE BELOW THIS ==
========================
{% endcomment %}
-->

{% bibliography --cited --file jlesc.bib %}


<!-- ## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person zanon_f %} | 6.0 PM |
| {% person nou_r %} | 6.0 PM |

## Person-Month efforts in 2017

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person zanon_f %} | 3 PM |
| {% person nou_r %} | 3 PM | -->

## Future plans
As the results are promising the next steps are to put the pattern matching or similar algorithm to learn about the running workload and try to select the best expected scheduler for the next period. 

The project has very low interaction and progress during 2017, but it is not cancelled.

## References



{% bibliography --file external/automatic_scheduler_project.bib %}
