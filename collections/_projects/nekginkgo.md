---
layout: post
title: nekRS and Ginkgo - Towards Exascale CFD
date: 2023-04-18
updated: 2024-01-31
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - numerics
keywords:
  -
head: bode_m
members:
  - anzt_h
  - tsai_yh
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

JSC will be the hosting side of the first European Exascale supercomputer (JUPITER) that is going to become available in 2024. While both CPU-heavy and GPU-heavy Petascale supercomputers exist, JUPITER is targeted for 1.3 Exaflops in its GPU partition. Therefore, code frameworks and workflows need to be adopted. In the area of CFD – ranging from earth system modeling to combustion applications, nekRS is currently the most promising candidate for Exascale simulations at JSC. It is part of the Exascale benchmark suite and extended in the direction of chemistry flows. This effort is led by Mathis Bode (JSC).
Hartwig Anzt (UTK) and his team are developing the linear algebra library Ginkgo for many years. It is a high-performance numerical library that supports NVIDIA GPUs and AMD GPUs. Ginkgo has been successfully used with other CFD codes and preliminary work with nekRS has been conducted.
This JLESC project aims to bring nekRS and Ginkgo together. In a first step, the performance of Ginkgo for cold flows at scale is evaluated for multiple application cases. These cases range from mesoscale convection to complex cases with moving geometries. Throughput and scaling behavior will be studied on JUWELS Booster. Secondly, the potential of Ginkgo in the context of nekRS’s currently developed chemistry module is accessed. This includes the evaluation of batched solvers for solving coupled scalar equations. Finally, the combined behavior of nekRS and Ginkgo at Exascale size are tested on the new supercomputer JUPITER. Bottlenecks will be identified and improvements suggested. Ultimately, the goal is to provide a high-scaling, high-throughput version of nekRS for Exascale runs to the nekRS community.


## Results for 2022/2023
None yet.

## Visits and meetings
None yet.

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


## Future plans


## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/nekginkgo.bib %}
