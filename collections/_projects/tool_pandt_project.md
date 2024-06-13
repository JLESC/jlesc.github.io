---
layout: post
title: Developer tools for porting and tuning parallel applications on extreme-scale parallel systems
date: 2016-03-22
updated: 2024-02-06
navbar: Research
subnavbar: Projects
footer: true
project_url:
status: running
topics:
  - perf_tools
keywords:
  - porting
  - tuning
  - tools
head: wylie_b
members:
  - tsuji_m
  - murai_h
  - domke_j
  - kobayashi_c
  - feld_c
  - gimenez_j
  - llort_g
  - mercadal_l
  - danalis_a
  - jagode_h
---

## Research topic and goals

Application developers targeting extreme-scale HPC systems such as Fugaku & JUPITER, heterogeneous systems such as MareNostrum CTE-POWER/ARM/AMD, 
and modular supercomputing architectures such as JUWELS Cluster+Booster, need effective tools to assist with porting and tuning for these unusual systems. 
The XcalableMP compilation system (and directive-based language) {% cite LeeSato2010 --file external/tool_pandt_project.bib %}
{% cite TsujiEtAl2013 --file external/tool_pandt_project.bib  %}, Scalasca/Score-P execution
measurement and analysis tools {% cite GeimerEtAl2010 --file external/tool_pandt_project.bib  %}
{% cite KnuepferEtAl2012 --file external/tool_pandt_project.bib  %} (using SIONlib scalable file I/O
{% cite FringsEtAl2009 --file external/tool_pandt_project.bib  %}) and Paraver/Extrae/Dimemas measurement and analysis tools {% cite BSCtools --file external/tool_pandt_project.bib  %} are notable examples of
tools developed by RIKEN, JSC and BSC for this purpose. This project proposes to extend their support for
JLESC HPC systems and exploit their capabilities in an integrated work flow.
Existing training material will be adapted to collaborators large-scale HPC systems, augmented
with newly prepared material, and refined for better uptake based on participant evaluations
and feedback. Travel and accommodation expenses of training presenters to participate in
joint training events (such as VI-HPS Tuning Workshops {% cite VIHPSTWS --file external/tool_pandt_project.bib %}) will be supported.
Collaborative work with application developers will assess the effectiveness of the current (and revised) tools,
and help direct development of new tool capabilities.

## Results for 2014/2015

* Initial planning.
* XcalableMP training material translated into English, and Scalasca/Score-P training material translated into Japanese.

## Results for 2015/2016

* XcalableMP tutorial held at JSC (2015-12-01).
* Organisation of 20th VI-HPS Tuning Workshop hosted by RIKEN AICS (2016/02/24-26) {% cite VIHPSTWS --file external/tool_pandt_project.bib %} covering tools from BSC (Paraver/Extrae/Dimemas) and JSC (Scalasca/Score-P/CUBE) on K computer and local Fujitsu FX10 (pi).
* Performance analysis of RIKEN FIBER {% cite FIBER --file external/tool_pandt_project.bib %} mini-app NTChem on pi/K.
* Performance analysis of ABySS-P {% cite KitayamaEtAl2015 --file external/tool_pandt_project.bib %} and NEST neuronal network simulation tool {% cite NEST --file external/tool_pandt_project.bib %} on K computer.

## Results for 2016/2017

* Specification of XMPT generic tool interface for XcalableMP PGAS runtime (based on OMPT).
* Initial prototype implementation of XMPT interface in Omni XMP compiler, used by Extrae/Paraver.
* Definition of POP standard metrics for MPI and OpenMP applications {% cite POPmetrics2016 --file external/tool_pandt_project.bib %}.
* Document how to obtain POP standard metrics in Paraver {% cite POPmetParaver2016 --file external/tool_pandt_project.bib %}
* Calculation of POP standard metrics as derived metrics by CUBE.
* Tools training for NERSC, DKRZ, IT4I, EPCC/Southampton and RWTH using local HPC systems.

## Results for 2017/2018

* Prototype implementation in Omni XMP compiler of XMPT events for detecting data races of coarrays and for profiling coarray programs.
* Large-scale application performance measurements on JUQUEEN, K computer and Blue Waters.
* Tools training at BSC (2017-04) and TERATEC (2017-10) using local HPC systems.

## Results for 2018/2019

* Omni XMP compiler updated with XMPT-defined runtime events, including for local/remote co-array accesses
{% cite XMPhandbook --file external/tool_pandt_project.bib %}.
* BSC prototyping recording and analysis of additional XMPT events (Impact3D benchmark).
* Initial Scalasca/Score-P performance measurements of JURECA-MSA (Cluster+Booster).
* Prototype integration of POP metrics within CUBE GUI.
* Tools training for LRZ, UCLondon and ROMEO/Reims using local HPC systems.
* 30th VI-HPS Tuning Workshop hosted by BSC (2019/01/21-25) using MN4 and CTE-POWER9 compute nodes.

## Results for 2019/2020

* Initial Score-P port to AMD Epyc Rome and Fujitsu Arm A64FX test systems (new compilers and MPI libraries).
* Test measurements of NEST application on Fujitsu Arm A64FX test system.
* Integration of POP metrics within CUBE GUI.
* Tools training for GW4/Bristol and ANF/EoCoE using local HPC systems.
* 31st VI-HPS Tuning Workshop hosted by UTK-ICL (2019/04/09-12) using Stampede2.
* 33rd VI-HPS Tuning Workshop hosted by JSC (2019/06/24-28) using JURECA.

## Results for 2020/2021

* Initial Score-P porting to Fugaku.
* Implementation of experimental POP metrics for hybrid MPI+OMP within CUBE GUI.
* Virtual tools training for EPCC, HLRS, CINECA & CSC/Frankfurt using local HPC systems.

## Results for 2021/2022

* Continued Score-P porting to Fugaku.
* Virtual tools training for NHR/Erlangen, POP & LRZ using local HPC systems.
* Virtual tutorial on POP parallel performance analysis methodology given at ISC-HPC'21.

## Results for 2022/2023

* Continued Score-P porting to Fugaku and Fujitsu compilers for A64FX.
* 41st VI-HPS Tuning Workshop hosted virtually by JSC (2022/02/07-10) using JUWELS-Booster GPUs.
* 42nd VI-HPS Tuning Workshop hosted virtually by JSC (2022/05/17-19) using JUSUF.

## Results for 2023/2024

* Continued Score-P porting to Fugaku and Fujitsu compilers for A64FX with assistance of Jens Domke and Fujitsu.
* Provision of Scalasca/Score-P on Fugaku using GCC & LLVM compilers for A64FX.
* Hands-on tools tutorial at SC23 (Denver/CO, USA, 2023/11/13) using JUWELS-Booster GPUs.
* EU-ASEAN HPC School (W.Java, Indonesia, 2023/12/11-16) Scalasca/Score-P exercises using Fugaku. 
* 43rd VI-HPS Tuning Workshop hosted by CALMIP Mesocentre in Toulouse/France (2024/01/29-02/01) using Turpan (Ampere Altra Q80 ARM 8.2 CPU + Nvidia Ampere A100 GPU nodes).
* Article prepared for FGCS on joint parallel application performance analysis/tools training.

## Visits and meetings

Face-to-face meetings at 3rd and subsequent JLESC Workshops, at ISC-HPC, SC and ParCo conferences, and events hosted by project partners.  Meeting with MYX project {% cite MYXproject --file external/tool_pandt_project.bib %} members at ISC-HPC to discuss XMPT tools interface commonalities for correctness checking and performance analysis tools.

2015/12/01: RIKEN-AICS instructors visited JSC to deliver training with XcalableMP.
2016/02/24-26: BSC & JSC instructors visited RIKEN-AICS to deliver training as part of VI-HPS Tuning Workshop.
2019/04/09-12: BSC & JSC instructors visited UTK-ICL to deliver training as part of VI-HPS Tuning Workshop.
2022/10/01-2022/11/04: JSC visit to NCSA & UTK-ICL to prepare for training as part of VI-HPS Tuning Workshops.
Visits planned for the next 12 months:
2024/07: JSC instructors to visit RIKEN-CCS to deliver tools training as part of workshop for Fugaku users, in conjunction with 14th International HPC Summer School in Kobe (2024/07/07-12).

## Impact and publications

POP standard metrics applied in POP services performance analyses.
{% bibliography --cited --file jlesc.bib %}


## Future plans

Use of Scalasca/Score-P and Paraver/Extrae to analyze execution performance of RIKEN applications.
Large-scale application performance measurements on Fugaku and other HPC systems.
HPC Tunathon at JSC scaling applications on JUWELS CPUs and GPUs.
Workshops and training organised under the auspices of VI-HPS
{% cite VIHPS --file external/tool_pandt_project.bib %}
or the POP Centre of Excellence {% cite POP --file external/tool_pandt_project.bib %}.

## References

{% bibliography --file external/tool_pandt_project.bib %}
