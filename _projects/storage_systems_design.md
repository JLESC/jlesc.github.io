---
layout: page_project
title: Leverage Blue Waters I/O Traces to Size and Allocate Future Storage Systems
date: 2023-04-26
updated: 2023-04-26
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
---

## Research topic and goals
In recent years, to address the growing gap between computing power and I/O bandwidth, storage tiers have multiplied within supercomputers. While the paradigm until then was a shared global file system (Lustre, IBM Storage Scale, ...), storage is now available in a disaggregated form, still presenting a centralized storage system but completed with several intermediate layers such as node-local disks, burst buffers or network-attached storage (NVMeoF, CXL) to name a few.

This profusion of different technologies and architectures makes the use of these resources complex and their sizing at the machine design stage risky. One approach to partially solving these problems is to model supercomputers equipped with several levels of storage, coupled with the simulation of the scheduling of an execution history of large-scale I/O intensive applications. This type of simulation allows us to observe the behavior of storage tiers in the face of real-world workloads. Recently, following the decommissioning of the machine, several years of execution traces (including I/O traces) of applications that ran on Blue Waters have been made public. This mass of information is invaluable to feed simulations and study the architecture of modern storage systems.

In this JLESC project, we propose to analyze Darshan traces and Lustre metrics from several years of Blue Waters production to feed StorAlloc, a simulator of a storage-aware job scheduler developed within the Inria KerData’s team. The goal of work is twofold: to provide a post-mortem study on the sizing of Blue Waters’ storage system and to explore the design of future highly storage-disaggregated HPC systems.

## Results for 2023/2024
We introduce Fives, a storage system simulator based on WRENCH and SimGrid, two simulation frameworks in the field. Fives, currently under development, is capable of reproducing the behavior of a Lustre file system. Using Darshan execution traces to both calibrate and validate the simulator, Fives can extract a number of metrics and correlation indices demonstrating a reasonable level of accuracy between real and simulated I/O times. The traces currently used in Fives come from machines for which only aggregated Darshan traces are publicly available. We are currently working on using Blue Waters traces to feed our simulator.

A paper presenting our first results is in preparation and will be submitted in the first half of 2024.

In a second time, we will consider new calibration opportunities offered by the union of Blue Waters Darshan, Torque (resource manager) and Lustre traces. In particular, we expect this new data to allow finer calibration and validation of the Lustre model inside our simulator.

## References
{% bibliography --file external/storage_systems_design.bib %}
