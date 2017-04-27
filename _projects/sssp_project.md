---
layout: page_project
title: Simplified Sustained System performance benchmark
date: 2017-04-26
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - apps
keywords:
  - Performance evaluation
  - sustained performance
head: 
  - tsuji_m
members: 
  - kramer_b
  - sato_m
---
{% comment %}
================================
=== HOW TO USE THIS TEMPLATE ===
================================

Copy this file to `_projects` and rename it to a very short version of your project's title, e.g.
the project "Scalability Enhancements to FMM for Molecular Dynamics Simulations" chooses
"fmm_project.md".

Also copy the file `_templates/project.bib` to `_bibliography/external` and name it exactly as this
one, but the file extension, e.g. "fmm_project.bib".

For citing references, use the Liquid citing syntax as explained in the wiki:
https://github.com/JLESC/jlesc.github.io/wiki/Markup-Language#cite-and-list-publications

!IMPORTANT!
Remember to adjust the file name of the BibTeX file at the very bottom of this file!!

Then fill in the YAML header variables above.

  title            (required)
                   the full title of the project

  date             (required)
                   the date this page was created in the format: YYYY-MM-DD; this will get displayed
                   at the very bottom of the generated website

  updated          (optional)
                   in case you or somebody else came back later and edited significant parts of the
                   page, put in the date (format: YYYY-MM-DD) of that change;
                   if present, this will get displayed at the very bottom of the generated website

  project_url      (optional)
                   optional URL to some external website of the project.

  status           (optional)
                   the current status of the project;
                   you have to use one of the keys defined in '_data/project_states.yml'

  topics           (required)
                   a YAML list of topic keys (as defined in '_data/topics.yml') for this project;
                   each topic on a new line with a leading dash

  keywords         (optional)
                   a YAML list of keywords for this project;
                   each topic on a new line with a leading dash.

  head             (required)
                   the dedicated project leader;
                   this is the identifier of a person as found in '_data/people.yml'

  members          (optional)
                   a YAML list of members of this project excluding the head;
                   each member must be listed as its identifier as found in '_data/people.yml'

Now, fill in the details for the current report below. Please do not change headings, headings level
or order.
Read the comments carefully!

{% endcomment %}

## Research topic and goals

The SSP (Sustained System Performance) metric is used to measure the performance of existing and future supercomputer systems at NERSC, NCSa, the Australian Bureau of Meterology and other sites. The SSP metric takes into account the performance of various scientific applications and input data sets (aka a “benchmark”), which represent some part of the sites’ workload. 

In this collaboration, we propose the SSSP (Simplified Sustained System Performance) metric that makes performance projection using a set of simple existing benchmarks to the SPP metric for real applications. The benchmarks used as the “simple” may be existing simple benchmarks such as HPCC benchmark, HPL, parts of the SPECFP benchmark, and other simplified pseudo benchmarks which data already exist or easy to be measured.

The first objective of this collaboration is to study candidates and methodologies of SSSP benchmark. The important claim of the SSP benchmark is to measure the sustained performance by using real applications that are proportional, reliable, consistent, easy to use and repeatable, which will be useful for users. Although it is important to meet the requirements of various real-applications, not benchmarks, simple benchmarks are easy to port, optimize, execute and estimate their performance on various kinds of systems. 

The second objective is to construct a set of benchmarks including traditional benchmarks for the SSSP and define the SSSP metric. We can investigate the appropriateness of the existing benchmarks by comparing the SSSP and SSP metrics on several systems.

The third objective is to investigate the appropriateness of the existing benchmarks that has been used for many years. Based on this investigation, we will update the SSSP by adding relatively new benchmarks and/or adjusting the weight of each benchmark.


### Contributions

* Execute mini-applications and benchmarks on various systems including K-Computer at RIKEN and Blue Waters at NCSA and investigate the relationship between the SSP and SSSP metrics.
* Consider a machine learning methodology to give appropriate weighting factors for the SSSP metris

## Results for 2017/2018

* PHASE I (Months 1-12): 

## Visits and meetings

Miwako Tsuji visited the NCSA in January 2017


### Compute resource needs

Virous systems including K-computer, Blue Waters, OFP, etc...

## Impact and publications

tbd

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


## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/chase_largescale.bib %}
