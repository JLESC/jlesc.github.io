---
layout: post
title: Smart In Situ Visualization
date: 2016-03-21
updated: 2016-03-21
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics:
  - storage
keywords:
head: antoniu_g
members:
  - peterka_t
  - ross_r
  - dorier_m
  - sisneros_r
  - rahmani_l
  - bautista_gomez_l
  - bouge_l
---

## Research topic and goals

While many parallel visualization tools now provide in situ visualization capabilities, the trend has been to feed such tools with what previously was large amounts of unprocessed output data and let them render everything at the highest possible resolution. This leads to an increased run time of simulations that still have to complete within a fixed-length job allocation. In this research topic, we aim to provide new approaches to in situ visualization that are capable of detecting interesting regions in the data produced by the simulation, in order to reconfigure and optimize the visualization/analysis pipeline at run time to improve performance and help the scientist focus on relevant data.

## Results for 2015/2016

We tackled the challenge of enabling in situ visualization under performance constraints. Our approach shuffles data across processes according to its content and filters out part of it in order to feed a visualization pipeline with only a reorganized subset of the data produced by the simulation. Our proposed framework monitors its own performance and reconfigures itself dynamically to achieve the best possible visual fidelity within predefined performance constraints. Experiments on the Blue Waters supercomputer with the CM1 simulation show that our approach enables a 5x speedup and is able to meet performance constraints. The results of this work are available in a research report  {% cite DorierEtAlRR2016 --file jlesc.bib %} and have been published at IEEE Cluster 2016 {% cite DorierEtAl2016a --file jlesc.bib %}.


## Visits and meetings

None

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## References

{% bibliography --file external/smart_in_situ.bib %}
