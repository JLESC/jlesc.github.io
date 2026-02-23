---
layout: post
title: In-situ visualization and analysis for large-scale particle-mesh simulations
date: 2023-09-06
updated: 2026-01-20
navbar: Research
subnavbar: Projects
project_url:
status: running
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
  - mateevitsi_v
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

## Results for 2024/2025
1) Paraview Catalyst based in-situ interface generalized and modified to work with the latest version of IPPL.
2) New steering functonality added and is in the phase of testing.
3) An Ascent based in-situ interface for IPPL is created and is also in the testing phase.

## Results for 2025/2026
1) Severin Klapproth, a Master's student from ETH Zürich/Paul Scherrer Institute, did his Master's thesis on in-situ visualization in IPPL. He made the catalyst interface and the steering functionality more generic and reusable across applications. He will submit his thesis in early 2026.  
2) A new web-based interface for in-situ visualization using Trame has been made by Severin.
3) First in-situ results with OPAL-X, which is a particle accelerator library that uses IPPL, were obtained.
4) Victor Mateevitsi from Argonne has been added as a new collaboration partner in this project. He and his collaborators made the ascent interface for IPPL.

## Visits and meetings
Jens Henrik Goebbert and Victor Mateevitsi were part of the organizing committee in the ISAV25: In Situ AI, Analysis, and Visualization workshop in sc25. Andreas Adelmann from Paul Scherrer institute gave a keynote talk in that workshop on " In-Situ Visualization and Steering of Digital Twins for Particle Accelerators"  which used in-situ results from IPPL and OPAL-X. 

## Impact and publications
Although not directly related to this JLESC project, IPPL and it's ascent based in-situ interface are used in {% cite marrinan2025intuitive --file external/insitu_ippl_libyt %} and {% cite marrinan2025real --file external/insitu_ippl_libyt %}.  

{% bibliography --cited --file jlesc.bib %}

## Future plans

1) Do performance measurements on multiple systems.
2) In-transit visualization taking advantage of both CPUs and GPUs using ADIOS catalyst.
3) Use computational steering for training downstream digital twins using images.




## References
{% bibliography --file external/insitu_ippl_libyt.bib %}
