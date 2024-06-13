---
layout: post
title: Towards accurate network utilization forecasting using portable MPI-level monitoring
date: 2019-02-04
updated: 2020-02-04
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
   - resilience
   - perf_tools
   - prog_lang
keywords:
head: jeannot_e
members:
   - nicolae_b
   - bosilca_g
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

The goal of this project is to study how a careful monitoring of MPI communications can help in forecasting communication to avoid congestion on the network when writing checkpoints. This work will be based on the low-level monitoring interface that has been implemented by Inria and UTK in OpenMPI {% cite Bosilca17online --file external/network_monitoring_project.bib %}. We want to monitor applications communication with this feature and, using time-series analysis and other techniques, predict the future usage of the network by the application. With such prediction we will schedule I/O access of VeloC ("Very Low Overhead transparent multilevel Checkpoint/restart"), to avoid interference between the checkpoint writing to the storage system and the usage of the network by the application.

## Contributions:

* A transparent application monitoring system within VeloC
* A network tool that predicts network usage of the application
* Strategies to avoid network interference between the application and VeloC.

## Results for 2019/2020

We have proposed a portable deep learning predictor that only uses the information available through MPI introspection to construct a recurrent sequence-to-sequence neural network capable of forecasting network utilization {% cite tnb19+ --file jlesc.bib %}.


## Visits and meetings

Emmanuel Jeannot Visited ANL in June2019.
Emmanuel Jeannot, George Bosilca and Bogdan Nicolae met at SC 19 in Denver.

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

{% bibliography --file external/network_monitoring_project.bib %}
