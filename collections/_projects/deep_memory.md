---
layout: post
title: Deep Memory Hierarchies
date: 2019-01-29
updated: 2022-01-01
navbar: Research
subnavbar: Projects
project_url:
status: finished
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
this project we investigate all these issues, from memory access patterns to
interfaces to easily handle multiple memory devices with different bandwidth,
latency and reliability characteristics.

## Results for 2019/2020

Following earlier successes in this collaboration on abstractions and
mechanisms for monitoring application memory accesses, we have shifted the work
to focus on the intersection of machine learning and memory management.

During his second visit to RIKEN, Aleix has investigated machine learning
workloads from a system's perspective. Specifically, he has been focusing on
memory management issues in pytorch and identified a number of opportunities
for OS level performance improvement. This is an ongoing effort, which we
anticipate to lead to another joint publication.

Argonne and RIKEN are also working on another side of memory management: the
use of reinforcement learning in the control of the page placement of memory in
applications. We identified gem5, a cycle-accurate simulator, as the basis for
this work. We have prototyped the missing systems calls required for our
experiments in the gem5 emulation layer, and discussed how to connect with a
python distributed RL framework developed by RIKEN.

## Results for 2020/2021

We have extended the gem5 simulator to support heterogeneous memory devices, and
we have been working on interfacing runtime information between gem5 and python
based ML frameworks (e.g., pytorch). The ultimate goal is to drive decisions on
memory allocations and data movement in heterogeneous memory environments using
machine learning in real time.

## Results for 2021/2022

As compute nodes complexity in high-performance computing (HPC) keeps
increasing, systems equipped with heterogeneous memory devices are becoming
paramount. Efficiently utilizing heterogeneous memory based systems, however,
poses significant challenges to application developers. System software level
transparent solutions utilizing artificial intelligence and machine learning
based approaches, in particular non-supervised learning based methods such as
reinforcement learning, may come to the rescue. However, such methods require
rapid estimation of execution runtime as a function of the data layout across
memory devices for exploring different data placement strategies, rendering
architecture-level simulators impractical for this purpose. We introduced a
differential tracing based approach using memory access traces obtained by
high-frequency sampling-based methods on real hardware running out of different
memory devices. We developed a runtime estimator based on such traces that
provides an execution time estimate orders of magnitudes faster than full
system simulators. On a number of HPC mini-applications we showed that the
estimator predicts runtime with an average error of 4.4% compared to
measurements on real hardware.  There is a paper in progress and a short talk
about this work was given on the last JLESC Workshop.

## Results for 2022/2023

We have published our study on using high-frequency performance counter
sampling to build performance estimates on memory placement at ISC2022
{% cite denoyelle2022isc %}.
Following staff departures at RIKEN and BSC, this project is now closed.

## Visits and meetings

Internship of Aleix Roca at RIKEN between November 2019 and February 2020,
under the supervision of Balazs Gerofi.

We schedule regular video meetings between members, and are meeting regularly
during scientific conferences (ICPP19, SC19, SIAM PP20).

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## References

{% bibliography --file external/deep-memory.bib %}
