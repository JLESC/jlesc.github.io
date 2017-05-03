---
layout: page_project
title: Toward taming large and complex data flows in data-centric supercomputing
date: 2016-03-21
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - storage
keywords:
  - Two-phase I/O
  - Aggregator placement
  - Resource modeling
  - Cross-layer optimization
head: jeannot_e
members:
  - vishwanath_v
  - tessier_f
---

## Research topic and goals 

Data-centric supercomputing is of increasing importance to meet national and international scientific missions and are becoming an integral part of many traditional scientific computational science domains including climate, cosmology, engineering, combustion, and astrophysics.
These applications require the ability to rapidly and reliably compute, move, and manage large amounts of data through a deep and complex interconnect and memory architectures having diverse sources and destinations, including scientific instruments, storage systems, supercomputers, and analysis systems.

Understanding, characterizing, and transforming application data flows over a range of architectures is a difficult task that requires significant time.
The difficulty lies in effectively abstracting the system architecture, relating the complex organization of the system architecture with the data movement requirements in both space and time, such that the information can be used to explore tradeoffs (e.g., power consumption versus execution time); and transformations and mapping that may result in better performance (e.g., moving compute to the data or process mapping heuristics).
Moreover, because of budget constraints, we are witnessing these infrastructures being shared by diverse, concurrent applications including those that require data-intensive flows.
New approaches are required for taking us to the next level in understanding interactions between system infrastructure and application data flows at extreme scales.

We propose an integrated research program bringing together experts in network science and modeling, application modeling, high-performance runtime system software, and algorithm design to address these issues and improve understanding of the relationships between data-centric application flows and architecture features of future systems.
At the heart of this program is a framework for modeling and abstracting the resource characteristics (e.g., topology and nonvolatile memory), abstracting application data flow behavior, including quality of service, I/O, communications, and developing cross-layer optimal transformations for mapping flows effectively to underlying resources.


## Results for 2015/2016

We have worked on modeling the problem : communication cost, aggregator placement, I/O phases, etc. 
We have proposed placement strategies but they need to be refined and tested.
A preliminary implementation is being developed in a cosmology code called HACC I/O.
we have taken into account the network topology for mapping aggregators and we propose an optimized buffering system in order to reduce the aggregation cost. 
We have validated our approach using micro-benchmarks and the I/O kernel of a large-scale cosmology simulation.
We have showed improvements up to 15× faster for I/O operations compared to a standard implementation of MPI I/O.


## Visits and meetings

* Emmanuel Jeannot visited ANL on March 2015
* François Tessier stayed 10 days at ANL on March 2015
* Emmanuel Jeannot visited ANL on June 2016
* François Tessier visited Inira on December 2016

## Impact and publications

François Tessier moved from Inria to ANL in February 2016. A part of his work is focused on this project. 
Results have been published in the 1st Workshop on Optimization of Communication in HPC runtime systems (IEEE COM-HPC16), in conjunction with SuperComputing 2016 {% cite tmv16+ --file jlesc.bib %}

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


## Future plans

The next step will be to determine the parameters to consider to compute a near-optimal number of aggregators.
Additionally, we plan to implement the topology-aware aggregator placement once a stable version of data aggregation will be developed.
We want to exted our approach to any kind of HPC system and especially to the new Theta system.
Visists between Inria and ANL are planned for the summer 2017. 

## References

{% bibliography --file external/aggregator_placement.bib %}
