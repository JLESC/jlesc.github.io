---
layout: page_project
title: Evaluating high-level programming models for FPGA platforms
date: 2016-05-01
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - architectures
keywords: 
  - FPGA
  - High-level synthesis (OpenCL, OpenMP, OpenACC)
  - HPC kernel porting
  - Manual and automatic optimization
  - Reconfigurable computing
  - Dataflow computing
head: yoshii_k
members: 
  - alvarez_c
  - jimenez_d
  - martorell_x
  - unsal_o
  - rutten_e
  - sano_k
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

## Results for 2017/2018
We presented two technical posters related to high-level synthesis and custom FPGA designs in SC17. We also co-organized a bird-of-feather session about reconfigurable computing in SC17. We have built FPGA test environment for cutting-edge FPGA platforms and high-level synthesis tools.

## Visits and meetings
{% person cappello_f %} visited BSC for two weeks in July 2016 and spent two days for this project.

{% person yoshii_k %}, {% person martorell_x %}, {% person rutten_e %} and {% person sano_k %} had a project meeting during FPT18 in Okinawa, Japan in Dec, 2018.

## Impact and publications

{% person cappello_f %}, Internal report on HPC trends: focus on Reconfigurable Architecture. ANL technical report. As part of the EDF contract for the JLESC.
The team is submitting a proposal to DOE on this topic.

{% bibliography --cited --file jlesc.bib %}


## Future plans

We will study performance portability and code optimization techniques on selected application kernels using the latest generation FPGA platforms such as Intel Arria10 and possibly submit results to relevant venues. We will also evaluate the Merlin compiler, the best commercial compiler for FPGA accelerators, for a comparison purpose.

## References

{% bibliography --file external/fpga_project.bib %}
