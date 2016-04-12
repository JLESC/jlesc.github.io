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
Kei (K computer) need effective tools to assist with porting and tuning for these unusual systems
(e.g., where measurement configuration and analysis result files must be explicitly staged in and out
of batch job partitions). 
The XcalableMP compilation system (and directive-based language) {% cite LeeSato2010 --file external/tool_pandt_project.bib %}
{% cite TsujiEtAl2013 --file external/tool_pandt_project.bib  %} and Scalasca/Score-P execution
measurement and analysis tools {% cite GeimerEtAl2010 --file external/tool_pandt_project.bib  %}
{% cite KnuepferEtAl2012 --file external/tool_pandt_project.bib  %} (using SIONlib scalable file I/O 
{% cite FringsEtAl2009 --file external/tool_pandt_project.bib  %}) are two notable examples of 
tools developed by RIKEN and JSC for this purpose. This project proposes to extend their support for 
JLESC HPC systems and exploit their capabilities in an integrated work flow.  
Existing training material will be adapted to collaborators large-scale HPC systems, augmented
with newly prepared material, and refined for better uptake based on participant evaluations
and feedback. Travel and accommodation expenses of training presenters to participate in
joint training events (such as VI-HPS Tuning Workshops {% cite VIHPSTWS --file external/tool_pandt_project.bib %}) will be supported. 
Collaborative work with application developers will assess the effectiveness of the current (and revised) tools,
and help direct development of new tool capabilities.

## Results for 2015/2016

* XcalableMP tutorial held at JSC (2015-12-01).
* Organisation of 20th VI-HPS Tuning Workshop hosted by RIKEN AICS (2016/02/24-26) {% cite VIHPSTWS --file external/tool_pandt_project.bib %} covering tools from BSC (Paraver/Extrae/Dimemas) and JSC (Scalasca/Score-P/CUBE) on K computer and local Fujitsu FX10 (pi).
* Performance analysis of RIKEN FIBER {% cite FIBER --file external/tool_pandt_project.bib %} mini-app NTChem on pi/K.
* Performance analysis of ABySS-P {% cite KitayamaEtAl2015 --file external/tool_pandt_project.bib %} and NEST neuronal network simulation tool {% cite NEST --file external/tool_pandt_project.bib %} on K computer.

## Visits and meetings

Initial face-to-face meeting at 3rd JLESC Workshop (Barcelona, 2015-06), followed
by meetings at ISC-HPC (Frankfurt am Main, 2015-07), ParCo (Edinburgh, 2015-09),
SC15 (Austin, 2015-11), JSC (Juelich, 2015-12), 4th JLESC Workshop (Bonn,
2015-12) and 6th AICS International Symposium (Kobe, 2016-02).

Visits planned for the next 12 months:

* Visit of RIKEN AICS researcher to JSC perhaps around ISC-HPC or 5th JLESC Workshop (1-2 weeks, 2016-06)
* Visit of JSC researcher to RIKEN perhaps around 6th JLESC Workshop (2016-12).

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person feld_c %} | 1.0 PM |
| {% person gimenez_j %} | 1.0 PM |
| {% person murai_h %} | 1.0 PM |
| {% person tsuji_m %} | 1.0 PM |
| {% person wylie_b %} | 1.0 PM |


## Future plans

The existing integration of XcalableMP and Scalasca will be updated to the latest
community-developed Score-P instrumentation and measurement infrastructure, and made
available for use on JUQUEEN BG/Q and Kei K computer.  Investigate Score-P support
required for XcalableMP using Argobots and for native threading/autoparallelisation.
Documentation for use of Scalasca/Score-P on K computer including example batch scripts
(e.g., to stage-in/out configuration and analysis files). 
Use of Scalasca/Score-P and Paraver/Extrae to analyse execution performance of RIKEN FIBER mini-apps.
Address terminology inconsistencies between JSC and BSC tools in their analyses and documentation.
Workshops and training organised under the auspices of VI-HPS 
{% cite VIHPS --file external/tool_pandt_project.bib %} 
or the POP Centre of Excellence {% cite POP --file external/tool_pandt_project.bib %}.

## References

{% bibliography --file external/tool_pandt_project.bib %}
