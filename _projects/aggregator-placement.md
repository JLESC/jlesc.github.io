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
We plan to have first results soon.

## Visits and meetings

* Emmanuel Jeannot visited ANL on March 2015
* François Tessier stayed 10 days at ANL on March 2015

## Impact and publications

François Tessier moved from Inria to ANL in February 2016. A part of his work is focusing on this project. 

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


## Person-Month efforts in 2015/2016


{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person jeannot_e %} | 0.5 PM |
| {% person tessier_f %} | 3.0 PM |
| {% person vishwanath_v %} | 0.5 PM |



## Future plans

The next step will be to determine the parameters to consider to compute a near-optimal number of aggregators.
Additionally, we plan to implement the topology-aware aggregator placement once a stable version of data aggregation will be developed.
A new visit could be organized to that purpose. 

## References
