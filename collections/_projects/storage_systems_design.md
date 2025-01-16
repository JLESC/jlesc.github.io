---
layout: post
title: Leverage Blue Waters I/O Traces to Size and Allocate Future Storage Systems
date: 2023-04-26
updated: 2024-11-29
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - storage
keywords:
head: tessier_f
members:
  - kramer_b
  - antoniu_g
  - monniot_j
  - jolivel_t
  - luettgau_j
---

## Research topic and goals
In recent years, to address the growing gap between computing power and I/O bandwidth, storage tiers have multiplied within supercomputers. While the paradigm until then was a shared global file system (Lustre, IBM Storage Scale, ...), storage is now available in a disaggregated form, still presenting a centralized storage system but completed with several intermediate layers such as node-local disks, burst buffers or network-attached storage (NVMeoF, CXL) to name a few.

This profusion of different technologies and architectures makes the use of these resources complex and their sizing at the machine design stage risky. One approach to partially solving these problems is to model supercomputers equipped with several levels of storage, coupled with the simulation of the scheduling of an execution history of large-scale I/O intensive applications. This type of simulation allows us to observe the behavior of storage tiers in the face of real-world workloads. Recently, following the decommissioning of the machine, several years of execution traces (including I/O traces) of applications that ran on Blue Waters have been made public. This mass of information is invaluable to feed simulations and study the architecture of modern storage systems.

In this JLESC project, we propose to analyze Darshan traces and Lustre metrics from several years of Blue Waters production to feed StorAlloc {% cite monniot:hal-03683568 --file external/storage_systems_design.bib %}, a simulator of a storage-aware job scheduler developed within the Inria KerData’s team. The goal of work is twofold: to provide a post-mortem study on the sizing of Blue Waters’ storage system and to explore the design of future highly storage-disaggregated HPC systems.

## Results for 2023/2024
We introduce Fives, a storage system simulator based on WRENCH and SimGrid, two simulation frameworks in the field. Fives, currently under development, is capable of reproducing the behavior of a Lustre file system. Using Darshan execution traces to both calibrate and validate the simulator, Fives can extract a number of metrics and correlation indices demonstrating a reasonable level of accuracy between real and simulated I/O times. The traces currently used in Fives come from machines for which only aggregated Darshan traces are publicly available. We are currently working on using Blue Waters traces to feed our simulator.

A paper presenting our first results is in preparation and will be submitted in the first half of 2024.

In a second time, we will consider new calibration opportunities offered by the union of Blue Waters Darshan, Torque (resource manager) and Lustre traces. In particular, we expect this new data to allow finer calibration and validation of the Lustre model inside our simulator.

## Results for 2024/2025
A conference paper presenting Fives {% cite monniotEtAl2024 --file jlesc.bib %}, an HPC storage system simulator, has been accepted at HiPC'24 (Bengalore, India). Although Fives uses Darshan traces from an ANL system (Theta), an extended version of the paper exploiting Blue Waters traces is in preparation.

We also introduced MOSAIC {% cite jolivelEtAl2024 --file jlesc.bib %}, an approach to categorize execution traces and give information about the general behavior of applications from an I/O perspective. we analyze a full year of I/O execution traces of Blue Waters from which, we determine a set of non-exclusive categories to describe the I/O behavior of jobs, including the temporality and the periodicity of the accesses and the metadata overhead. This paper has been accepted in the SC'24 PDSW workshop. This work is currently being pursued, with several lines of research focusing in particular on automating the clustering of I/O operations.

Finally, still using Blue Waters traces among others, we proposed an in-depth study of access temporality on large-scale storage systems. This work has been accepted at IPDPS 2025 {% cite boitoEtAl2024 --file jlesc.bib %}.

## References
{% bibliography --cited --file jlesc.bib %}

{% bibliography --cited --file external/storage_systems_design.bib %}
