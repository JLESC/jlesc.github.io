---
layout: post
title: Evaluating high-level programming models for FPGA platforms
date: 2016-05-01
updated: 2024-01-24
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics: 
  - architectures
keywords:
  - FPGA
  - Reconfigurable computing
  - High-level synthesis (OpenCL, OpenMP, OpenACC)
  - Reconfigurable computing
head: yoshii_k
members:
  - alvarez_c
  - jimenez_d
  - martorell_x
  - unsal_o
  - rutten_e
  - sano_k
  - cappello_f

---

## Research topic and goals
The end of Moore’s law poses a significant challenge for
scientific computing: from the mid-2020s, performance will not improve
anymore from the CMOS technology progress. Reconfigurable computing
presents the unique opportunity of allowing performance progress by
customization while still serving a large variety of applications,
offering a true co-design vehicle. However, its adoption in scientific
computing still faces the lack of high-level parallel programming
abstraction and the extreme difficulty of achieving high performance
with existing compilation stacks.

We focus on node-level parallelism, and our objective is to
demonstrate, for a set of JLESC applications accelerated with emerging
high-level synthesis technology, significant performance/watt
improvement compared with CPUs and GPUs of the comparable technology.

The advent of high-level synthesis technology such as OpenCL, OpenMP, and OmpSs for FPGAs eases the FPGA adoption process in HPC. However,
we have little expertise to port current existing computational kernel
and have little knowledge of optimizations. In this project, we will
implement essential application kernels using high-level synthesis tools,
study optimization techniques and conduct performance evaluations.
For optimization, we will evaluate existing source-to-source
optimizers such as the Merlin compiler and understand its pros and cons.
We simultaneously study manual optimizations that are
algorithm-aware to accelerate kernels significantly.


## Results for 2015/2016
We organized an international workshop on FPGA for scientific simulation and data analytics at Argonne in January 2016 that attracted application developers, researchers in computer science and applied mathematics, the main FPGA vendors (Xilinx and Altera), and HPC application users.

## Results for 2016/2017
We gave presentations on our FPGA work at the H2RC workshop and the post-Moore workshop in SC16. We organized the second international workshop on FPGA for scientific simulation and data analytics at NCSA in Urbana, Illinois.

## Results for 2017/2018
We presented two technical posters related to high-level synthesis and custom FPGA designs in SC17. We also co-organized a bird-of-feather session about reconfigurable computing in SC17. We have built an FPGA test environment for cutting-edge FPGA platforms and high-level synthesis tools.

## Results for 2018/2019
We co-organized a panel session and a bird-of-feather session related to FPGA and reconfigurable computing with our collaborators in this field at SC18. We also organized two workshops related to HPC and FPGAs at FPT18 in Japan.

## Results for 2019/2020
Like the previous year, we co-organized a panel session and a bird-of-feather session related to FPGA and reconfigurable computing with our collaborators in this field in SC19, which captured a large audience. We also co-organized the ReHPC workshop at the FPL 2019 conference.

## Results for 2020/2021
We organized break-out session at JLESC 11th and 12th workshops titled "Heterogeneous and reconfigurable architectures for the future of computing". 

## Results for 2021/2022
We organized a break-out session at the JLESC 13th and 14th workshops titled "Heterogeneous and reconfigurable architectures for the future of computing." 

## Results for 2023/2024
We organized a break-out session at the JLESC 15th workshop in France and a workshop at the HEART symposium in Japan.
We published two co-authored papers at workshops held with SC23. We released the source code associated with the SC23 DRBSD paper.

## Visits and meetings

* {% person cappello_f %} visited BSC for two weeks in July 2016 and spent two days on this project.
* {% person sano_k %} visited ANL in August 2018 and spent one day on this project.
* {% person yoshii_k %}, {% person martorell_x %}, {% person rutten_e %} and {% person sano_k %} had a project meeting during FPT18 in Okinawa, Japan in Dec, 2018.
* {% person yoshii_k %}, {% person cappello_f %} visited RIKEN R-CCS and Sprint-8 facility in Aug 2019 to discuss hardware compression technology.
* {% person yoshii_k %}, {% person sano_k %} had a couple of virtual meetings in 2020 and 2021 to discuss collaborations and technical topics.
* {% person yoshii_k %} visited RIKEN for two days in June 2023 to discuss the streaming hardware compressor design.
* {% person alvarez_c %} visited RIKEN in June 2023 to discuss porting the OmpSs@FPGA infrastructure to ESSPER.
* {% person ueno_t %} visited ANL in May 2023 to discuss hardware compressors and accelerator designs.


## Impact and publications

{% person cappello_f %}, Internal report on HPC trends: focus on Reconfigurable Architecture. ANL technical report. As part of the EDF contract for the JLESC.
The team is submitting a proposal to DOE on this topic.
The team has also been making significant efforts to develop a community about reconfigurable high-performance computing. We have successfully identified major players in this field and are planning upcoming workloads co-held with major FPGA conferences.

* A paper at Smokey Mountain Conference 2021 on hardware co-design methodology {% cite yoshii2021hardware --file jlesc.bib %}
* A paper at IEEE ASAP 2021 on virtualization of networks of FPGA clusters {% cite ueno2021virtual --file jlesc.bib %}

{% bibliography --cited --file jlesc.bib %}


## Future plans

We have just submitted a new project proposal, which will replace this project. In the new project, we will evaluate existing reconfigurable architectures and explore hardware designs to accelerate our target workloads, which include numerical algorithms, streaming data compression, and real-time AI at the edge. We will also investigate architecture designs, design workflow (design, verification, layout, etc.), compiler technologies, architecture emulation/simulation, and emerging technologies such as Chiplet, structured ASICs, and FPGA/CGRA generators. We aim to demonstrate enhanced computing efficiency of selected workloads on reconfigurable architectures and highlight the potential of custom hardware designs even for extensive distributed resources.

## References

{% bibliography --file external/fpga_project.bib %}
