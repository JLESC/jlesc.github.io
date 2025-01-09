---
layout: post
title: Malleable implementation of SERGHEI-SWE with DMR
date: 2024-04-04
updated: 2024-04-08
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - apps
  - prog_lang
keywords:
  - Dynamic Resources
  - Malleability
  - Shallow-water Solver
  - Computer Simulation
  - Performance-aware Computing
head: iserte_s
members:
  - morales-hernandez_m
  - segovia_j
  - valles_p
  - caviedes-voullieme_d
  - pena_a
---

## Research topic and goals

SERGHEI-SWE is a performance-portable high-performance parallel-computing shallow-water solver for hydrology and environmental studies. A key application is flood simulation, in which the wet computational domain can dramatically change size. Wet areas are much more computationally expensive to simulate than dry ones, so counting with additional data processing resources for high water stages is critical for providing results in a reasonable time frame. However, underutilizing the resources during dry stages harms the productivity and resource use efficiency of the HPC facility while being unfair to the rest of the users who see delayed their experiments. The variability of the flood size cannot be determined a priori, and therefore optimal resource selection for the job is difficult, especially for long simulations.

This project aims to design, develop, and implement a malleable version of SERGHEI-SWE with the Dynamic Management of Resources (DMR) technology, providing a flexible framework for enabling malleability in HPC applications. 

This project aims to:
<ul>
<li>Increase cluster productivity in terms of completed simulations per unit of time when running several instances of SERGHEI-SWE malleable in an HPC cluster.</li>
<li>Extend DMR with performance-aware reconfiguration techniques.</li>
<li>Design efficient data redistribution strategies for dynamic resources in SERGHEI-SWE.</li>
</ul>

## Results for 2024/2025

During the Marenostrum hackathon, we studied data redistribution strategies for different dimenssions of the domain.

## Visits and meetings

 * October 2024: Unizar researchers attend MNHack24 at BSC.

## Impact and publications

None yet.

## Future plans

Study new reconfiguration strategies and evaluate them in a large workload.

## References

{% bibliography --file external/serghei-dmr.bib %}
