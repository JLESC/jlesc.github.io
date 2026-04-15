---
layout: post
title: Variable Capacity Scheduling
date: 2026-04-13
updated: 2026-04-13
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - prog_lang
keywords:
  - energy
  - sustainability
  - variable capacity
  - scheduling
head: robert_y
members:
  - benoit_a
  - cendrier_j
  - chien_a
  - herault_t
  - wijayawardana_r
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

  topics           (optional)
                   a YAML list of topic keys (as defined in '_data/topics.yml') for this project;
                   each topic on a new line with a leading dash

  keywords         (optional)
                   a YAML list of keywords for this project;
                   each topic on a new line with a leading dash.

  head             (optional)
                   the dedicated project leader;
                   this is the identifier of a person as found in '_data/people.yml'

  members          (optional)
                   a YAML list of members of this project, i.e. the people doing the work;
                   each member must be listed as its identifier as found in '_data/people.yml'

Now, fill in the details for the current report below. Please do not change headings, headings level
or order.
Read the comments carefully!

{% endcomment %}

## Research topic and goals

This project focuses on managing and allocating resources in the new age of renewable power generation, where variation in weather and solar radiation drives the carbon-intensity of power, and efforts to reduce environmental damage then create variation in compute capacity.
From a computing perspective, 
the goal is to optimize resource utilization and minimize disruptions by dynamically adjusting job scheduling and resource allocation strategies in response to these capacity variations. Workloads are changing as well, with growing understanding of how computing can be malleable, delay flexible, or even acceptably approximate. 
From a societal perspective, the opportunity is to
enhance sustainability efforts and to minimize the environmental impact of 
High Performance Computing.  

Part of the difficulty of scheduling on variable resources comes from the many conflicting optimization objectives or metrics.
Platform-oriented objectives include platform throughput or goodput (defined as the fraction of time resources are involved in productively executing jobs -- not idle or computing jobs that will be interrupted). User-oriented objectives include minimization of response time. For fairness, the flow is often scaled by the base execution time (without interruption nor checkpoints). 
In addition to these traditional metrics of efficiency and responsiveness, one must now take into account environmental issues (also known as non-performance attributes) such as e-waste, data\-center water use, power, energy consumption and carbon emissions, as well as network congestion and system heterogeneity.
Capping and reducing brown energy consumption are becoming increasingly important, which involves lowering the power level bought on the fixed annual contract and intermittently increasing the power level using green energy and daily contracts. Furthermore, there is a growing need to shift from ``fast" to ``green" computing, which emphasizes energy efficiency and sustainability in addition to performance.

This project aims at developing new models and algorithms for variable capacity scheduling.


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

{% bibliography --cited --file jlesc.bib %}


## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/ft_workflow_project.bib %}
