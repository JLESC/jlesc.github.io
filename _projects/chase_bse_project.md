---
layout: page_project
title: The ChASE library for large Hermitian eigenvalue problems
date: 2016-03-21
updated: 2017-07-11
navbar: Research
subnavbar: Projects
status: running
topics:
  - numerics
  - apps
keywords:
  - Bethe-Salpeter equation
  - Hamiltonian eigenvalues
  - Extremal eigenvalue solver
  - Very large eigenproblems
  - Subspace iteration
head: di_napoli_e
members:
  - schleife_a
  - suno_h
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

In this project we propose to focus on the modern implementation of
one of the oldest subspace iteration methods: the Chebyshev
Accelerated Subspace Eigensolver (ChASE), recently developed at
JSC. ChASE is tailored to compute a fraction not exceeding 20\% of the
extremal spectrum of dense Hermitian eigenproblems.

### Topic 1: Optimizing ChASE for Bethe-Salpeter computations on multi-GPUs

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

In this project we propose to test and customize ChASE,
so as to facilitate the computation of the desired lowest eigenpairs
of large dense eigenproblems on hybrid architectures. The positive
outcome of the project will allow to draw conclusions with
implications for electron-hole separation in solar cell absorbers and
the overall optical properties of a material in the vicinity of the
absorption onset. If this part of the project is successful, we
envision exploring a folded-spectrum method to also access the
high-energy range of the spectrum, which may become important to
detect, for instance, Fano resonances.

### Topic 2: Scaling the ChASE for large Hermitian eigenvalue problems

State of the art eigensolvers used in Computational Science and
Engineering present evidence of widely varying performance and serious
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

The objective of this topic is to port the ChASE library to the
K-Computer, generalize its current parallelization scheme, and extend
its applicability by supporting the solution of large and sparse
Hermitian eigenvalue problems.

#### Contributions

* Port and validate the robustness of the reference version of the ChASE library on the K-Computer;
* Extend the reference implementation of ChASE to distributed memory platforms by porting the new hybrid parallelization of the Chebyshev filter;
* Extend the hybrid parallelization to the Rayleigh-Ritz projection, QR factorization and residual computation;
* Extend the distributed memory parallelization to sparse matrices;
* Testing the scalability of ChASE when solving extremely large Hermitian eigenvalue problems extracted from specific applications.

## Results for 2015/2016

### Topic 1

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

### Topic 2

Will start in 2017

## Results for 2016/2017

### Topic 1

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

### Topic 2

Just started. 

## Visits and meetings

### Topic 1

* March 3 -- 11 2017: Jan Winkelmann and Edoardo Di Napoli visited
Andre` Schleife in Urbana, Champaign. During the visit several
important details were tackled, paving the way to a promising
integration of the ChASE library into Jena BSE code.

### Topic 2

No extra visits or meeting are foreseen besides the bi-annual JLESC meetings.

#### Compute resource needs

Test account on K-Computer in the first phase of the project. We 
apply for computational resources of the K-Computer in the Category 
of *General Trial Use*. In the final phase of the project, it will be 
necessary to obtain computing
time compatible with the solution of very large eigenproblems on the
whole K-Computer. For this purpose, we apply for computational resources as a *General 
Use* project.

## Impact and publications

None yet.

{% bibliography --cited --file jlesc.bib %}


## Future plans

### Topic 1

The next step is to fully integrate a hybrid parallelization of 
the ChASE library into the Jena BSE code 
and test scalability and efficiency of the ChASE library
on Blue Waters when used to
solve eigenproblems of increasing size and complexity. 
This plan include a full customization of ChASE parameters to adapt 
seamlessly to the Jena BSE requirements.

### Topic 2

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

* PHASE I (Months 1-12): Porting of the reference version of ChASE library on the K-Computer, checking its robustness;  extension to distributed memory and hybrid parallelization schemes, and 
sparse matrices.
* PHASE II (Months 12-24): Applications to the scientific applications; testing the scalability of ChASE in solving extremely large eigenvalue problems.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/chase_bse_project.bib %}
