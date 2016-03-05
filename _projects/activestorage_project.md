---
layout: page_project
title: Exploiting Active Storage for Resilience
date: 2016-01-01
updated: 2016-03-04
navbar: Research
subnavbar: Projects
project_url:
status: closing
topics:
  - resilience
keywords:
  - Blue Gene Active Storage
  - Global View Resilience
head: pleiter_d
members:
  - chien_a
  - dun_n
  - vandenbergen_n
---

## Research topic and goals
The research in this topic is based on a hardware and a software architecture, which both are currently under development: GVR and BGAS.
GVR (Global View Resilience) is a user-level library that enables portable, efficient, application-controlled resilience {% cite ChienEtAl2015 --file external/activestorage_project.bib %}.
It focusses on achieving scalability and maximization of error recovery.
BGAS (Blue Gene Active Storage) is a realisation of an active storage architecture based on custom flash memory cards which are integrated into Blue Gene/Q I/O drawers.
Here JSC continues previous work on integration of non-volatile memory {% cite SayedEtAl2013 --file external/activestorage_project.bib %}.
In this subproject our goal is to explore the opportunities of both architectures by integrating them.
More specifically the following research questions are addressed:

* How well can the software architecture of GVR exploit the BGAS hardware architecture?
* How efficiently can both architectures be exploited?
* What is the value of active storage for a which classes of large-scale scientific computing?

## Results for 2015/2016
GVR has been successfully installed by the ANL team on Jülich's BG/Q system JUQUEEN exploiting the attached BGAS nodes. This setup had been the basis for an extensive performance analysis, where results will be published at ISC16.

The conclusions was that the NVM-based BGAS system provides a more efficient basis and opportunities for GVR versioning comparing to an traditional external storage systems attached to the same system, especially for flexible error recovery using random version access.
Equipped with additional compute resource, e.g., idle cores on the I/O node (ION), in-situ analysis could be off-loaded to the ION. 
Such active storage concepts can potentially be exploited for enabling algorithm-based fault-tolerance (ABFT) error- checking.
Further performance improvements might be attainable using the Direct Storage Access (DSA) interface instead of the local file system that was used within this project.

With the presentation of the paper this project will come to an end.

## Visits and meetings
Beyond regular contacts via email the following meetings involving most of the participants took place:

* Meeting of {% person chien_a %}, {% person dun_n %} and {% person pleiter_d %} at SC14 on November 17, 2014.
* Technical update meeting on February 5, 2015.
* Regular technical meetings thereafter until December 2015

## Impact and publications
The project has submitted a publication to ISC16 that has been accepted.

<!--

-->
{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

The efforts of the participants so far are as follows:

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person chien_a %}        | 0.1 PM |
| {% person pleiter_d %}      | 0.1 PM |
| {% person dun_n %}          | 2.0 PM |
| {% person vandenbergen_n %} | 0.5 PM |


## Future plans
None


## References
{% bibliography --file external/activestorage_project.bib %}
