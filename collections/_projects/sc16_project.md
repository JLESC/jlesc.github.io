---
layout: post
title: On-Demand Data Analytics and Storage for Extreme-Scale Simulations and Experiments
date: 2016-05-31
updated: 2019-05-31
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - architectures
keywords:
  - On demand infrastructures
  - extreme scale simulation
  - 1PB/day communication
  - remove visualization
  - community scientific data repository
head: cappello_f
members:
  - heitmann_k
  - allen_g
  - gropp_b
  - habib_s
  - seidel_ed
  - brown_m
  - kettimuthu_r
  - sisneros_r
  - schmitz_c
  - stevens_s
  - turk_m
  - uram_t
  - wheeler_d
  - wilde_m
  - wozniak_j
---

## Research topic and goals
Data size and throughput is becoming one of the main limiting factors of extreme-scale simulations and experiments. With current system computational capabilities, extreme-scale scientific simulations and experiments can generate much more data than can be stored at a single site. Often a single site cannot simultaneously satisfy both computing and data analytics requirements. Finally, extreme-scale simulations and experiments tend to push toward a model where a group runs simulations that are then analyzed by many other groups (the one-simulation, many-groups model).

The extreme-scale example considered here is taken from computational cosmology. The science requirements demand running very large simulations, such as N-body runs with trillions of particles. A trillion-particle simulation with the HACC code generates 20 PB of raw data which is is more than petascale systems such as Mira and Blue Waters can store for a single run in their file systems. Moreover, HACC is optimized for Mira, while other systems (BlueWaters, Titan and CORI) offers better data analytics capabilities. This suggests a combined on-demand storage and analytics infrastructure where the simulation is performed on a system (MIRA), the simulation results are sent as soon as they are produced to a storage facility and to other systems for analytics (Blue Waters) and further analytics is done on remote systems (Titan and Cori), using the data pulled from the storage facility.

## Results for 2015/2016
This SC16 experiment we prepare covers several critical elements of the on-demand storage and analytics infrastructure. During the experiment a state-of-the-art cosmology simulation combining high spatial and temporal resolution in a large cosmological volume will be performed on Mira with 29 billion particles. All time snapshots (500) of the simulation (L1 data) will then be transmitted, as they are produced, to the SC16 NCSA Booth using Globus were the data will be stored in a DDN storage system. The goal here is to show 1PB/day communication/storage capability (using 100Gb/s link). The simulation data will also be sent to NCSA (before SC16). The L1 data analytics (producing L2 data) and visualization will be performed on BlueWaters during SC16. The goal here is to stream the L1 data visualization data to the SC16 NCSA booth. The L2 data will be sent from NCSA to the SC16 NCSA booth and stored in the DDN storage system. At least two sites (NERSC and ORNL) will play the role of data analytic centers. They will pull and analyze the L2 data from the DDN storage system and perform specific and different data analytics and visualization. The goal is to demonstrate that L2 data can be used by several cosmology research groups, remotely. The data analysis results will be streamed in ultra-high-resolution using the SAGE2 software to the SC16 NCSA booth on the show floor.

## Results for 2016/2017
- Technical: we successfully deployed the experiment, produced all the simulation snapshots and exercised all aspects of the infrastructure (simulation, analytics, transfer, workflow, vis.).
- Scientific: the analysis of the data produced during the experiment is on going and results will be published in a cosmology journal.

## Results for 2017/2018

A paper presenting the data transfer aspect of the experiment has been accepted and presented at EEE/ACM SC17 Workshop on Innovating the Network for Data Intensive Science (INDIS 2017), Denver, CO, Nov. 2017. An extended version of this paper has been submitted to FGCS.

## Results for 2018/2019

The analysis of the data produced by the simulation is not completed yet. Publications on the science aspect of the research are in preparation.

## Visits and meetings
Weekly meeting since December 2015, until November 2016
Franck Cappello (ANL) organized the weekly meeting from NCSA.

## Impact and publications
- White paper send at BDEC,
- Presentation of the concept at BDEC,
- Presentation of the infrastructure on the NCSA booth of SC16,
- BOF at SC16 on the “On-Demand Data Analytics and Storage for Extreme-Scale Simulations and Experiments”,
- BOF Report on the experiment: [http://sc16.supercomputing.org/sc-archive/bof/bof_files/bof139s2.pdf](http://sc16.supercomputing.org/sc-archive/bof/bof_files/bof139s2.pdf)
- Joint NCSA-ANL announcement of the experiment
- We discover performance limitation of GridFTP related to the computation of checksums
- We needed to improve swift to consider external events
- Presentation of the concept at Enabling Cosmological Resonances Between WFIRST and LSST ([https://conference.ipac.caltech.edu/wfirst_lsst/page/agenda](https://conference.ipac.caltech.edu/wfirst_lsst/page/agenda))
- Concept will be further investigated and developed as part of Advisory Board for the Tri-Agency Cosmological Simulation (TACS) Task Force (NSF/DOE/NASA)

Publication: {% cite Kettimuthua17 --file jlesc.bib %}

{% bibliography --cited --file jlesc.bib %}

## Future plans
See "Results" section.

## References

{% bibliography --file external/sc16_project.bib %}
