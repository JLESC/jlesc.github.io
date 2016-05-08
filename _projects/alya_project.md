---
layout: page_project
title: Iterative and direct parallel linear solvers in a hybrid MPI/OpenMP high performance computational engineering simulations
date: 2016-03-29
updated: 2016-03-29
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - numerics
keywords:
  -
head: ramet_p
members:
  - agullo_e
  - artigues_a
  - houzeaux_g
  - vazquez_m
---

## Research topic and goals

This research action aims at improving the parallel scalability and robustness of the hybrid MPI/OpenMP high performance computational code Alya developed at BSC by using the parallel linear solvers designed at Inria.
In that framework both parallel sparse direct and hybrid iterative/direct linear solvers will be integrated in the Alya code to study their performance and identify their possible bottlenecks.
This action will contribute to the definition of the global API for the solver stack currently developed at Inria that will ease the integration and testing of the linear solver in any large simulation code.


## Results for 2015/2016

This activity has just started in February 2016, preliminary validation experiments have been performed but no scientific results yet.


## Visits and meetings

* {% person houzeaux_g %} and {% person vazquez_m %} met INRIA team at Bordeaux, 14-15 Oct. 2016.
* {% person houzeaux_g %} met INRIA team at Bordeaux, 24-26 Feb. 2016. 


## Impact and publications

None yet.

<!--

-->

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person agullo_e %} | 0.25 PM |
| {% person artigues_a %} | 2 PM |
| {% person houzeaux_g %} | 2 PM |
| {% person ramet_p %} | 0.25 PM |
| {% person vazquez_m %} | 0.5 PM |


## Future plans
We intend to complete the full integration of the Inria solvers with their current individual API in the Alya code so that scalability studies on different applications representative of Alya simulations can be performed (incompressible/compressible fluid, structure mechanics).
Hopefully some of them will reveal numerical or software features to be further studied.


## References

{% bibliography --file external/alya_project.bib %}
