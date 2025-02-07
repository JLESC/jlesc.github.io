---
layout: post
title: Crocodiles
date: 2025-02-01
updated: 2025-02-01
navbar: Research
subnavbar: Projects
project_url: https://team.inria.fr/crocodiles/
status: running
topics:
  - architectures
  - apps
  - numerics
  - prog_lang
keywords:
  - Ocean models, Flash-X, Fortran, language analysis, performance modeling, heterogeneous architectures
head: schreiber_m
members:
  - bremond_m
  - brunie_h
  - debreu_l
  - dubey_a
  - lemarie_f
  - lee_y
  - remy_j
  - vidard_a
---

## Research topic and goals


Optimization of PDE solvers is one of the big challenges in High-Performance Computing (HPC). It requires skills and a deeper understanding of HPC from all the hardware and software layers and research on sustainable software solutions that are sustainable and accepted by the developers and users of these solvers.

This project brings together ANL and the Inria Airsea team members, who are both currently working on the HPC modernization of models under the above constraints. This allows us to share, on the one hand, our experience and plans with the model developments. On the other hand, we can strongly benefit from the experience of all the current developments, which share many similarities.


### Further information


Running PDE simulations efficiently on supercomputers poses a significant challenge in High-Performance Computing (HPC). The intricacy lies in that these simulations, crafted by numerics experts, must be tailored to enable highly efficient execution on supercomputer architectures, demanding optimal performance from both CPUs and GPUs, coupled with seamless communication.

For this project, our current strategy currently revolves around the following fundamental axes:

- We are developing an <b>uplifting approach</b> for PDE solvers on regular grids written in Fortran90 or Modern Fortran. Such an uplifting approach enriches again the development with a mathematical perspective that got lost during the discretization and extracts a holistic view of the computing and data flow. This lifts compiler restrictions and provides the fundamentals for enhancing the performance and portability of the simulations on different architectures. In addition, it ensures a standardized approach, allowing for consistent execution across diverse platforms and opening up the two other axes as follows.

- Secondly, building upon the foundation of an uplifted representation, our focus is on achieving <b>automatic distributed memory communication</b>, including all standard optimizations for communication. This approach optimizes data exchange between different parts of the simulation, which is crucial for the accuracy and efficiency of the results.

- Lastly, our approach lays the fundament for efficient <b>automatic differentiation</b>, a vital component for optimizing algorithms. By automatically computing derivatives, we can stay agnostic to all numerical changes, ensuring that the simulations evolve with the changing computational landscape.

We aim to enhance the efficiency of PDE solvers on supercomputers and contribute significantly to the ongoing evolution of HPC software methodologies.

This project will make strong use of the Psyclone development, which, in addition to the project partners, also involves collaborations with the Psyclone developers Sergi Siso (STFC, UK), Andrew Porter (STFC, UK), and Jörg Henrichs (BOM, AUS)

### Acknowledgment

We gratefully acknowledge funding provided by Inria under DRI-012415.


## Visits and meetings
 * Julien Remy will visit ANL in 2025.

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

{% bibliography --file external/crocodiles.bib %}
