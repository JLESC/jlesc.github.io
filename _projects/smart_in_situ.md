---
layout: page_project
title: Smart In Situ Visualization
date: 2016-03-21
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - storage
keywords:
head: antoniu_g
members:
  - peterka_t
  - ross_r
  - dorier_m
  - sisneros_r
  - rahmani_l
  - bautista_gomez_l
  - bouge_l
---

## Research topic and goals

While many parallel visualization tools now provide in situ visualization capabilities, the trend has been to feed such tools with what previously was large amounts of unprocessed output data and let them render everything at the highest possible resolution. This leads to an increased run time of simulations that still have to complete within a fixed-length job allocation. In this research topic, we aim to provide new approaches to in situ visualization that are capable of detecting interesting regions in the data produced by the simulation, in order to reconfigure and optimize the visualization/analysis pipeline at run time to improve performance and help the scientist focus on relevant data.

## Results for 2015/2016

We tackled the challenge of enabling in situ visualization under performance constraints. Our approach shuffles data across processes according to its content and filters out part of it in order to feed a visualization pipeline with only a reorganized subset of the data produced by the simulation. Our proposed framework monitors its own performance and reconfigures itself dynamically to achieve the best possible visual fidelity within predefined performance constraints. Experiments on the Blue Waters supercomputer with the CM1 simulation show that our approach enables a 5x speedup and is able to meet performance constraints. The results of this work are available in a research report  {% cite DorierEtAlRR2016 %} and have been submitted to IEEE Cluster 2016.


## Visits and meetings

None

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person peterka_t %} | 1.5 PM |
| {% person ross_r %} | 1 PM |
| {% person antoniu_g %} | 1.5 PM |
| {% person dorier_m %} | 3 PM |
| {% person sisneros_r %} | 1.5 PM |
| {% person bautista_gomez_l %} | 1.5 PM |
| {% person rahmani_l %} | 3 PM |
| {% person bouge_l %} | 1.5 PM |

## Future plans

Our short term plan is to extend our submitted Cluster paper into a journal paper including more experiments and more use cases.

We plan to investigate whether more elaborate redistribution algorithms are necessary in order to achieve the same results at larger scale and on platforms with lower network performance. We will also investigate finding relevant regions in multivariate data, as well as other visualization scenarios and other simulations.

## References
