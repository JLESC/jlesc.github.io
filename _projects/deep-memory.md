---
layout: page_project
title: Deep Memory Hierarchies
date: 2019-01-29
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - storage
keywords:
head: bautista_gomez_l
members:
  - balasz_g
  - perarnau_s
  - ishikawa_y
---

## Research topic and goals

Deep Memory Hierarchies are an important part of future exascale systems and as
they come opening new opportunities, they also bring significant challenges to
the HPC world. In particular, it is not clear what is the best and more
efficient way to use such devices, how to position the data related to
performance metrics but also to reliability constrains is an open question. In
this project we investigated all these issues, from memory access patterns to
interfaces to easily handle multiple memory devices with different bandwidth,
latency and reliability characteristics.

## Results for 2018/2019

During the visit of Aleix to RIKEN, we studied the access pattern profiling
phase prior to the actual memory relocation. We study the feasibility of using
Intel’s Processor Event-Based Sampling (PEBS) feature to record memory accesses
by sampling at runtime and study the overhead at scale. We have implemented a
custom PEBS driver in the IHK/- McKernel lightweight multi-kernel operating
system, one of whose advantages is minimal system interference due to the
lightweight kernel’s simple design compared to other OS kernels such as Linux.
We evaluated the PEBS overhead of a set of scientific applications and show the
access patterns identified in noise sensitive HPC applica- tions. Our results
show that clear access patterns can be captured with a 10% overhead in the
worst-case and 1% in the best case when running on up to 128k CPU cores (2,048
Intel Xeon Phi Knights Landing nodes). We conclude that online memory access
profiling using PEBS at large scale is promising for memory management in
heterogeneous memory environments. All these results were published at the
International Workshop on Memory Centric High Performance Computing Co-located
with SC18 at Dallas {% cite RocaEtAl2018 %}.

## Visits and meetings

Internship of Aleix Roca at RIKEN during June 2018 to August 2018, under the
supervision of Balazs Gerofi.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## References

{% bibliography --file external/deep-memory.bib %}
