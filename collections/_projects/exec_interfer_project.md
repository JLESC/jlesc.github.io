---
layout: post
title: Modeling and avoiding execution interferences
date: 2016-06-01
updated: 2017-01-01
navbar: Research
subnavbar: Projects
project_url:
status: suspended
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
We studied the execution of jobs on Blue~Waters, and derived a generic model of such machines {% cite BleuseR2017Scheduling --file jlesc.bib %}.
For example, the new topologies are built using local heterarchic (contrary of hierarchical) networks that are interconnected by a low depth hierarchy {% cite BestaM2014Slim --file external/exec_interfer_project.bib %}, {% cite TuncerO2015PaC --file external/exec_interfer_project.bib %}.
The constraints arise from the distribution of the heterogeneous nodes within the topology.
Heterogeneity may come from various architecture of computing nodes, or mixed workloads of computing and analysis, or nodes dedicated to I/O.
We do not take such constraints into account in a quantitative manner.
We rather translate these constraints in geometric properties: allocations have to be convex (in order to limit interferences between different jobs), or need to embed specific designated nodes.

## Results for 2016/2017

The model proposed last year has been welcomed with interest by the scheduling
community.
The convexity constraint (with respect to the underlying network topology)
allows to tackle some interferences.
Constraining applications to be allocated near the I/O nodes they are using
might be a way to completely remove interferences.

We refined the model, by precising geometric constraints/metrics of interest:
contiguity, convexity, compacity, proximity, and locality {% cite XXX %}.
We studied the algorithmic complexity of various instantiations (notably
enforcing convexity and locality constraints at the same time).
We proposed fast approximation algorithm for these instantiations.

## Visits and meetings

{% person bleuse_r %} spent 3 weeks at NCSA in winter 2015

## Impact and publications

{% bibliography --cited --file jlesc.bib %}



## Future plans

Some simple instantiations of the model have been studied.
The next step is to study, by simulation with traces of Blue~Waters, how these
algorithms behave at scale: what is the cost of enforcing these constraints?
While the algorithms studied so far have proven performance guarantees in worst
case, we are interested in studying fast heuristics, and comparing them to the
guaranteed algorithms.

The convexity constraint might be a too strong constraint when combined with
the locality constraint: how can we relax the convexity constraint while
keeping good properties?

On the other hand, given a requested amount of computing nodes, many convex shapes are valid allocations.
We are interested in studying how to choose a shape in order to better exploit the machines.
Similarly, we are also interested in studying if allocating more resources than requested may simplify the allocation phase without losing too much computation
power.


## References

{% bibliography --file external/exec_interfer_project.bib %}
