---
layout: page_project
title: Machine Learning-driven Predictive Analysis of Protein Diffraction Data
date: 2020-01-31
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

## Results for 2019/2020
None yet.

## Visits and meetings
None yet.

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
