---
layout: post
title: Monitoring the Arctic Climate
date: 2018-03-08
updated: 2020-03-08
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - apps
keywords:
  -
head: ortega_p
members:
  - miyoshi_t
  - serradell_k
  - castrillo_m
  - echevarria_p
  - acosta_m
  - acosta_j
  - moreno-chamarro_e
  - kotsuki_s
  - terasaki_k
---

## Research topic and goals
Monitoring the Arctic Climate (MAC) aims at refining estimates of the sea ice state over the last the recent past. More specifically, MAC will harvest the latest high-resolution and high-quality satellite products available to generate a sea ice reanalysis at a resolution never explored up to now. This new product will not only be the longest sea ice reanalysis ever constructed, but will also count the largest number of ensemble members, which will allow for a robust estimate of the related uncertainty.

The benefits and expected knowledge expected to be derived from this new dataset are numerous. First, this new reanalysis dataset will provide for the most robust estimate of the Arctic sea ice changes over the last decades, thus delivering crucial information about changes occurring in the Arctic. MAC will also examine the impacts of this sea ice reanalysis on numerical weather prediction (NWP) and will assess to what extent NWP can benefit from using high-quality sea ice data for atmospheric analyses and forecasts, particularly for high-impact weather events with large human and economic consequences such as polar storms. This new sea ice reanalysis will also provide the most trustworthy sea ice initial conditions to initialize climate prediction systems and will be used to study the impact of sea ice losses on mid-latitude climate.

### Contributions:
- to harvest the benefits of the highest quality highest resolution sea ice satellite products, through the use of the highest resolution explored up to date in sea ice reanalysis.
- to lead to a breakthrough in the monitoring and prediction of changes in the Arctic region, the most vulnerable to climate change.
- to trigger a collaboration on data assimilation between sea ice and atmosphere


## Visits and meetings


## Impact and publications


{% bibliography --cited --file jlesc.bib %}

## Results for 2017/2018

After setting the collaboration, in May 2017, BSC and Riken did a joint effort to submit a project to the “General Projects of the K computer use” call to get computational resources in the K computer.  The full description of the project can be found in this document.
Unfortunately, the project was not granted but due to the effort done by both teams, Riken shared some computing time with the BSC to deploy the EC-Earth model in post-K machine. In May 2017 Pablo Echevarria (BSC) started to port EC-Earth and solved several issues related to the installation of model dependencies and required libraries. During the following months other problems emerged, related to PERL libraries, the NetCDF and CDO versions and some issues when compiling OASIS. The BSC finally decided to stop temporarily the deployment in K machine, after some numerical instabilities with the EnKF routine that was to be used for their experiments were solved.

## Results for 2018/2019

In February 2019, Kim Serradell visited Riken. A meeting was scheduled with Shunji Kotsuki to evaluate the status of the collaboration and how to go on with the work. In this meeting they agreed to stop definitely the installation of EC-Earth in K machine (K machine will be stopped in August 2019). A post-doc has started in March 2019 to work exclusively in the numerical instabilities in the EnKF routine. As soon the filter is working and outputs produced, BSC will share them with Riken. In the following months, BSC will get an ARM machine as part of Mare Nostrum 4 FTE clusters. This machine should be quite similar to post-K machine. This similarity could foster the collaboration between both teams when both machines will be in production.

## Results for 2019/2020

The collaboration is on hold until FUGAKU, the new supercomputer at RIKEN, is installed and access is granted. During 2020, BSC will also install an ARM cluster, which will be key for resuming the collaboration.

## Future plans


## References

<!--
{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}
-->

{% bibliography --file external/mac_project.bib %}
