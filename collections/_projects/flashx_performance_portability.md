---
layout: post
title: Performance Portability in Flash-X
date: 2023-01-25
updated: 2023-01-25
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - architectures
  - apps
keywords:
  - multiphysics
  - simulations
head: dubey_a
members:
  - oneal_j
  - wahib_m
---

## Research topic and goals

Flash-X is a multiphysics simulation instrument designed for heterogeneous hardware platforms. The code is highly composable and can simulate physical phenomena in several scientific domains. It is derived from FLASH, which has been a community code for several communities over the last 20 years.  A language agnostic performance portability solution for the code was designed in this collaboration. The solution includes several tools that are individually relatively simple and easy to maintain by non-experts, but together deliver a comprehensive performance portability solution.

## Results for 2022

Flash-X was released in February 2022, with several features of the performance portability layer integrated. The release won an R&D 100 award
 {% cite dubeyEtAl2022 --file jlesc.bib %}. A paper was presented at Heteropar 2021 on one of the tools, Milhoja, which manages the runtime. {% cite onealEtAl2022 --file jlesc.bib %} using a stand-alone simplified application.


## Visits and meetings

{% person dubey_a %} will visit Riken in Feburary 2023. We met online on a bi-weekly basis until the release of Flash-X.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Future plans

Next steps include integrating Milhoja with more complex physics in Flash-X, and also integrating it with other tools in the performance portability layer.


## References

{% bibliography --file external/flashx.bib %}
