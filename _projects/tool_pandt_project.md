---
layout: page_project
title: Developer tools for porting and tuning parallel applications on extreme-scale parallel systems
date: 2016-03-22
updated: 2016-03-22
navbar: Research
subnavbar: Projects
footer: true
project_url:
status: running
topics:
  - perf_tools
keywords:
  -
head: wylie_b
members:
  - tsuji_m
  - murai_h
  - feld_c
  - gimenez_j
---

## Research topic and goals

Application developers targeting extreme-scale HPC systems such as JUQUEEN (BG/Q) and
Kei (K computer) need effective tools to assist with porting and tuning for these unusual systems. 
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

## Results for 2016/2017

* Specification of XMPT generic tool interface for XcalableMP PGAS runtime (based on OMPT).
* Initial prototype implementation of XMPT interface in Omni XMP compiler, used by Extrae/Paraver.
* Definition of POP standard metrics for MPI and OpenMP applications {% cite POPmetrics2016 --file external/tool_pandt_project.bib %}.
* Document how to obtain POP standard metrics in Paraver {% cite POPmetParaver2016 --file external/tool_pandt_project.bib %}
* Calculation of POP standard metrics as derived metrics by CUBE.
* Tools training for NERSC, DKRZ, IT4I, EPCC/Southampton and RWTH, covering tools from BSC (Paraver/Extrae/Dimemas) and JSC (Scalasca/Score-P/CUBE) using local HPC systems.

## Visits and meetings

Face-to-face meetings at ISC-HPC (Frankfurt am Main, 2016-06), SC (Salt Lake City, 2016-11) and 6th JLESC Workshop (Kobe, 2016-12).  Meeting with MYX project {% cite MYXproject --file external/tool_pandt_project.bib %} members at ISC-HPC to discuss XMPT tools interface commonalities for correctness checking and performance analysis tools.

Visits planned for the next 12 months: none

## Impact and publications

POP standard metrics applied in POP services performance analyses.
{% bibliography --cited --file jlesc.bib %}


## Future plans

The existing integration of XcalableMP and Scalasca will be updated to the latest
community-developed Score-P instrumentation and measurement infrastructure.  
Investigate Extrae and Score-P support required for XcalableMP.
Use of Scalasca/Score-P and Paraver/Extrae to analyse execution performance of RIKEN FIBER mini-apps.
Address terminology inconsistencies between JSC and BSC tools in their analyses and documentation.
Workshops and training organised under the auspices of VI-HPS 
{% cite VIHPS --file external/tool_pandt_project.bib %} 
or the POP Centre of Excellence {% cite POP --file external/tool_pandt_project.bib %}.

## References

{% bibliography --file external/tool_pandt_project.bib %}
