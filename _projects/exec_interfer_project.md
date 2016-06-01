---
layout: page_project
title: Modeling and avoiding execution interferences
date: 2016-06-01
updated: 2016-06-01
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - storage
keywords:
  -
head: bauer_g
members:
  - bleuse_r
  - cappello_f
  - lucarelli_g
  - trystram_d
  - wagner_f
---

## Research topic and goals

The recent architectural evolutions of the interconnection network pose two main challenges: first, the community is proposing new
topologies {% cite BestaM2014Slim --file external/exec_interfer_project.bib %}, {% cite TuncerO2015PaC --file external/exec_interfer_project.bib %}; and second, the network is now unique within the machine.
Sharing a unique, multi-purpose interconnection network begets complex interactions between running applications, and it has a strong impact on the
performances. More precisely, one can identify two main types of interleaved flows: flows induced by data exchanges for computations, and I/O flows.
This collaboration aims at designing new scheduling algorithms that better take into account the challenges of interconnecting compute nodes with a
unique and multiple-purpose network.


## Results for 2015/2016

Blue~Waters's network topology makes scheduling at the machine's scale a real challenge {% cite EnosJ2014Topology --file external/exec_interfer_project.bib %}. 
We studied the execution of jobs on Blue~Waters, and derived a generic model of such machines {% cite BleuseR2016Scheduling --file jlesc.bib %}.
For example, the new topologies are built using local heterarchic (contrary of hierarchical) networks that are interconnected by a low depth hierarchy {% cite BestaM2014Slim --file external/exec_interfer_project.bib %}, {% cite TuncerO2015PaC --file external/exec_interfer_project.bib %}.
The constraints arise from the distribution of the heterogeneous nodes within the topology.
Heterogeneity may come from various architecture of computing nodes, or mixed workloads of computing and analysis, or nodes dedicated to I/O.
We do not take such constraints into account in a quantitative manner.
We rather translate these constraints in geometric properties: allocations have to be convex (in order to limit interferences between different jobs), or need to embed specific designated nodes.

## Visits and meetings

{% person bleuse_r %} spent 3 weeks at NCSA in winter 2015

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person trystram_d %} | 0.5 PM |
| {% person wagner_f %} | 0.5 PM |
| {% person lucarelli_g %} | 0.5 PM |
| {% person bleuse_r %} | 1.5 PM |


## Future plans

The model detailed above has been welcomed with interest by the scheduling community.
We identified two ideas we would like to explore.
The interleaved flows hinder the overall performances of the applications.
The convexity constraint (with respect to the underlying network topology) allows to tackle some interferences.
Furthermore, constraining applications to be allocated near the I/O nodes they are using might be a way to completely remove interferences.
Which strategy can be used to enforce such constraints at a reasonable cost?
What is the impact of such constraints on machines' utilization?

On the other hand, given a requested amount of computing nodes, many convex shapes are valid allocations.
We are interested in studying how to choose a shape in order to better exploit the machines.
Similarly, we are also interested in studying if allocating more resources than requested may simplify the allocation phase without losing too much computation
power.


## References

{% bibliography --file external/exec_interfer_project.bib %}
