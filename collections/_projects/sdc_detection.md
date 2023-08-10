---
layout: post
title: New Techniques to Design Silent Data Corruption Detectors
date: 2016-05-11
updated: 2020-02-25
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - resilience
keywords:
  -
head: bautista_gomez_l
members:
  - balaprakash_p
  - benoit_a
  - cappello_f
  - robert_y
  - unsal_o
  - di_s
  - hori_a
  - gerofi_b
  - snir_m
---

## Research topic and goals

With the increase in number of components and the power constrains for next
generation supercomputers, reliability is one of the mayor concerns that needs
to be addressed to reach exascale. In addition to fail-stop failures, which
produce application crashes, silent data corruption (SDC) is considered one of
the most dangerous type of errors, because they can make applications produce
wrong results without any notice. SDC are still not well understood, their
frequency and occurrence patterns remain mostly unknown. Detecting SDC is
challenging due to the silent nature of those errors. Our objective is to
develop novel software-level strategies that can detect most SDC occurring in
future supercomputers.

## Results for 2015/2016

During 2015/2016 we tackled several challenges related to silent corruption {%
cite BautEtAl2015 --file jlesc.bib %} and tested preliminary approaches {% cite
di2015detect --file jlesc.bib %}. We developed a lightweight, adaptive,
impact-driven detector for detecting the silent data corruptions {% cite
ShengEtCappello2016 --file jlesc.bib %}. (1) We carefully characterize 18 HPC
applications/benchmarks and discuss the runtime data features, as well as the
impact of the SDCs on their execution results. (2) We propose an impact-driven
detection model that does not blindly improve the prediction accuracy, but
instead detects only influential SDCs to guarantee user-acceptable execution
results. (3) Our solution can adapt to dynamic prediction errors based on local
runtime data and can automatically tune detection ranges for guaranteeing low
false alarms. Another question we answered was related to the use of multiple
SDC detectors with different characteristics. We designed a strategy that
allows users to decide which SDC detector use and at which frequency, having
the choice among several SDC detectors with different performance, recall and
precision. This research was published as a full paper at HiPC2015 {% cite
BautEtAl2015b --file jlesc.bib %} and we wrote an extension full of details and
new result and published it {% cite bautista2016coping --file jlesc.bib %}. In
addition, we investigated how to create SDC detectors based on support vector
machines (SVM) and compare them with the state-of-the-art SDC detectors. Our
evaluation with multiple large-scale HPC applications shows that SVM is a good
technique that can learn about the behavior of the datasets and detect the vast
majority of anomalies while imposing a negligible overhead. Our technique
performs better than the existent ones in most of the cases. We published this
results at CCGrid2016 {% cite SubasiEtAl2016 --file jlesc.bib %}.

## Results for 2016/2017

During 2016/2017 we have implemented a new SDC detection algorithm that
leverages multiple regression and detection mechanisms in a dynamic fashion in
order to better adapt to the conditions of the execution. Indeed, as the data
entropy changes over time and space, as turbulent regions moves in the domain,
dynamic SDC detection techniques are a much more robust way to adapt for such
changes. Our evaluation shows that the proposed technique achieves a lower
false positive rate and similar recall, while imposing a much lower memory
overhead than state-of-the-art techniques. This work has been submitted to an
international conference and it is currently under review. The software
prototype, called MACORD, is pending approval for open source publication. In
addition, several separate efforts across have been made in order to test
selective replication for dealing with SDC in HPC systems {% cite subasi2017rep
--file jlesc.bib %}, in particular for task-based programming languages {% cite
subasi2016run --file jlesc.bib %}.

## Results for 2017/2018

A comprehensive study of support vector machines capabilities on detecting
silent data corruption was published as part of the sustainable computing
journal {% cite Subasi2018 --file jlesc.bib %}. This is an extension and
aggregation of several research efforts done within this project.  After all
the results produced by this project, most of the partners in the project
started working on different topics, some of them related to resilience others
in other domains. Some of these new interests formed new collaboration projects
within the JLESC. Thus, it was decided to suspend the project and close it
after six months.  However, due to renewed interest on the project with fresh
ideas, the project was restarted. Currently, BSC and RIKEN are investigating
energy-free alternatives to SDC quantification in large scale supercomputers.

## Results for 2018/2019
We developed a neural network based detector {% cite clusterWangDCS18 --file jlesc.bib %}.
Compared to state of the art generic SDC detectors, this detector can detect SDCs multiple iterations after they were injected.
We have evaluated our detector with 6 FLASH applications and 2 Mantevo mini-apps.
Experiments show that our detector can detect more than 89% of SDCs with a false positive rate of less than 2%.

## Results for 2019/2020
Most of the partners of this project started working in other projects and there has not been any recent update/work done on this topic. Therefore, we are suspending the project and potentially mark it as finished in 6 months if no further comments/petitions are raised by any of the partners.

## Visits and meetings

 * August 2nd, 2015 - November 6th, 2015: Omer internship at ANL
 * July 4th, 2016 - July 8th, 2016: Franck visit to BSC
 * 2018: multiple visits of Franck at UIUC
 * 2019: Franck visit to BSC


## Impact and publications

{% bibliography --cited --file jlesc.bib %}

## Future plans

No future plans.

## References

{% bibliography --file external/sdc_detection.bib %}
