---
layout: page_project
title: Effective Use of Lossy Compression for Numerical Linear Algebra Resilience and Performance 
date: 2019-01-22
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - resilience
  - numerics
keywords:
  -
head:
  - calhoun_j
members:
  - altenbernd_m
  - speck_r
  - cappello_f
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
                   WARNING: do not use quotation marks, colons and the likes

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

Prior work has shown the effectiveness of using a multigrid hierarchy to
compress the iterative solution to reduce checkpoint size. Recently specially
designed floating-point lossy compression algorithms have gained increased
popularity due to their ability to significantly reduce floating-point data
size and bound the error at each data point. The focus of this collaboration is to explore how to use
compression techniques to improve checkpoint-based recovery routines for
multigrid methods used either as a stand alone linear system solver or as a
preconditioner for other methods such as GMRES or CG. In particular, we explore
hybrid compression techniques that switch between the lossy compressor SZ
developed at ANL and multi-level multigrid compression in order to minimize the
resilience overhead. When using SZ we explore various methods of setting the
compressor’s error bounds such as a static tolerance and one that varies the
tolerance based on the current accuracy of the solver. To improve the quality
of the compressed checkpoint we create and solve a local problem based on the
patch of the solution that we are recovering. Finally, we plan to create performance
models to explore theoretical possibilities for new compressor designs and
system architectures.

The project involves JLESC Fellow Jon Calhoun, JSC affiliated graduate student
Micro Altenbernd, JSC Robert Speck, and Franck Cappello from Argonne. This
project was formed though collaborative discussions at the 2018 JLESC workshop
in Barcelona.



## Results for 2019/2020


## Visits and meetings

Planned: Visit by Mirco Altenbernd to Clemson, Spring 2019 for 2 months.
Planned: Present talk at JLESC Meeting in Knoxville, April 2019.


## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Future plans
Create performance models for using lossy compression inside running HPC applications. Integrate lossy compression algorithm into applications and measure the impact on performance / accuracy.

## References


{% bibliography --file external/lossy-compress-linear-algebra.md %}
