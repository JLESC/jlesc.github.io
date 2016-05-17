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
---

## Research topic and goals

With the increase in number of components and the power constrains for next
generation supercomputers, relibability is one of the mayor concerns that needs
to be addressed to reach exascale. In addition to fail-stop failures, which
produce application crashes, silent data corruption (SDC) is considered one of
the most dangerous type of errors, because they can make applications produce
wrong results without any notice. SDC are still not well understood, their
frequency and ocurrence patterns remain mostly unknown. Detecting SDC is
challenging due to the silent nature of those errors. Our obejective is to
develop novel software-level strategies that can detect most SDC ocurring in
future supercomputers.

## Results for 2015/2016

During the previous year we tackled several challenges related to silent
corruption {% cite BautEtAl2015 %}. The first question we answered
was related to the use of multiple SDC detectors with different
characteristics. We designed a strategy that allows users to decide which SDC
detector use and at which frequency, having the choice among several SDC
detectors with different performance, recall and precision. This research was
published as a full paper at HiPC2015 {% cite BautEtAl2015b %} and we wrote an
extention full of details and new result and submitted to IJHPCA. In addition,
we investigated how to create SDC detectors based on support vector machines
(SVM) and compare them with the state-of-the-art SDC detectors. Our evaluation
with multiple large-scale HPC applications shows that SVM is a good technique
that can learn about the behaviour of the datasets and detect the vast majority
of anomalies while imposing a negligible overhead. Our technique proforms
better than the existent ones in most of the cases. We published this results
at CCGrid2016 {% cite SubaEtAl2016 %}.


## Visits and meetings

None


## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person bautista_gomez_l %} | 2.5 PM |
| {% person benoit_a %} | 2 PM |
| {% person cappello_f %} | 1 PM |
| {% person cavelan_a %} | 3 PM |
| {% person robert_y %} | 1.5 PM |
| {% person subasi_o %} | 3 PM |
| {% person sun_h %} | 3 PM |
| {% person unsal_o %} | 1 PM |


## Future plans

In the near future we plan to investigate how to use multiple detectors
simultaneously according to the properties of the datasets that need to be
monitored against SDC.


## References

{% bibliography --file external/sdc_detection.bib %}
