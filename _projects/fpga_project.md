---
layout: page_project
title: Evaluating high-level programming models for FPGA platforms
date: 2016-05-01
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics: 
  - architectures
keywords: 
  - FPGA
  - High-level synthesis (OpenCL, OpenMP, OpenACC)
  - HPC kernel porting
  - Manual and automatic optimizations
  - Heterogeneous reconfigurable computing
head: yoshii_k
members: 
  - alvarez_c
  - jimenez_d
  - martorell_x
  - jin_z
  - finkel_h
  - cappello_f

---

## Research topic and goals
The end of the Moore’s law poses a significant challenge for
scientific computing: from the mid 2020s, performance will not improve
any more from the CMOS technology progress. Reconfigurable computing
presents the unique opportunity of allowing performance progress by
customization while still serving a large variety of applications,
offering a true co-design vehicle. However, its adoption in scientific
computing still faces the lack of high-level parallel programming
abstraction and the extreme difficulty of achieving high performance
with existing compilation stacks.

We focus on node-level parallelism; and our objective is to
demonstrate, for a set of JLESC applications accelerated with emerging
high-level synthesis technology, significant performance/watt
improvement compared with CPUs and GPUs of the comparable technology.

The advent of high-level synthesis technology such as OpenCL, OpenMP
and OpenACC for FPGAs eases the FPGA adoption process in HPC. However,
we have little expertise to port current existing computational kernel
and have little knowledge on optimizations. In this project, we will
implement key application kernels using high level synthesis tools,
study optimization techniques and conduct performance evaluations.
For optimization, we will evaluate existing source-to-source
optimizers such as Merlin compiler and understand its pros and cons.
We simultaneously study manual optimizations, that are
algorithm-aware, to accelerate kernels significantly.


## Results for 2015/2016
We organized an international workshop on FPGA for scientific simulation and data analytics, at Argonne on January 2016, that attracted application developers, researchers in computer science and applied mathematics, the main FPGA vendors (Xilinx and Altera), and HPC application users.

## Results for 2016/2017
We gave presentations on our FPGA work at the H2RC workshop and the post-Moore workshop in SC16. We organized the second international workshop on FPGA for scientific simulation and data analytics at NCSA in Urbana, Illinois.


## Visits and meetings
{% person cappello_f %} will visit BSC for two weeks in July 2016.


## Impact and publications

{% person cappello_f %}, Internal report on HPC trends: focus on Reconfigurable Architecture. ANL technical report. As part of the EDF contract for the JLESC.
The team is submitting a proposal to DOE on this topic.

{% bibliography --cited --file jlesc.bib %}


## Future plans

Building on the results, we plan to hold FPGA workshops every six months. The next workshop will be hosted at UIUC on October 10-11, 2016. We will leverage these workshops to share the progress of our project, get feedback, and extend collaborations to other leading research groups.

## References

{% bibliography --file external/fpga_project.bib %}
