---
layout: page_project
title: Exploiting Omnisc'IO to improve scheduling, prefetching and caching in Exascale systems
date: 2016-03-21
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - storage
keywords:
head: dorier_m
members:
  - ross_r
  - antoniu_g
  - ibrahim_s
---

## Research topic and goals

Many techniques used in data management such as scheduling of I/O requests, prefetching, and caching, can benefit from knowing ahead of time when files will be accessed, and how. Omnisc'IO proposes an approach based on formal grammars to predict such future accesses in HPC simulations. The present research topic aims to improve Omnisc'IO and leverage its predictions in schedulers, burst buffers, and caching systems of future machines to prevent cross-application interference and to improve I/O performance.

## Results for 2015/2016

The Omnisc'IO approach was presented at SC 14 {% cite DorierEtAl2014a %}. An extension of the approach was published in the TPDS journal {% cite DorierTPDS2015 %}.


## Visits and meetings

None

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person dorier_m %} | 2 PM |
| {% person ross_r %} | 1 PM |
| {% person antoniu_g %} | 1 PM |
| {% person ibrahim_s %} | 1 PM |

## Future plans

We plan to leverage Omnisc'IO first in the context of scheduling of I/O requests.

## References
