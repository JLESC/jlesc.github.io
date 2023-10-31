---
layout: post
title: Simplified Sustained System performance benchmark
date: 2017-04-26
updated: 2022-01-01
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics:
  - apps
keywords:
  - Performance evaluation
  - sustained performance
head: tsuji_m
members:
  - kramer_b
  - sato_m
---

## Research topic and goals

The SSP (Sustained System Performance) metric is used to measure the performance of existing and future supercomputer systems at NERSC, NCSA, the Australian Bureau of Meterology and other sites. The SSP metric takes into account the performance of various scientific applications and input data sets (aka a “benchmark”), which represent some part of the sites’ workload.

In this collaboration, we propose the SSSP (Simplified Sustained System Performance) metric that makes performance projection using a set of simple existing benchmarks to the SPP metric for real applications. The benchmarks used as the “simple” may be existing simple benchmarks such as HPCC benchmark, HPL, parts of the SPECFP benchmark, and other simplified pseudo benchmarks which data already exist or easy to be measured.

The first objective of this collaboration is to study candidates and methodologies of SSSP benchmark. The important claim of the SSP benchmark is to measure the sustained performance by using real applications that are proportional, reliable, consistent, easy to use and repeatable, which will be useful for users. Although it is important to meet the requirements of various real-applications, not benchmarks, simple benchmarks are easy to port, optimize, execute and estimate their performance on various kinds of systems.

The second objective is to construct a set of benchmarks including traditional benchmarks for the SSSP and define the SSSP metric. We can investigate the appropriateness of the existing benchmarks by comparing the SSSP and SSP metrics on several systems.

The third objective is to investigate the appropriateness of the existing benchmarks that has been used for many years. Based on this investigation, we will update the SSSP by adding relatively new benchmarks and/or adjusting the weight of each benchmark.


## Contributions

We execute mini-applications and benchmarks on various systems including K-Computer at RIKEN and Blue Waters at NCSA and investigate the relationship between the SSP and SSSP metrics.

We consider a machine learning methodology to give appropriate weighting factors for the SSSP metris.

## Results for 2016/2017

We have proposed the idea of Simplified SSP and evaluated its consistency with the original SSP over several systems.

## Results for 2017/2018

We have performed 6 traditional benchmarks and 7 mini applications on 6 systems to calculate the SSP and SSSP metrics. The SSSP metric has given better performance projection to the SSP than HPL {% cite TsujEtAl2017 --file jlesc.bib %}. However, there have been still some differences between the SSP and SSSP scores. Therefore, we have introduced weighting factors for benchmarks in the SSSP to approximate the SSP metrics by the SSSP metrics more accurately. The weighting factors have been calculated based on a simple learning algorithm, and the SSSP metric using the resulted weighting factors has successfully approximated the SSP metric.

## Results for 2018/2019

To evaluate the performance of various systems by SSP/SSSP-metric-wise way, we have introduced the very Simplified SSP (vSSSP) metric. Whereas the SSSP metric approximates the SSP metric by using 6 different benchmarks, the vSSSP metric does by only two benchmarks, the HPL and HPCG. While the approximation by the vSSSP metric may not so precise, the vSSSP metric can be computed for all systems if their HPL and HPCG scores are available.

The current vSSSP formula computed based on the results of applications and HPCG, HPL on 6 different systems is for vSSSP is 0.19*HPL+0.85*HCPG. It had been considered
 that the performance of systems for real applications will be between HPCG and HPL, we have shown that it is biased toward HPCG.

## Results for 2019/2020

We have performed several benchmarks and applications on larger systems than those used in previous years to compare the accuracy of the SSSP metric for large systems. We perform two kinds of performance projections : (1) SSSP metric for large systems using weighting factors computed from small systems, (2) SSSP metric for large systems using weighting factors computed from large systems. We have confirmed while the (2) was more precise, the (1) method also gave appropriate insights about applications' performance of systems.

We have organized a mini symposium about performance metrics at SIAM PP20, Seattle, Feb 2020, "Meaningful  Performance Indicators for Scientific Computing". We had 4 invited speakers including two from this JLESC project:
 - "Why Run Real Benchmarks? Can't I Just Run Linpack to Understand My System?"  William T. Kramer
 - "Evaluation of Large Scale Systems with Focus on Application Performance: the Benchmarking Perspective", Piotr Luszczek
 - "How to Monitor the Performance Evolution of a Large HPC System : a System and Application Points of View", Matthieu Hautreux, Marc Perache, and Jean-Christophe Weill
 - "Performance Modeling of Applications by Benchmarks", Miwako Tsuji

## Results for 2020/2021

We have published an article in Journal of Supercomputing {% cite TsujEtAl2021 --file jlesc.bib %}. The manuscript includes discussions and experiments performed in this project.

## Results for 2021/2022

We have performed some experiments on the supercomputer Fugaku, which started its official operation in March 2021, and have confirmed that the results were consistent with the previous experiments.

## Visits and meetings

Miwako Tsuji visited NCSA in January 2017.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}

<!--
{% comment %}
=============================
== CITING OWN PUBLICATIONS ==
=============================

You can list your own publications below in case you did not cite them in the text
(which you should do, though).
Use the Liquid citing syntax as explained in the wiki:
https://github.com/JLESC/jlesc.github.io/wiki/Markup-Language#cite-and-list-publications
Remember to use the `--file jlesc.bib` with the `cite` tag.

=====================================
== START HERE WITH YOUR ADDITIONAL REFERENCES ==
{% endcomment %}



{% comment %}
== NO MORE BELOW THIS ==
========================
{% endcomment %}
-->


## Future plans

We'll perform benchmarks and apps on larger systems to verfy and modify the SSSP metric.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/chase_largescale.bib %}
