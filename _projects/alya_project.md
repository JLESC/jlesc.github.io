---
layout: page_project
title: Iterative and direct parallel linear solvers in a hybrid MPI/OpenMP high performance computational engineering simulations
date: 2016-03-29
updated: 2016-03-29
navbar: Research
subnavbar: Projects
project_url:
status: running
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

<!-- ## Results for 2015/2016

This activity has just started in February 2016, preliminary validation experiments have been performed but no scientific results yet. -->

## Results for 2016/2017

A database with testcases has been created on Marenostrum. This database includes a series of representative examples to test unsymmetric, symmetric and SPD matrices. In addition, different mesh topologies have been considered to assess the effects of mesh anisotropy, computational domain elongation, etc. 
Benchmarking is currently carried out to compare Alya internal solvers and MAPHYS.

## Results for 2017/2018

1. Full integration of the Inria solvers with their current individual API in the Alya code.
2. Scalability studies carried out on for CFD and solid mechanics applications.

## Visits and meetings

* {% person houzeaux_g %} and {% person vazquez_m %} met INRIA team at Bordeaux, 14-15 Oct. 2016.
* {% person houzeaux_g %} met INRIA team at Bordeaux, 24-26 Feb. 2016. 
* INRIA met BSC team at Barcelona, Nov. 2016. 
* {% person houzeaux_g %} visits INRIA, Nov. 2017.

## Impact and publications

None yet.

<!--

-->

{% bibliography --cited --file jlesc.bib %}


## Future plans
We intend to complete the full integration of the Inria solvers with their current individual API in the Alya code so that scalability studies on different applications representative of Alya simulations can be performed (incompressible/compressible fluid, structure mechanics).
Hopefully some of them will reveal numerical or software features to be further studied.


## References

{% bibliography --file external/alya_project.bib %}
