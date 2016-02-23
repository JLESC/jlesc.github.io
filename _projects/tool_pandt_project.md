---
layout: page_project
title: Developer tools for porting & tuning parallel applications on extreme-scale parallel systems
date: 2016-02-17
updated:
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
permalink:
page_type: project_page
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
Existing training material will be adapted to collaborators’ large-scale HPC systems, augmented
with newly prepared material, and refined for better uptake based on participant evaluations
and feedback. Travel and accommodation expenses of training presenters to participate in
joint training events (such as VI-HPS Tuning Workshops {% cite ViHPS --file external/tool_pandt_project.bib  %}) will be supported. 
Collaborative work with application developers will assess the effectiveness of the current (and revised) tools,
and help direct development of new tool capabilities.

## Results for 2014/2015

JLESC project proposed (and accepted) in April 2015, and planning commenced for initial presentation
at 3rd JLESCWorkshop (Barcelona) in June 2015. 
RIKEN AICS applied to join VI-HPS with a view to contributing to VI-HPS Tuning Workshops 
{% cite ViHPS --file external/tool_pandt_project.bib  %} and Tools Guide {% cite ViHPS2015 --file external/tool_pandt_project.bib  %}. 
XcalableMP training material being translated into English, and Scalasca/Score-P training material being translated
into Japanese.

## Visits and meetings

Initial face-to-face meeting planned as part of 3rd JLESCWorkshop (Barcelona) and follow-up
at ISC-HPC (Frankfurt am Main) in July.

## Visits planned for the next 12 months

Visit of RIKEN AICS researcher to JSC perhaps after ISC-HPC or in December 2015 (1–2
weeks). Visit of JSC researcher to RIKEN considered for 2016 (perhaps 4 weeks).

## Impact and publications

The project just started and thus did not result in any publications, yet.

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2014/2015

The project just started and no PMs could be spent so far.


## Future plans

The existing integration of XscalableMP and Scalasca will be updated to the latest communitydeveloped
Score-P instrumentation and measurement infrastructure, and made available for use on
JUQUEEN BG/Q and Kei K computer. 
Example batch scripts (e.g., to stage-in/out configuration and analysis files) and associated user 
documentation will be provided.
XcalableMP to be included in VI-HPS TuningWorkshop as part of PRACE Advanced Training
Centre (PATC) curriculum to be held in Germany in spring 2016. 
VI-HPS Tuning Workshop to be hosted by RIKEN AICS in Japan tentatively scheduled for February 2016.

## References

{% bibliography --file external/tool_pandt_project.bib %}
