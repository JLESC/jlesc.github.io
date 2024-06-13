---
layout: post
title: Network Simulations and Topology-aware Communications
date: 2016-09-28
updated: 2018-01-01
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics:
  - storage
keywords:
head: dorier_m
members:
  - cheriere_n
  - ross_r
  - antoniu_g
  - ibrahim_s
---

## Research topic and goals

High-radix direct network topologies such as Dragonfly have been proposed for
petascale and exascale supercomputers because they ensure fast interconnections
and reduce the cost of the network compared with traditional network topologies.
The design of new machines such as Theta with a Dragonfly network present an opportunity
to further improve the performance of distributed applications by making the algorithms
aware of the topology. Indeed, current algorithms do not consider the topology and thus
lose numerous opportunities of optimization for performance that have been created by the topology.
This project aims to explores ways to exploit the strengths of the Dragonfly network topology
to propose and evaluate optimized algorithms  global communication operations, such as AllGather, Scatter, etc.

## Results for 2016/2017

We studied and extended existing algorithms for collective communication operations and use CODES,
an event-driven simulator, to evaluate them. The simulations show expected results for AllGather, as well as surprising ones for Scatter:
the naive algorithm perform oustandingly well on Dragonfly because they exploit the characteristics
of the routers in the network. In particular, the Scatter operation could be accelerated up
by a factor up to 2 times using a hardware aware algorithm.

These results have been accepted as a poster for the ACM Student Research Competition at SC 2016 {% cite CheriereEtAl2016 --file jlesc.bib %}, and Nathanael Cheriere won the 2nd prize of the ACM SRC.

## Results for 2017/2018

We developped a Swift/T-based workflow to automatize a large number of experiments using CODES, in order to boost design-space exploration. This workflow helped us reiterate our experiments with network models matching Argonne's Theta machine. We submitted a paper at CCgrid 2018 presenting the results of these experiments.

## Visits and meetings

Internship of Nathanael Cheriere at Argonne National Lab from January 2016 to June 2016, under the supervision of Matthieu Dorier and Rob Ross.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Future plans

This project is finished.

## References
