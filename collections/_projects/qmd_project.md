---
layout: post
title: Fast Integrators for Scalable Quantum Molecular Dynamics
date: 2016-03-11
updated: 2020-01-01
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - numerics
keywords:
  - time stepping
head: constantinescu_e
members:
  - schleife_a
---

## Research topic and goals
The availability of an accurate, quantum-mechanics based atomistic simulation framework that is fast, efficient, and well-parallelized is indispensable, e.g., for modern materials research goals.
In particular, predictive modeling of quantum dynamics arguably is one of the greatest challenges in computational materials physics and chemistry today: A thorough understanding of the ultrafast response of different types of condensed matter when interacting with highly energetic particle radiation or light fields is becoming an increasingly important challenge that needs to be mastered in order to develop new, strong, and high-performance materials e.g. for radiation-hard electronics in space or novel photovoltaic systems.

Currently existing numerical simulation techniques are limited by the size of the integration time step, numerical errors, or even entirely neglect ultrafast electron-ion dynamics (e.g., within the adiabatic Born-Oppenheimer approximation).
This is partly dictated by the ultrafast time scales of electron dynamics and partly can be attributed to the numerical properties of time-stepping algorithms used to propagate the time-dependent Kohn-Sham equations, as an approximation to the fully time-dependent Schrödinger equation.
If a plane-wave expansion of electronic wave functions is used, the corresponding Hamiltonian matrices have large ranks, which further limits the possible choices for integrators.

In this project an applied mathematician and a computational materials scientist will work together to explore the possibility of alleviating this situation by using, developing, and implementing novel numerical time-stepping algorithms.
We will carry out an analysis of the numerical properties of the time-dependent Kohn-Sham Hamiltonian for various systems that are relevant in practice (e.g., for mitigating radiation damage).
From this analysis we will be able to find the best-suited numerical integrator and will implement that into the massively parallel Qbox/Qb@ll codes.
Strong-stability-preserving Runge-Kutta schemes will be explored and, if possible, novel time-stepping schemes will be developed.

Contributions:

* analysis of numerical scaling and cost per time step for different time-stepping schemes for quantum dynamics based on time-dependent Kohn-Sham equations
* numerical study of electron dynamics in model systems

## Results for 2016/2017
We began interfacing Qbox/Qb@ll with PETSc. We have forked Qb@ll and started to explore passing the state variables to PETSc. PETSc will perform the time stepping.

## Results for 2017/2018
We have interfaced PETSc with Qb@ll in a separate repository. The interface is not fully functional, we are currently working on fixing the variable mapping: PETSc-> Qb@ll and Qb@ll -> PETSc.

## Results for 2018/2019
We have tested the PETSc with Qb@ll interface. The interface is fully functional in serial and parallel. We are conducting a series of benchmarks to see what combinations of integrators performs well.

## Results for 2019/2020
We have tested Qb@ll with PETSc integrators. The interface works both in serial and parallel and we are now moving to HPC simulations. The initial benchmark series showed some promise but require more fine algorithmic tuning. In particular, we need to be able to address the communication latency between Qb@ll with PETSc. Another thread we are following is time step adaptivity. This feature is working but did not provide too many benefits on the small examples we have tried because their dynamics was more homogeneous. We are moving on to larger, more relevant and challenging simulations.

## Visits and meetings
<!-- Since this is a starting cooperation no visits have been initiated. -->
We had a meeting on Dev 13, 2017 - Andre visited Argonne.

## Impact and publications
None yet.

<!--

-->
{% bibliography --cited --file jlesc.bib %}

## Future plans

Timeline:

* month 1-6: [done] PETSc interface development and analysis of the Hamiltonian to determine what is required for the integrator
* month 7-12: [done] implementation of SSPRK schemes
* month 13-18: [done] interface Qbox/Qb@ll with PETSc
* month 19-24: [in progress] development and implementation of better-suited integrators
* month 25-36: [in progress] larger, more relevant benchmarks; fine-tune the interface

Expected results:

* internal report on the results
* scientific paper, if a more efficient integrator can be found/developed
* code implementation into Qbox/Qb@ll

## References

{% bibliography --file external/qmd_project.bib %}
