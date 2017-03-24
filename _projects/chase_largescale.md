---
layout: page_project
title: Scaling the ChASE library for large Hermitian eigenvalue problems
date: 2017-02-27
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - numerics
  - apps
keywords:
  - Extremal eigenvalue solver
  - Very large eigenproblems
  - Subspace iteration
head: di_napoli_e
members: 
  - suno_h
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

State of the art eigensolvers used in Computational Science and Engineering present evidence of widely varying performance and serious
limitations when it comes to scalability over thousands of
cores. Scalability is often an issue intrinsic to the algorithms
granularity which determines the amount of parallelism
available. Ultimately, though, it is the rigid structure of the
libraries imposing limitations on the optimal use of the hierarchical
structure of the caches that creates serious restrictions to the level
of scalability these routines can achieve.

An appealing alternative to traditional algorithms for dense and
sparse problems is a class of modern iterative eigensolvers based on
subspace iteration with spectral projection. Thanks to their simple
algorithmic structure and extended granularity, this class of
algorithms are experiencing a revival as an alternative to traditional
dense solvers. Moreover, at the sub-routine level the internal tasks
can be designed so as to use almost exclusively low level kernels from
specialized libraries, such as BLAS, guaranteeing performance
portability.

In this project we propose to focus on the modern implementation of
one of the oldest subspace iteration methods: the Chebyshev
Accelerated Subspace Eigensolver (ChASE), recently developed at
JSC. ChASE is tailored to compute a fraction not exceeding 20\% of the
extremal spectrum of dense Hermitian eigenproblems. The objective of this
project is to port the ChASE library to the K-Computer, generalize its
current parallelization scheme, and extend its applicability by
supporting the solution of large and sparse Hermitian eigenvalue problems. 

### Contributions

* Port and validate the robustness of the reference version of the ChASE library on the K-Computer;
* Extend the reference implementation of ChASE to distributed memory platforms by porting the new hybrid parallelization of the Chebyshev filter;
* Extend the hybrid parallelization to the Rayleigh-Ritz projection, QR factorization and residual computation;
* Extend the distributed memory parallelization to sparse matrices;
* Testing the scalability of ChASE when solving extremely large Hermitian eigenvalue problems extracted from specific applications.

## Results for 2017/2018

* PHASE I (Months 1-12): Porting of the reference version of ChASE library on the K-Computer, checking its robustness;  extension to distributed memory and hybrid parallelization schemes, and 
sparse matrices.
* PHASE II (Months 12-24): Applications to the scientific applications; testing the scalability of ChASE in solving extremely large eigenvalue problems.


## Visits and meetings

No extra visits or meeting are for the foreseen besides the bi-annual JLESC meetings.

### Compute resource needs

Test account on K-Computer in the first phase of the project. We 
apply for computational resources of the K-Computer in the Category 
of *General Trial Use*. In the final phase of the project, it will be 
necessary to obtain computing
time compatible with the solution of very large eigenproblems on the
whole K-Computer. For this purpose, we apply for computational resources as a *General 
Use* project.

## Impact and publications

As part of a positive outcome for this project we expect to publish a
number of new scientific papers. One such publication will focus on
the porting and optimization of the ChASE library to the K-Computer,
while additional papers will report new scientific results made
accessible by the algorithmic improvements. We plan to tackle
eigenproblems arising from distinct areas of quantum chemistry,
materials science, and fundamental physics. For instance, the
calculation of roto-vibrational energy spectrum of small molecules
requires the solution of eigenproblems, representing the
Schr\"{o}dinger equation, with matrix size amounting to several
millions. Similarly, in lattice quantum chromodynamics (QCD)
simulations, we plan to approach the computation of the spectrum of
the (sparse) Wilson-Dirac operator by solving eigenproblems with
matrix sizes from about one million to about one billion. These are
just examples of the type scientific applications where the use of the
ChASE library can be expected to lead to several publications.

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
