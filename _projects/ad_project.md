---
layout: page_project
title: Algorithmic Differentiation
date: 2016-02-25
updated: 2016-02-25
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - numerics
keywords:
head: hovland_p
members:
  - hascoet_l
  - narayanan_s
---

## Research topic and goals
Our goal is to pursue development of Algorithmic Differentiation (AD) tools, to enhance their applicability to HPC codes.
We focus on the adjoint mode of AD, which is the most effective way of obtaining gradients of large HPC simulations.
We focus on AD tools by source transformation because of the efficiency of the code they produce.
One of our goals is to implement cooperation at the algorithmic level between OpenAD, the AD tool developed at ANL and Tapenade, the AD tool developed at INRIA.
Another goal is to develop and maintain AMPI, an open-source library wrapped around MPI that implements the adjoint operations corresponding to the most commonly used MPI communication primitives.

## Results for 2015/2016


## Visits and meetings


## Impact and publications

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


## Person-Month efforts in 2015/2016

{% comment %}
=========================================
== ADD A TABLE OF PERSON-MONTH EFFORTS ==

Put it in the following form, each person on its own line

| {% person PERSON_ID %} | X.Y PM |

e.g.:

| {% person kabadshow_i %} | 2.0 PM |

Above the very first person put the following line:

{:.person-months-table.table.table-bordered.table-hover.table-sm}

==================================
== START HERE ==
{% endcomment %}


## Future plans


## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/ad_project.bib %}
