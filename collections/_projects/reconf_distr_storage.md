---
layout: post
title: Reconfiguring Distributed Storage Systems on HPC infrastructures
date: 2017-01-01
updated: 2020-01-01
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics:
  - storage
keywords:
head: antoniu_g
members:
  - cheriere_n
  - dorier_m
  - ross_r
  - carns_p
---

## Research topic and goals

As parallel file systems reach their limits in HPC, an alternative approach is emerging:
the creation of data services tailored to the needs of the application that uses it
{% cite Dorier2018Methodology --file external/reconf_distr_storage.bib %}.
In order to do so, a set of building blocks for data services (e.g. membership service, key-value store, ...)
has been developed as part of the Mochi project (https://www.mcs.anl.gov/research/projects/mochi/).
In particular, some applications (typically workflows) have requirements in number of machines
that vary over time, thus being able to rescale efficiently can be needed for data services
co-deployed with malleable applications. Preliminary work by Cheriere et al. showed that
the reconfiguration could be done in a short time when the amount of data per node is balanced.
Our work in this context is to investigate the use of rescaling of distributed storage systems in HPC environments.


## Results for 2017/2018

We modelled the duration of the commision and decommission operations, for which we obtained
theoretical lower bounds. Then we considered HDFS as a use case and we show that our model
can explain the measured commission and decommission times. The existing decommission mechanism
of HDFS is good when the network is the bottleneck, but could be accelerated by up to a factor 3
when the storage is the limiting factor. We also show that commission in HDFS can largely be improved.
The results on theoretical decommission time have been published at the IEEE BigData 2017
conference {% cite Cheriere2017How --file jlesc.bib %}. Results for the commission time have later
been added and an extended paper has been submitted and is under review for Elsevier JPDC.
These additional results are independently available as a research report {% cite Cheriere2018LowerCommission --file jlesc.bib %}.

## Results for 2018/2019

We introduced Pufferbench {% cite Cheriere2018Pufferbench --file jlesc.bib %}, a benchmark for evaluating
how fast one can scale up and down a distributed storage system on a given infrastructure and, thereby,
how viably can one implement storage malleability on it. Besides, it can serve to quickly prototype and evaluate mechanisms
for malleability in existing distributed storage systems. We validate Pufferbench against theoretical
lower bounds for commission and decommission: it can achieve performance within 16% of them.
We use Pufferbench to evaluate in practice these operations in HDFS: commission in HDFS could be
accelerated by as much as 14 times! Our results show that: (1) the lower bounds for commission
and decommission times we previously established are sound and can be approached in practice;
(2) HDFS could handle these operations much more efficiently; most importantly,
(3) malleability in distributed storage systems is viable and should be further leveraged
for Big Data applications.

We also studied from a theoretical point of view the potential opportunities provided by
relaxing fault tolerance during decommission operations. Results of this work are available
in a research report {% cite Cheriere2018LowerRelaxed --file jlesc.bib %} and have been submitted to IEEE/ACM CCgrid 2019.

Furthermore, we focused on understanding the requirements of distributed storage systems
co-deployed with HPC-applications, designed a rescaling mechanism able to meet these
requirements, and implemented it.

## Results for 2019/2020

We developed PufferScale, a rescaling scheduler that aims to be integrated within Mochi
microservices {% cite Dorier2018Methodology --file external/reconf_distr_storage.bib %}.
Pufferscale was demonstrated with a set of microservice representative of a storage
system designed for High Energy Physics applications, and evaluated on Grid'5000.
This work led to a paper accepted for publication at IEEE/ACM CCgrid 2020 {% cite Cheriere2020Pufferscale --file jlesc.bib %}.

Additionally, theoretical work on quantifying rescaling performance was accepted for
publication in the Elsevier JPDC journal in early 2020 {% cite Cheriere2020HowFast --file jlesc.bib %}.

## Visits and meetings

Nathanael Cheriere visited Argonne National laboratory from September to December 2018
(2.5 months) and developed Pufferscale, a rescaling scheduler that keeps the load balanced
across the nodes, while ensuring the speed and stability of the rescaling operations.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}

## Future plans

We intend to explore how transient storage systems can be leveraged to support elastic in situ analytics.

## References

{% bibliography --file external/reconf_distr_storage.bib %}
