---
layout: page_project
title: Optimizing ChASE eigensolver for Bethe-Salpeter computations on multi-GPUs
date: 2016-03-21
updated: 2016-03-21
navbar: Research
subnavbar: Projects
status: starting
topics:
  - numerics
  - apps
keywords:
  - Bethe-Salpeter equation
  - matrix eigenvalues
head: schleife_a
members:
  - di_napoli_e
---
{% comment %}
================================
=== HOW TO USE THIS TEMPLATE ===
================================

For citing references, use the Liquid citing syntax as explained in the wiki:
https://github.com/JLESC/jlesc.github.io/wiki/Markup-Language#cite-and-list-publications

{% endcomment %}

## Research topic and goals

Accurate predictions for the interaction of light with matter are
crucial, for instance, to design novel optoelectronic or photovoltaic
materials and to understand their fundamental properties. To this end,
atomistic first-principles methods are capable of computing absorption
spectra or the complex frequency-dependent dielectric function. More
specifically, by solving the Bethe-Salpeter equation for the optical
polarization function, computational materials scientists can take
excitonic effects into account when simulating optical properties of
real materials. However, for modern complex systems such as
lanthanum-aluminum oxide or indium oxide, this approach leads to large
dense matrices with sizes reaching up to 400,000.

To compute experimentally relevant exciton binding energies, only a
fraction of the spectrum, corresponding to the lowest eigenpairs of
these matrices, are of interest {% cite FuchsEtAl2008 --file external/chase_bse_project.bib %}. Due to its large computational
cost, direct diagonalization using out-of-the-box libraries is not a
workable option. In these instances iterative schemes provide a
feasible alternative route, allowing to efficiently compute the lowest
portion of the eigenspectrum by exploiting the massively parallel
architecture of modern supercomputers.

In this project we propose to test and customize the Chebyshev
Accelerated Subspace Eigensolver (ChASE), recently developed at JSC,
so as to facilitate the computation of the desired lowest eigenpairs
of large dense eigenproblems on hybrid architectures. The positive
outcome of the project will allow to draw conclusions with
implications for electron-hole separation in solar cell absorbers and
the overall optical properties of a material in the vicinity of the
absorption onset. If this part of the project is successful, we
envision exploring a folded-spectrum method to also access the
high-energy range of the spectrum, which may become important to
detect, for instance, Fano resonances.

## Results for 2015/2016

This project was discussed for the first time during the JLESC meeting
in December of 2015 in Bonn. Since then, both PIs set up the necessary testing
infrastructure which involved creating a JURECA account for Schleife,
a 23 GB Globus file transfer from Blue Waters to JURECA, and compiling
the existing conjugate-gradient based code on JURECA. We completed
these steps and made sure that previous results for this matrix were
correctly reproduced on JURECA. The code was stripped to the
necessary minimum and is now ready for the ChASE implementation to
compute the eigenvalues of the existing exciton-Hamiltonian
matrix. This will be the next step.

## Visits and meetings

All exchanges after the JLESC meeting in Bonn were handled via
email. Visits may happen in the future as deemed necessary.

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

The steps carried out so far to prepare this project have not taken
significant person-month efforts (on the order of 1 person-day).

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

The next step is to implement the ChASE library into the Jena BSE code
and test scalability and efficiency of the ChASE library when used to
solve eigenproblems of increasing size and complexity on multi- and
many-cores. We also plan to customize ChASE parameters and algorithm.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/chase_bse_project.bib %}
