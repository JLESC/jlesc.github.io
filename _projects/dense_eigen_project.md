---
layout: page_project
title: HPC libraries for solving dense symmetric eigenvalue problems
date: 2016-03-23
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - numerics
keywords:
  - dense symmetric eigensolver
  - porting
  - performance evaluation
head: imamura_t
members:
  - gutheil_i
---

## Research topic and goals

Many applications for example in Density Functional Theory (DFT) used in physics, chemistry, and materials science have to compute eigenvalues and eigenvectors of dense symmetric matrices.
There are several libraries available for that task in high performance computing: ScaLAPACK, EigenExa, ELPA, and Elemental.
On the other hand there exist different supercomputers like K-computer, BlueGene/Q, and Intel clusters with XeonPhi accelerators or with GPU accelerators.
The eigensolver routines from the different libraries behave differently on the different computer architectures.
In the first step, we evaluate the several aspects of the routines on the existing production and prototype supercomputers available to give the users recommendations which routine to use for their specific task.
At the moment, evaluation is planned with respect to performance, accuracy and reproducibility in hybrid parallel execution. In the next step, we adapt the routines to the architectures.

We expect to provide the JLESC community with an overview of pros and cons of existing software, and a perspective view of better adaptation to present and planned computers and accelerators.

For the goal of the project, we want to publish results of the evaluations so that users can choose the best software for their computer.
In the next step tuning of the existing software should be done and the new results are made available to the community.


## Results for 2015/2016

This project was submitted in August 2015, and started from January 2016, officially.
The porting process has already started for couple of eigensolver libraries and on couple of systems.
We selected three libraries, ELPA, Elemental and EigenExa, and available resources, the K computer, JUQUEEN, and JURECA.

The present status is summarized in the following table.
We confirmed the libraries are ported and perform on the systems;
*Hybrid* means MPI/OpenMP hybrid parallel mode,
*Pure MPI* means only MPI parallel mode.

{:.table.table-sm}
| HW Platform | ELPA (2015.11) | Elemental (0.85) | EigenExa (2.3d) |
|:--+:---:+:---:+:---:|
| K | Hybrid [^1] | NA [^2] | Hybrid |
| JUQUEEN | Hybrid | Pure MPI [^3] | Hybrid |
| JURECA | Pure MPI | Pure MPI | Not yet ported |

[^1]: On the K computer, ELPA2 performs in a hybrid parallel fashion, but we confirmed that ELPA1 performs in the pure MPI mode.
[^2]: Elemental needs C++10, but C++10 functionalty is not supported on the current compiler on the K computer.
[^3]: Running in the pure MPI mode is confirmed on JUQUEEN and JURECA at the moment.


## Visits and meetings

In the 4th JLESC meeting at Bonn, we had a pre-meeting of this project with regard to a research update and planning in 2016 of each member.


## Impact and publications

We have no publication yet.


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

In 2016, we divide the first year into 1st and 2nd halves on the management of this project.
For each half, we plan to do as follow.

1st 6 months
  : Performance measurements on the available resources

2nd 6 months
  : tuning the existing libraries on the available computers


## References

{% bibliography --file external/dense_eigen_project.bib %}

---
