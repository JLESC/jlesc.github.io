---
layout: page_project
title: Joint Investigation Into the Structure of Ewald Matrices
date: 2017-12-13
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - numerics
keywords:
  - ewald
head: dawson_w
members:
  -
---

## Research topic and goals
Electrochemical Double Layer Capacitors (EDLCs) have garnered significant
interest due to their potential applications in novel energy storage devices.
At the Maison de la Simulation, software is currently being developed that can
accurately simulate these systems at constant electrostatic potential over long
time scales. By far the most expensive part of these simulations is the
solving of a linear system that represents the interactions between the
electrodes and electrolyte ions. Currently, this system is solved using dense
linear algebra routines, however these routines scale cubically with the size
of the system, which poses severe limitations on the maximum system size and
time scales that can be treated.

One alternative would be to use sparse matrix techniques. However, while sparse
linear solvers reduce the scaling costs, the need to solve a large linear
system at each iteration would impose a large cost and limit the length of
simulations that can be practically performed. Recently, at RIKEN a new library
called NTPoly has been developed that can compute the full inverse of sparse
matrices in linear time. This library would allow the matrix inverse to be
precomputed, allowing for fast iteration times and thus long simulations. For
this project, we will investigate the properties of the matrices produced in
these simulations, and determine if the techniques used in NTPoly are
applicable.

Goal Summary:

- Develop a set of benchmark Ewald matrices using the software being developed
at the Maison de la Simulation.
- Create a benchmark program based on NTPoly that can be used to assess the
accuracy and performance of NTPoly's sparse matrix techniques.
- Compile a report detailing the feasibility and potential benefits of
integrating NTPoly or NTPoly's techniques into the software being developed
at the Maison de la Simulation.

## Results for 2015/2016
Not applicable (project proposed in 2017).

## Visits and meetings

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

{% bibliography --file external/ewald_matrix %}
