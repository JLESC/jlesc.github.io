---
layout: post
title: The ChASE library for large Hermitian eigenvalue problems
date: 2016-03-21
updated: 2020-01-01
navbar: Research
subnavbar: Projects
status: finished
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
  - winkelmann_j
---
{% comment %}
================================
=== HOW TO USE THIS TEMPLATE ===
================================

For citing references, use the Liquid citing syntax as explained in the wiki:
https://github.com/JLESC/jlesc.github.io/wiki/Markup-Language#cite-and-list-publications

{% endcomment %}

## Research topics and goals

In this project we propose to focus on the modern implementation of
one of the oldest subspace iteration methods: the Chebyshev
Accelerated Subspace Eigensolver (ChASE), recently developed at
JSC. ChASE is tailored to compute a fraction not exceeding 20% of the
extremal spectrum of dense Hermitian eigenproblems.

### Scaling the ChASE for large Hermitian eigenvalue problems

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
largest computing architectures currently available,
generalize its interface so as to allow multiple parallelization schemes, and extend
its applicability by supporting the solution of large
Hermitian eigenvalue problems.

### Optimizing ChASE for Bethe-Salpeter computations on multi-GPUs

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

#### Contributions

* Port and validate the robustness of the reference version of the ChASE library on Blue Waters;
* Extend the reference implementation of ChASE to distributed memory platforms by porting the new hybrid parallelization of the Chebyshev filter;
* Extend the hybrid parallelization to the Rayleigh-Ritz projection, QR factorization and residual computation;
* Testing the scalability of ChASE when solving extremely large Hermitian eigenvalue problems extracted from specific applications.

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

## Results for 2017/2018

In the third phase of this project, the ChASE library was completely
re-written in order to separate the actual ChASE algorithm from the numerical kernels.
As a C++ program such a separation is accomplished via a pure abstract class which
defines the interface for the C++ numerical kernels. The ChASE algorithm
implementation then uses this interface and all parallel operations and handling of
data is performed by the subclass of the pure abstract ChASE class.
Such rewrite allowed the library to accommodate several different parallelization
scheme from MPI+CUDA to pure MPI using the linear algebra kernels and data distribution
from the Elemental library. The new ChASE library has been tested using several different
eigenvalue problems, as well as on sequences of eigenvalue problems where it
outperforms even the most advanced direct eigensolvers. These results and the library
description will appear in a manuscript submission in early March 2018.

The new library is currently being tested over a new set of very large eigenproblems
generated by the Jena BSE code. Such problems are described by matrices whose rank ranges
from 300k up to 1000k. In this phase of the project we plan to solve these eigenproblems
using as many computing nodes and GPU cards on Blue Waters as feasible for the size of the eigenproblem
under scrutiny.

## Results for 2018/2019

The original Jena VASP-BSE code that we based this project on used a legacy routine to read the Bethe-Salpeter Hamiltonian matrix. This matrix is written by another code and stored in binary format, distributed over hundreds of files for a typical production-run simulation. The legacy routine, implemented into an MPI parallelized code, then read and distributed these files over the different MPI ranks, however, it read in “serial” fashion, i.e., one MPI rank at a time. For large matrices, this slowed down the reading process tremendously, since it did not exploit parallel file access. The Blue Waters software team (Roland Haas, Victor Anisimov) helped us fix this problem, by restructuring the code, so it can read the matrix in parallel. This lead to a tremendous performance improvement, compared to the serial reading. In addition, the Blue Waters team also helped us address another issue, which is related to the distribution of the matrix in memory and over the different MPI ranks. By implementing a “redistribution” code, we can now read the matrix from the existing data format and redistribute it such that it is compatible with the ChASE library.

## Results for 2019/2020

We have fully integrated a hybrid parallelization of
the ChASE library into the Jena BSE code and tested scalability and efficiency of the ChASE library
on the Blue Waters and JUWELS clusters using eigenproblems of increasing size and complexity.
In particular, we tested the performance of ChASE for the diagonalization of Bethe-Salpeter matrices for different physical problems related to exciton binding energies in HfO2, In2O3 and Naphthalene. We used these systems to test
the performance of the eigensolver in the strong and weak scaling regimes. We also
explored the maximum number of k-points, which roughly determines the rank of a matrix, that we can now work with, using the new code. By doing so we were able to extrapolate more accurate physical results than were previously possible. We precisely quantified the performance improvements and also determined what new problems the modified code can address. All the collected data were used in preparing a scientific publication of these results which will be soon submitted to a tier-1 scientific journal. This will constitute the end of the project.


## Visits and meetings

* March 3 -- 11 2017: Jan Winkelmann and Edoardo Di Napoli visited
Andre Schleife in Urbana, Champaign. During the visit several
important details were tackled, paving the way to a promising
integration of the ChASE library into Jena BSE code.

#### Compute resource needs

* Test account on JURECA for Matrix generation in the first phase of the project
* Regular account on Blue Waters in the successive phases of the project.
* Regular account on JUWELS in the final phase of the project.

## Impact and publications

* One journal publication presenting the new ChASE library was submitted in 2018 and published in April 2019 on ACM TOMS {% cite Winkelmann19 --file external/chase_bse_project.bib %}
* One journal publication presenting results related to the use of ChASE to solve very
large eigenvalue problems generated by the BSE Jena code to be submitted in April 2020

{% bibliography --cited --file jlesc.bib %}


## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/chase_bse_project.bib %}
