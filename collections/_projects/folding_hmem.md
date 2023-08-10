---
layout: post
title: Use of the Folding profiler to assist on data distribution for heterogeneous memory systems
date: 2016-03-22
updated: 2018-02-07
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics:
  - perf_tools
keywords:
  -
head: pena_a
members:
  - servat_h
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


## Results for 2016/2017
We are following separate paths until we get ready to combine our research. ANL has been working in programming models, whereas BSC has been working in the underlying tools.

## Results for 2017/2018
We have published last papers on Extrae's methodology {% cite ServatEtAl2017 --file external/folding_hmem %}{% cite ServatEtAl2017b --file external/folding_hmem %}. We believe we have accomplished the objectives of the project and we have successfully proved data-oriented profiling using hardware sampling instead of emulation can be used to assist on data distribution for heterogeneous memory systems. We will follow-up on a new JLESC project in short.

## Visits and meetings
Frequent teleconferences and e-mail exchanges. No planned visits yet. {% person pena_a %} moved from Argonne to BSC in 2015.
In February 2018 {% person pena_a %} has visited ANL and we have decided that (1) the objectives of this project are already successfully accomplished and (2) the planned upcoming work on heterogeneous memories will better fit a new project.

## Impact and publications
The research in this project lead to the definition of a Marie Slodowska-Curie Individual Fellowship (MSCA-IF): "Advanced Ecosystem for Broad Heterogeneous Memory Usage" (ECO-H-MEM). The proposal was funded and it is scheduled to start on March 1st. In addition, a follow-up task has also been funded in EU H2020 Project "European joint Effort toward a Highly Productive Environment for Heterogeneous Exascale Computing" (EPEEC), to start on May 1st 2018. Hence, apart from the publications listed below, this project under the JLESC umbrella has successfully served as an incubator toward mature proposals.

The developments of this project have been publically released in both EVOP (ANL) and Extrae software packages.

{% bibliography --cited --file jlesc.bib %}

## Future plans
To start a new JLESC project to follow-up on a broader direction besides the Extrae validation.

## References

{% bibliography --file external/folding_hmem.bib %}
