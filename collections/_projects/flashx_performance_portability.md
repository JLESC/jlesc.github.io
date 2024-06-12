---
layout: post
title: Performance Portability in Flash-X
date: 2023-01-25
updated: 2024-02-05
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

## Results for 2022/2023

Flash-X was released in February 2022, with several features of the performance portability layer integrated. The release won an R&D 100 award
 {% cite dubeyEtAl2022 --file jlesc.bib %}. A paper was presented at Heteropar 2021 on one of the tools, Milhoja, which manages the runtime. {% cite onealEtAl2022 --file jlesc.bib %} using a stand-alone simplified application.

## Results for 2023/2024
This year we worked on various code generation tools that each focus on one aspect of code generation, but are needed to integrate the performance portability layer with various physics. We used the tool CGKit for generated different control flow variants of the primary hydrodynamics solver in Flash-X. The results were put in a paper that was submitted to the FGCS special issue on jlesc. The paper is also on arxiv {% cite rudi2024cgkit --file jlesc.bib %}. We were also able to integrate a full-featured hydrodynamics solver with CGKit (for control flow) and Milhoja (for data movement). We are currently exploring performance of the code with these tools. 

## Visits and meetings

{% person dubey_a %} visited Riken in Feburary 2023. We continued to meet online on a regular basis and when personnel are at the same conferences.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Future plans

Continue to integrate Milhoja and CGKit with more complex physics in Flash-X and continue to explore performance.


## References

{% bibliography --file external/flashx.bib %}
