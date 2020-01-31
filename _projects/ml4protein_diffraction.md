---
layout: page_project
title: Machine Learning-driven Predictive Analysis of Protein Diffraction Data
date: 31/01/2020
updated:
navbar: Research
subnavbar: Projects
project_url:
status:
topics:
  - apps
keywords:
  - machine learning, protein folding
head: taufer_m
members:
  - luszczek_p
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

A protein's structure determines its function. Different proteins have different structures; proteins in the
same family share similar substructures and may share similar functions. Additionally, one protein may
exhibit several structures (or conformations). Identifying different proteins and differentiating between
their different conformations is a task that could help solve many difficult problems, such as determining
the cause of diseases and designing drugs. X-ray Free Electron Laser (XFEL) beams are used to create
diffraction patterns (images) that can reveal protein structure (and function). The translation between
diffraction patterns in the XFEL images and protein structures is non-trivial.

Three features are embedded in an image and can be captured by ML methods: the orientations of a
protein confirmation, the conformations of a folded protein, and the different conformations of different
proteins. This collaboration between UTK and RIKEN aims to develop a ML-driven workflow integrating
a suite of ML methods (from simple k-nearest neighbors and random forest to more complex neural
networks) to capture orientations, conformations, and types of proteins from XFEL images. Our ML-
driven workflow will build on top of open-source software and open-access datasets. The workflow will
be packaged into a tool that will allow us to study and understand the impact of different ML methods and
numerical precisions on prediction accuracy, power consumption, and performance for synthetic protein
datasets (from simulations) first, and for real XFEL images, as our tool is validated towards noisy,
simulated datasets. The tool will be used by the collaborators at RIKEN for protein discovery.

{% comment %}
## Results for 2015/2016
{% endcomment %}

{% comment %}
## Visits and meetings
{% endcomment %}


## Impact and publications
We expect to deliver four main results: (a) annual JLESC internal reports; (b) papers presenting both
computer science and computational chemistry results; (c) an open-source software tool including open
access datasets for testing and replication; and (d) Jupyter interfaces to the software and datasets
presenting the annotated workflow for predictions.

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

{% endcomment %}

{% bibliography --file external/ml4protein_diffraction.bib %}
