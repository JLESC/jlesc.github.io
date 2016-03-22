---
layout: page_project
title: Towards Interference-aware scheduling in HPC systems
date: 2016-03-21
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - storage
keywords:
head: ross_r
members:
  - dorier_m
  - antoniu_g
  - ibrahim_s
  - yildiz_o
---

## Research topic and goals

Performance variability in HPC systems remains a challenge. I/O interference, a major cause of this variability, is becoming more important every day with the growing number of concurrent applications that share larger machines. Earlier research efforts on mitigating I/O interference focus on a single potential cause of interference (e.g., the network). Yet the root causes of I/O interference can be diverse. In this research direction, we aim to better understand the root causes of I/O interference, and to propose new I/O scheduling techniques to solve the interference issue.

## Results for 2015/2016

We conducted an extensive experimental campaign to explore the various root causes of I/O interference in HPC storage systems. We used microbenchmarks on the Grid'5000 testbed to evaluate how the applications' access pattern, the network components, the file system's configuration, and the backend storage devices influence I/O interference. The results of this campaign have been accepted for publication at the IPDPS 2016 conference {% cite YildizIPDPS2016 %}.


## Visits and meetings

Internship of Orcun Yildiz at ANL from June to September 2015.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person yildiz_o %} | 4 PM |
| {% person dorier_m %} | 4 PM |
| {% person ross_r %} | 1 PM |
| {% person antoniu_g %} | 1 PM |
| {% person ibrahim_s %} | 3 PM |

## Future plans

We plan to further investigate the interference issue in the context of read workloads and mixed read/write workloads, as a way to extend our IPDPS 2016 paper.

## References
