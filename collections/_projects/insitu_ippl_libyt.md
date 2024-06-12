---
layout: post
title: In-situ visualization and analysis for large-scale particle-mesh simulations
date: 2023-09-06
updated: 2024-01-24
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - storage
keywords:
  - In-situ visualization
  - Particle-mesh simulations
head: muralikrishnan_s
members:
  - goebbert_j
  - tsai_s
  - turk_m
---

## Research topic and goals

Data visualization and analysis are increasingly becoming a bottleneck in exascale simulations because of the I/O bottleneck both with respect to speed and memory. In-situ visualization and analysis provides a viable solution for analyzing extreme scale simulations by processing data in memory, instead of dumping simulation snapshots on disk. It can also be used for debugging and ease the process of developing applications. In short, with in-situ tools there is a tighter integration of simulation and data processing as opposed to the conventional post-processing techniques. libyt is an open source in-situ analysis tool that allows researchers to analyze and visualize data using yt and arbitrary Python packages, and have proven its capability in large simulations. The goal of this project is to enhance libyt with generic data structures and GPU direct memory access so that it can be used in parallel, performance portable, open source, C++ library Independent Parallel Particle Layer (IPPL) for large scale particle-mesh simulations.

Expected contributions:
* Support more data structures (e.g. octree, unstructured mesh, particle, etc) in libyt so that it can be used with large-scale grid and   particle-based simulations.
* Enhance libyt to work with data residing directly on GPUs to reduce the time it takes to move data between hosts and devices.
* Support Jupyter Notebook user interface to examine data and reduce the barriers to debugging.
* Create a libyt interface in IPPL and demonstrate the use cases of in-situ visualization and analysis for large scale
  particle-mesh simulations with the mini-apps in IPPL.

## Results for 2023/2024
An in-situ interface in IPPL is created based on Paraview Catalyst. libyt has been configured to launch jupyter kernel. We are now in the 
process of creating a libyt interface in IPPL.


## Visits and meetings
None.

## Impact and publications
None.

{% bibliography --cited --file jlesc.bib %}

## Future plans




## References
<!-- {% bibliography --file external/activestorage_project.bib %} -->
