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

Optimization of PDE solvers is one of the big challenges in High-Performance Computing (HPC). This requires not only skills and a deeper understanding of HPC from all the hardware and software layers but also research on software solutions that are sustainable and accepted by the developers and users of these solvers.

This associate team brings together members of ANL and the Inria Airsea team who are both currently working on the HPC modernization of models under the constraints above. This allows us to share, on the one hand, our experience and plans with the model developments. On the other hand, we can strongly benefit from the experience of all the current developments, which share many similarities.

### Further information

Running PDE simulations efficiently on supercomputers poses a significant challenge in High-Performance Computing (HPC). The intricacy lies in the fact that these simulations, crafted by numerics experts, must be tailored to enable highly efficient execution on supercomputer architectures, demanding optimal performance from both CPUs and GPUs, coupled with seamless communication in between.

For the associate team, our current strategy currently revolves around the following fundamental axes:

- We are developing a specialized domain-specific language (DSL) embedded into the Fortran90 language for a step-by-step transition. This DSL not only enhances the portability of the simulations but also ensures a standardized approach, allowing for consistent execution across diverse platforms and opening up the two other axes as follows.

- Secondly, building upon the foundation of the DSL, our focus is on achieving automatic distributed memory communication, including all standard optimizations for communication. This approach optimizes data exchange between different parts of the simulation, which is crucial for the accuracy and efficiency of the results.

- Lastly, our approach lays the fundament for efficient automatic differentiation, a vital component for optimizing algorithms. By automatically computing derivatives, we can stay agnostic to all numerical changes, ensuring that the simulations evolve with the changing computational landscape.

We aim not only to enhance the efficiency of PDE solvers on supercomputers but also to contribute significantly to the ongoing evolution of HPC software methodologies.

### Acknowledgment

We gratefully acknowledge funding provided by Inria under DRI-012415.


## Results for 2025/2026
None yet.


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
