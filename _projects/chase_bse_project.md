---
layout: page_project
title: Optimizing ChASE eigensolver for Bethe-Salpeter computations on multi-GPUs
date: 2016-03-21
updated: 2016-03-21
navbar: Research
subnavbar: Projects
status: running
topics:
  - numerics
  - apps
keywords:
  - Bethe-Salpeter equation
  - matrix eigenvalues
head: schleife_a
members:
  - di_napoli_e
  - winkelmann_j
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
infrastructure which involved creating an account for A. Schleife on JURECA,
a 23 GB Globus file transfer from Blue Waters to JURECA, and compiling
the existing conjugate-gradient eigensolver (KSCG) based code on JURECA. 
The transferred files were used to extract 
a number of matrices of increasing size to be diagonalized outside 
the Jena BSE code by using the existing ChASE
eigensolver for comparison with the KSCG solver. We completed
these steps and made sure to check the correctness of the solutions for 
the relative matrices. Already at this stage the ChASE solver showed to 
outperform KSCG out-of-the-box despite operating in sub-optimal conditions.
These results were presented at the JLESC workshop in Lyon, France (2016).

## Results for 2016/2017

In a second phase, the ChASE library underwent a restructuring 
of the parallelization scheme in order to accommodate for a 
new paradigm based on MPI+CUDA. The initial effort concentrated on re-designing 
only the Chebyshev filter, which is the most computationally intensive 
routine of the ChASE solver.The rewriting effort was successfully tested
on the JURECA nodes hosting 2 x K40 NVIDIA GPU cards using the same set of matrices 
created in the first phase of the project. The tests, run over up to 64 computing nodes
showed the potential for ChASE to scale over hundreds
of computing nodes and making use of multi-GPU cards per each node. The results were
presented at the JLESC workshop in Kobe, Japan (2016).

In the following phase, working accounts were opened on Blue Waters for the JSC team members. 
The JSC and UIUC teams met for a week in order to start
integrating the ChASE solver into the Jena BSE code. First the ChASE solver was 
templated to work both in single (SP) and double precision (DP). Numerical tests showed that 
the Jena BSE does not require eigenpairs with a high precision so that ChASE can 
just operate in SP. The second step of this integration was successful carried 
out on one computing node showing that, already at this stage, Jena BSE + ChASE 
is about five times faster than Jena BSE using the KSCG solver. In the next step 
we will fully integrate the MPI+CUDA version of ChASE and run tests on Blue Waters.
Eventually we plan to demonstrate the potential of the new solver by tackling
a physical system of unprecedented size which will require thousands of computing nodes.

## Visits and meetings

All exchanges after the JLESC meeting in Bonn up to the meeting in Kobe were handled via
email. In March 2017 the JSC team visited the UIUC team in Urbana, Champaign for a week. 
The meeting was extremely useful in tackling several important details and paved the way
to a promising integration of the ChASE library into Jena BSE.

## Impact and publications
None yet.

{% bibliography --cited --file jlesc.bib %}


## Future plans

The next step is to fully integrate a hybrid parallelization of 
the ChASE library into the Jena BSE code 
and test scalability and efficiency of the ChASE library
on Blue Waters when used to
solve eigenproblems of increasing size and complexity. 
This plan include a full customization of ChASE parameters to adapt 
seamlessly to the Jena BSE requirements.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/chase_bse_project.bib %}
