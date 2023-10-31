---
layout: post
title: International Survey
date: 2019-02-15
updated: 2022-01-01
navbar: Research
subnavbar: Projects
project_url: https://github.com/bosilca/MPIsurvey
status: suspended
topics:
  - prog_lang
keywords:
  - questionnaire survey
head: hori_a
members:
  - bosilca_g
  - jeannot_e
  - ogura_t
  - balasz_g
  - ishikawa_y

---

## Research topic and goals

We believe international surveys are suitable for the vision of
JLESC. International survey would be another type of collaboration in
JLESC to obtain the insights into Exascale computing.

The International MPI survey has been being conducted as the first survey
in this project. As part of a wide effort to understand the current
usage of the Message Passing Interface (MPI) in the development of
parallel applications and drive future additions to the MPI standard,
the objective of this project is to get feedback from the largest MPI
audience (past, current and potential users) to get a better
understanding of their needs, and the impact of different MPI
capabilities on the process of developing distributed
applications. Since this questionnaire survey will be distributed
worldwide, it is also expected to reveal country/region differences on
the above aspects.

Existing studies on MPI uses are focused on a restricted target domain,
such as the Exascale Computing Project (ECP) study conducted in 2017 that focused
on MPI usage in the context of ECP applications; and/or those that are geographically
constrained to a single laboratory, funding agency or at best, country.

Such studies inspired us to conduct a larger study, not focused on HPC, but
targeting a wider audience and involving a larger spectrum of geographically
distinct users. Since MPI has been a widely used vehicle for high-performance
computing for decades, this larger-scale questionnaire survey would be
beneficial not only for deciding the future direction of MPI, but also the
feature differences of MPI users among countries and/or regions of the world.

This survey was conducted from February to June 2019, and at the time of
this writing has gathered more than 800 answers from more than 40 countries.

## Results for 2018/2019/2020

As of 02.2019 the design of the questionnaire survey is almost
done. Especially we also pay attention to China which is growing
rapidly in the HPC field, and we have been making great effort to have
answers from China. Unfortunately, our effort is not rewarded, 15
answers from China at the time of this writing. We are now analyzing
the answers and planning to submit a paper.

## Results for 2020/2021

We have successfully had more than 850 participants from over 40
countries/regions.  This large-scale, worldwide survey can
differentiate with the other surveys so far introduced. It is revealed
that many MPI users are suffered from mastering MPI, are deploring not
finding appropriate learning mediums, and are not using recently
introduced MPI features. We have submitted a journal paper to report
the survey findings.

## Results for 2021/2022

The conducted survey gathered a total of 851 answers from 42 contributors
(countries/regions) around the world. We believe that this survey at this
scale provides a novel view on MPI users, differentiating from and complementing
for the other MPI surveys. The large number of participants, mostly from academia,
allowed us to have a more clear picture about the use of MPI in an academic
setting. We analyzed and summarized these results in a journal paper
{% cite ahori-PARCO21-survey %}. To help other researchers interested in
usage patterns, we have published the entire archive as CSV files on the
project github directory.

## Visits and meetings

Due to the COVID situation, all meeting in the period 2021-2022 were online
meetings. They occurred regularly, mostly one to two meeting in a month.

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

{% cite ahori-IPSJ-2019-July %}
{% cite ahori-PARCO21-survey %}

{% bibliography --cited --file jlesc.bib %}


## Future plans

The MPI International Survey is a touchstone of following JLESC survey
projects. If you are interested in this survey project as a project
member or a subject of international survey, just join this project.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --cited --file jlesc.bib %}
