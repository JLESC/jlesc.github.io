---
layout: post
title: Toward taming large and complex data flows in data-centric supercomputing
date: 2016-03-21
updated: 2018-01-01
navbar: Research
subnavbar: Projects
project_url:
status: suspended
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

## Results for 2016/2017
We have taken into account the network topology for mapping aggregators and we propose an optimized buffering system in order to reduce the aggregation cost.
We have validated our approach using micro-benchmarks and the I/O kernel of a large-scale cosmology simulation.
We have showed improvements up to 15x faster for I/O operations compared to a standard implementation of MPI I/O.

## Results for 2017/2018
We have developed TAPIOCA, an MPI-based library implementing an efficient topology-aware two-phase I/O algorithm. TAPIOCA can take advantage of double-buffering and one-sided communication to reduce as much as possible the idle time during data aggregation. We validate our approach at large scale on two leadership-class supercomputers: Mira (IBM BG/Q) and Theta (Cray XC40). On both architectures, we show a substantial improvement of I/O performance compared with the default MPI I/O implementation.

## Visits and meetings

* Emmanuel Jeannot visited ANL on March 2015
* François Tessier stayed 10 days at ANL on March 2015
* Emmanuel Jeannot visited ANL on June 2016
* François Tessier visited Inira on December 2016
* Emmanuel Jeannot and Guillaume Aupy visited ANL on July 2017

## Impact and publications

François Tessier moved from Inria to ANL in February 2016. A part of his work is focused on this project.
Results have been published in the 1st Workshop on Optimization of Communication in HPC runtime systems (IEEE COM-HPC16), in conjunction with SuperComputing 2016 {% cite tmv+16 --file jlesc.bib %}.
We have published our work on Tapioca in Cluster 2017 {%cite tvj17 --file jlesc.bib %}.

{% bibliography --cited --file jlesc.bib %}


## Future plans

The next step will be to determine the parameters to consider to compute a near-optimal number of aggregators.
Additionally, we plan to implement the topology-aware aggregator placement once a stable version of data aggregation will be developed.
We want to extend our approach to any kind of HPC system and especially to the new Theta system.
We also want to work on memory partitioning for workflow performing I/O request. A visit in spring 2018 is scheduled between ANL and INRIA.

## References

{% bibliography --file external/aggregator_placement.bib %}
