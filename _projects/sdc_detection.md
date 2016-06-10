---
layout: page_project
title: New Techniques to Design Silent Data Corruption Detectors
date: 2016-05-11
updated: 2016-05-11
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - resilience
keywords:
  -
head: bautista_gomez_l
members:
  - benoit_a
  - cappello_f
  - cavelan_a
  - robert_y
  - subasi_o
  - sun_h
  - unsal_o
  - di_s
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

During the previous year we tackled several challenges related to silent
corruption {% cite BautEtAl2015 --file jlesc.bib %}.  We developed a
lightweight, adaptive, impact-driven detector for detecting the silent data
corruptions{% cite ShengEtCappello2016 --file jlesc.bib %}. (1) We carefully
characterize 18 HPC applications/benchmarks and discuss the runtime data
features, as well as the impact of the SDCs on their execution results. (2) We
propose an impact-driven detection model that does not blindly improve the
prediction accuracy, but instead detects only influential SDCs to guarantee
user-acceptable execution results. (3) Our solution can adapt to dynamic
prediction errors based on local runtime data and can automatically tune
detection ranges for guaranteeing low false alarms. Another question we
answered was related to the use of multiple SDC detectors with different
characteristics. We designed a strategy that allows users to decide which SDC
detector use and at which frequency, having the choice among several SDC
detectors with different performance, recall and precision. This research was
published as a full paper at HiPC2015 {% cite BautEtAl2015b --file jlesc.bib %}
and we wrote an extension full of details and new result and submitted to
IJHPCA. In addition, we investigated how to create SDC detectors based on
support vector machines (SVM) and compare them with the state-of-the-art SDC
detectors. Our evaluation with multiple large-scale HPC applications shows that
SVM is a good technique that can learn about the behavior of the datasets and
detect the vast majority of anomalies while imposing a negligible overhead. Our
technique preforms better than the existent ones in most of the cases. We
published this results at CCGrid2016 {% cite SubasiEtAl2016 --file jlesc.bib
%}.


## Visits and meetings

None


## Impact and publications

{% bibliography --cited --file jlesc.bib %}



## Future plans

In the near future we plan to investigate how to use multiple detectors
simultaneously according to the properties of the datasets that need to be
monitored against SDC.


## References

{% bibliography --file external/sdc_detection.bib %}
