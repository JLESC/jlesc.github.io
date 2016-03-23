---
layout: page_project
title: Dynamic load balancing with Pampa in Alya
date: 2016-03-22
updated: 
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - numerics
  - prog_lang
keywords:
  - dynamic load balance with MPI
  - parallel mesh partitioning
  - Alya
head: houzeaux_g
members:
  - vazquez_m
  - mehta_v
  - jeannot_e
  - lachat_c
---

## Research topic and goals
The objective of this project is to use a runtime repartitioning library PAMPA {% cite LachatEtAl2014 --file external/pampa_project.bib %}, {% cite MbengoueEtAl2013 --file external/pampa_project.bib %} to dynamically load balance a high performance computational mechanics code Alya {% cite HouzeauxEtAl2009 --file external/pampa_project.bib %}, {% cite HouzeauxEtAl2011 --file external/pampa_project.bib %}, {% cite VazquezEtAl2015 --file external/pampa_project.bib %}. 
The main application is the particle transport in a fluid. 
 
In Alya, the transport of particles in a fluid is achieved using two parallel instances of the code. 
One instance is in charge of solving the flow equation and the other one of transporting the particles. 
The velocity field is sent from the first to the second one at the end of each time step through MPI. 
If a classical mesh partitioning based on the balancing of the number of elements is performed, the particles are likely to be located in very few subdomains, which obviously leads to a very poor load balance. 
In this project we aim at implementing the Pampa library in Alya in order to redistribute the elements among the MPI processes
in order to dynamically balance the computation of particle transport.

## Results for 2015/2016
The work have just started. 
The data structure required by Pampa was coded in Alya and Pampa was interfaced with Alya.

## Visits and meetings

* {% person houzeaux_g %} and {% person vazquez_m %} met INRIA team at Bordeaux, 14-15 Oct. 2016.
* {% person houzeaux_g %} and {% person mehta_v %} met INRIA team at Bordeaux, 24-26 Feb. 2016. 
* Visit of {% person lachat_c %} and {% person jeannot_e %} at BSC forecast for spring. 

## Impact and publications
The first objective of this project is to dynamically load balance the particle transport.
To achieve this, many efforts are required to reorganize the data structure in Alya to fit with Pampa's. 
But among other features, Pampa allows parallel mesh adaptation and redistribution. 
Therefore all these efforts will enable to further use Pampa to perform mesh adaptation in Alya:

* Dynamic load balance for other physical modules 
* Mesh adaptivity


## Person-Month efforts in 2015/2016

The efforts of the participants so far are as follows:

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person houzeaux_g %}   | 3.0 PM |
| {% person vazquez_m %}    | 2.0 PM |
| {% person mehta_v %}      | 3.0 PM |
| {% person jeannot_e %}    | 0.5 PM |


## Future plans

* Implementation
* Continuous validation
* Application to particle transport
* Scalability tests and performance analysis


## References
{% bibliography --file external/pampa_project.bib %}
