---
layout: page_project
title: Fast Integrators for Scalable Quantum Molecular Dynamics
date: 2016-03-11
updated: 2016-03-11
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - numerics
keywords:
  - awesomeness
head: constantinescu_e
members:
  - schleife_a
---

## Research topic and goals
The availability of an accurate, quantum-mechanics based atomistic simulation framework that is fast, efficient, and well-parallelized is indispensable, e.g. for modern materials research goals. 
n particular, predictive modeling of quantum dynamics arguably is one of the greatest challenges in computational materials physics and chemistry today: A thorough understanding of the ultrafast response of different types of condensed matter when interacting with highly energetic particle radiation or light fields is becoming an increasingly important challenge that needs to be mastered in order to develop new, strong, and high-performance materials e.g. for radiation-hard electronics in space or novel photovoltaic systems.

Currently existing numerical simulation techniques are limited by the size of the integration time step, numerical errors, or even entirely neglect ultrafast electron-ion dynamics (e.g. within the adiabatic Born-Oppenheimer approximation). 
This is partly dictated by the ultrafast time scales of electron dynamics and partly can be attributed to the numerical properties of time-stepping algorithms used to propagate the time-dependent Kohn-Sham equations, as an approximation to the fully time-dependent Schrödinger equation. 
If a plane-wave expansion of electronic wave functions is used, the corresponding Hamiltonian matrices have large ranks, which further limits the possible choices for integrators.

In this project an applied mathematician and a computational materials scientist will work together to explore the possibility of alleviating this situation by using, developing, and implementing novel numerical time-stepping algorithms. 
We will carry out an analysis of the numerical properties of the time-dependent Kohn-Sham Hamiltonian for various systems that are relevant in practice (e.g. for mitigating radiation damage). 
From this analysis we will be able to find the best-suited numerical integrator and will implement that into the massively parallel Qbox/Qb@ll codes.
Strong-stability-preserving Runge-Kutta schemes will be explored and, if possible, novel time-stepping schemes will be developed.

Contributions:

* analysis of numerical scaling and cost per time step for different time-stepping schemes for quantum dynamics based on time-dependent Kohn-Sham equations
* numerical study of electron dynamics in model systems

Timeline:

* month 1-6: analysis of the Hamiltonian to determine what is required for the integrator
* month 7-12: implementation of SSPRK schemes
* month 13-18: interface Qbox/Qb@ll with PETSc
* month 19-24: development and implementation of better-suited integrators

Computer resource needs:

* 50-100k node hours on Mira or BlueWaters

Expected results:

* internal report on the results
* scientific paper, if a more efficient integrator can be found/developed
* code implementation into Qbox/Qb@ll


## Results for 2016/2017


## Visits and meetings
Since this is a starting cooperation no visits have been initiated.


## Impact and publications
none yet.

<!--

-->
{% bibliography --cited --file jlesc.bib %}

## Future plans

## References
{% bibliography --file external/qmd_project.bib %}
  
