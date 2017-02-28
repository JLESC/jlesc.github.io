---
layout: page_project
title: Comparison of Meshing and CFD Methods for Accurate Flow Simulations on HPC systems
date: 2016-03-02
updated: 2016-03-02
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - apps
  - numerics
keywords:
  - meshing
  - CFD
  - accuracy analysis
  - performance analysis
head: lintermann_a
members:
  - tsubokura_m
  - onishi_k
---

## Research topic and goals

The expertise of the collaborators at the two centers AICS and JSC lies in the development of methods for Computational Fluid Dynamics (CFD) simulations on HPC systems.
Despite the high efficiency of the simulation codes developed within the two groups on the K-computer and the JUQUEEN, respectively, the methods for the computation of the flow and meshing are quite different and have their advantages and disadvantages.
While the AICS code relies on the Building Cube Method {% cite Ishikawa2011 --file external/mcfd_cmp_project.bib %}, {% cite Onishi2014 --file external/mcfd_cmp_project.bib %} to generate the mesh and uses a structured solver with a Finite Difference method, the JSC code solves for the flow variables on hierarchical Cartesian meshes {% cite Lintermann2014 --file external/mcfd_cmp_project.bib %} using a Finite Volume {% cite Hartmann2010 --file external/mcfd_cmp_project.bib %}, {% cite Schneiders2016 --file external/mcfd_cmp_project.bib %} or a Lattice-Boltzmann method {% cite Lintermann2013 --file external/mcfd_cmp_project.bib %}.
The aim of the proposed JLESC cooperation is to compare the accuracy and efficiency of the applied methods in the two CFD simulation codes on the two hardware architectures based on predefined benchmark cases.
Within this scope, porting of the simulation software to both HPC systems, the K-computer and the JUQUEEN, is planned.
This project will not only help to further develop an understanding for computational methods for large-scale CFD simulations for the next supercomputer generation, but will also characterize the efficiency of the current codes on different hardware architectures.
That is, by a performance analysis of both codes on both machines drawbacks in current implementations will be exposed and architectural features will be explored for code acceleration.
Such a cooperation is only possible by bilateral support activities which will lead to a knowledge exchange on the hardware side, in CFD methods, parallelization, and the associated meshing techniques.
Hence, expertises of the centers in these fields will strongly be enhanced in the course of this project.
To foster the cooperation, mutual short-time stays of the involved scientists are planned.

## Results for 2015/2016

Both parties are about to create accounts on both machines such that the first task, i.e., the porting of the individual codes can be performed:

* accounts have been created on K computer and JUQUEEN
* AICS code has been ported to JUQUEEN
* Scalability analysis of the AICS code has been performed on JUQUEEN
* JSC C++11 code does not compile on K computer using the Fujitsu compiler, error messages will be collected and reported to AICS for compiler improvements

## Visits and meetings

No visits yet.

## Impact and publications
No publications yet.

{% bibliography --cited --file jlesc.bib %}

## Future plans

After accounts have been created on both machines, both groups will start to port their own codes to the according machines.
Meanwhile, benchmarking cases for the performance and the accuracy analysis will be defined.
Subsequently, simulations will be run to test the performance and accuracy.
Finally, best-practice methods for high-performance CFD simulations will be defined, i.e., the results of the simulations will be evaluated to find optimal numerical methods for future CFD applications.


## References

{% bibliography --file external/mcfd_cmp_project.bib %}
 
