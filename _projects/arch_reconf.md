---
layout: page_project
title: "Exploring the Future of Computing: Evaluating and Enhancing Reconfigurable Architectures for HPC, AI, and Edge Computing"
date: 2024-01-01
updated: 2024-04-27
navbar: Research
subnavbar: Projects
project_url: 
status: running
topics: 
  - architectures
keywords: 
  - Reconfigurable computing
  - Hardware specialization
  - CGRA
  - FPGA
  - AI accelerator
  - HPC
  - Scientific edge computing
head: yoshii_k
members: 
  - sano_k
  - ueno_t
  - adhi_b
  - alvarez_c
  - jimenez_d
  - martorell_x
  - cappello_f

---

## Research topic and goals

The end of transistor scaling encourages us to challenge innovative architectural approaches for the future of computing. Reconfigurable architectures, such as field-programmable gate arrays (FPGA) and coarse-grained reconfigurable architecture (CGRA), offer significant potential for architectural exploration. Many emerging AI accelerators (e.g., Cerebras and Groq) are built on reconfigurability and dataflow design principles, often combining significantly distributed on-chip memories, high-speed interconnects, and domain-specific languages. In this project,  we will evaluate existing reconfigurable architectures and explore hardware designs to accelerate our target workloads, which include numerical algorithms, streaming data compression, and real-time AI at the edge. We will also investigate architecture designs, design workflow (design, verification, layout, etc.), compiler technologies, architecture emulation/simulation, and emerging technologies such as Chiplet, structured ASICs, and FPGA/CGRA generators. We aim to demonstrate enhanced computing efficiency of selected workloads on reconfigurable architectures and highlight the potential of custom hardware designs even for extensive distributed resources.

## Results for 2023/2024

* organized a break-out session at the JLESC 15th workshop in France and a workshop at the HEART symposium in Japan.
* published two co-authored papers at workshops held with SC23. We released the source code associated with the SC23 DRBSD paper.

## Visits and meetings

* {% person yoshii_k %} visited RIKEN for two days in June 2023 to discuss the streaming hardware compressor design.
* {% person alvarez_c %} visited RIKEN in June 2023 to discuss porting the OmpSs@FPGA infrastructure to ESSPER.
* {% person ueno_t %} visited ANL in May 2023 to discuss hardware compressors and accelerator designs.


## Impact and publications

* A paper at Smokey Mountain Conference 2021 on hardware co-design methodology {% cite yoshii2021hardware --file jlesc.bib %}
* A paper at IEEE ASAP 2021 on virtualization of networks of FPGA clusters {% cite ueno2021virtual --file jlesc.bib %}

{% bibliography --cited --file jlesc.bib %}


## Future plans

We evaluate existing reconfigurable architectures and explore hardware designs to accelerate our target workloads. These include numerical algorithms, streaming data compression, and real-time AI at the edge. We will also investigate various architecture designs, the design workflow (including design, verification, layout, etc.), compiler technologies, architecture emulation/simulation, and emerging technologies such as Chiplets, structured ASICs, and FPGA/CGRA generators. Our goal is to demonstrate the enhanced computing efficiency of selected workloads on reconfigurable architectures and highlight the potential of custom hardware designs, even for extensive distributed resources.

## References

{% bibliography --file external/fpga_project.bib %}
