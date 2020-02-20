---
layout: page_project
title: Shared Infrastructure for Source Transformation Automatic Differentiation
date: 2016-04-18
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - numerics
keywords:
  - 
head: narayanan_s
members: 
  - hascoet_l
  - hovland_p
  - hueckelheim_j
---

## Research topic and goals
Our goal is to pursue development of Algorithmic Differentiation (AD) tools, to enhance their applicability to HPC codes. We focus on the adjoint mode of AD, which is the most effective way of obtaining gradients of large HPC simulations. We focus on AD tools by source transformation because of the efficiency of the code they produce. One of our goals is to implement cooperation at the algorithmic level between OpenAD, the AD tool developed at ANL and Tapenade, the AD tool developed at INRIA. Another goal is to develop and maintain AMPI, and open-source library wrapped around MPI that implements the adjoint operations corresponding to the most commonly used MPI communication primitives, and to develop a methodology to compute adjoints of OpenMP-parallel programs, relying on a runtime support library for adjoint OpenMP that can be shared between OpenAD and Tapenade.

## Results for 2016--2019

We have continued to develop a runtime library called ADMM to allow source-transformation adjoint AD of input codes that contain the operations pointers and dynamic allocation of memory. This is the first library of its kind for source transformation AD. Before this, dynamic allocation and pointer usage were unsupported in adjoint-mode-source-transformation AD.  The library ensures that any memory accessed in the reverse computation exists through restoration (if needed) and contains the same value as it would have in the forward computation. Pointer variables used to access memory in the forward computation are updated to access the corresponding memory in the reverse computation. We have tested this method with a medium sized code. After an initial version the library was developed in 2016 that targeted codes written in C we have worked on refinements to the library and extended it to be target codes written in Fortran. We are currently refining the library to account for shortcomings in the first version.  

We have continued to develop the ability to interoperate OpenAD from Argonne and Tapenade from INRIA {% cite NarayananHascoet2016 --file jlesc.bib %}. Interoperation between the OpenAD and Tapenade is possible because they share the same global architecture i.e. a front-end which parses and builds an internal representation, followed by an static data-flow analysis stage, then actual building of the differentiated program still in internal form, and finally a back-end that outputs this differentiated internal form into new source files. The interoperation uses Tapenade for parsing the code and analysis. It uses OpenAD's XAIFBooster module for code transformation. The code to be differentiated is written into the XML Abstract Interface Form (XAIF) by Tapenade which is subsequently transformed by XAIFBooster. The transformed XAIF is converted back to source code by Tapenade. We have tested the new tool flow on various test cases from OpenAD's regression testsuite.

We have implemented a parser for OpenMP pragmas in the Tapenade front-end, and AD transformation rules for certain frequently-used OpenMP pragmas. We have also implemented a runtime library that ensures correct tracing and differentiation of the non-deterministic way in which OpenMP distributes work among threads when certain schedules are used, and a thread-safe mechanism to store intermediate results of the original program that are needed during the subsequent computation of adjoint gradients. We have begun to explore the possibility of using Tapenade for differentiating code containing SIMD pragmas and for generating adjoint code that exploits SIMD parallelization. 


## Visits and meetings
Frequent e-mail exchanges between {% person narayanan_s %} and {% person hascoet_l %}, and twice-weekly video meetings between {% person hueckelheim_j %} and {% person hascoet_l %}. {% person hueckelheim_j %} has visited INRIA in 2019, and will visit again in 2020.

## Impact and publications

* In 2016, we have presented one extended abstract and a poster in AD2016, submitted a talk in USNCCM, and have another publication in preparation.
* In 2017, we have given a talk in USNCCM, included our work at the DOE Applied Math PI meeting in a poster and have a publication in preparation.
* We are working on a paper on automatic differentiation of OpenMP programs, and another paper on OpenMP for SIMD programs.


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

{% bibliography --cited --file jlesc.bib %}


## Future plans
We plan to continue to integrate Tapenade and OpenAD infrastructures. Additionally, we plan to explore other
topics in the field of algorithmic differentiation.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/shared_infra_ad.bib %}
