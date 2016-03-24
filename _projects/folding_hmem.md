---
layout: page_project
title: Use of the Folding profiler to assist on data distribution for heterogeneous memory systems
date: 2016-03-22
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - perf_tools
keywords:
  -
head: pena_a
members:
  - servat_h
  - oden_l
  - gimenez_j
  - labarta_j
  - balaji_p
---

## Research topic and goals
We are extending the research on data distribution and partitioning for heterogeneous memory systems started at Argonne {% cite PenaBalaji2014 --file external/folding_hmem %}. This approach is based on an emulator-based data-oriented profiler (now named EVOP) {% cite PenaBalaji2014b --file external/folding_hmem %}. However, the profiling stage is time-consuming. We are evaluating the possibility of adapting and using the profiling tool "Folding" from BSC for this purpose {% cite ServatEtAl2015 --file external/folding_hmem %}. Since it is based on hardware counters, it seems clear that the profiling time will be greatly reduced. Given the lossy nature of profilers based on hardware counters, however, it is interesting to determine if this solution provides sufficient resolution for the subsequent stage to generate a well-optimized data distribution.

We also analyze the potential of a runtime support for heterogeneous memory systems. Profiling can be used to find the optimal data distribution, but it is limited to the system configuration.  Runtime support may be helpful if highly accessed objects are not fitting to the fastest available memory layer and therefore must be allocated in a slower memory region.  Here, efficient prefetching between the slow memory layer and a software-managed fast memory cache may be helpful.


## Results for 2015/2016
So far we have:

* Modified the Extrae profiler to generate EVOP-like reports with PEBS data.
* Developed a mechanism to compare the results.
* Performed early profiling performance and quality of object distribution evaluation.

We have noticed that our distributions from EVOP and Extrae data do not always match. This may be attributed to a combination of two factors: data loss, but also different cache behaviors (in EVOP the cache is simulated after the queried system cache properties).

We used the profiling data to identify objects where runtime support may be useful. To evaluate the beneficing of prefetching, we used an emulation. Slow memory is emulated by using the XeonPhi device memory, which is mapped into the host address space.
Our emulation shows that, in the case highly accessed objects are not fitting into fast memory, prefetching can be very useful to increase the performance.


## Visits and meetings
Frequent teleconferences and e-mail exchanges. No planned visits yet. {% person pena_a %} moved from Argonne to BSC.

## Impact and publications
We are writing a paper and seeking further funding.

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person pena_a %} | 1.0 PM |
| {% person servat_h %} | 1.0 PM |
| {% person oden_l %} | 0.5 PM |
| {% person gimenez_j %} | 0.5 PM |
| {% person labarta_j %} | 0.5 PM |
| {% person balaji_p %} | 0.5 PM |

## Future plans
Validate the sampling technique for data distribution by implementing and evaluating sampling on EVOP.
Joint software release.

## References

{% bibliography --file external/folding_hmem.bib %}
