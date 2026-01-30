---
layout: post
title: Shared Infrastructure for Source Transformation Automatic Differentiation
date: 2016-04-18
updated: 2026-01-30
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - numerics
keywords:
  -
head: narayanan_s
members:
  - hascoet_l
  - hovland_p
  - hueckelheim_j
  - caillau_j
  - bouchot_j
  - montoison_a
---

## Research topic and goals
Our goal is to pursue development of Algorithmic Differentiation (AD) tools, to enhance their applicability to HPC codes. We focus on the adjoint mode of AD, which is the most effective way of obtaining gradients of large HPC simulations. We focus on AD tools by source transformation because of the efficiency of the code they produce.

## Results for 2016--2022

We have continued to develop a runtime library called ADMM to allow source-transformation adjoint AD of input codes that contain the operations pointers and dynamic allocation of memory. This is the first library of its kind for source transformation AD. Before this, dynamic allocation and pointer usage were unsupported in adjoint-mode-source-transformation AD.  The library ensures that any memory accessed in the reverse computation exists through restoration (if needed) and contains the same value as it would have in the forward computation. Pointer variables used to access memory in the forward computation are updated to access the corresponding memory in the reverse computation. We have tested this method with a medium-sized code. After an initial version the library was developed in 2016 that targeted codes written in C we have worked on refinements to the library and extended it to be target codes written in Fortran. We are currently refining the library to account for shortcomings in the first version.

We have continued to develop the ability to interoperate OpenAD from Argonne and Tapenade from INRIA {% cite NarayananHascoet2016 --file jlesc.bib %}. Interoperation between the OpenAD and Tapenade is possible because they share the same global architecture i.e., a front-end which parses and builds an internal representation, followed by an static data-flow analysis stage, then actual building of the differentiated program still in internal form, and finally a back-end that outputs this differentiated internal form into new source files. The interoperation uses Tapenade for parsing the code and analysis. It uses OpenAD's XAIFBooster module for code transformation. The code to be differentiated is written into the XML Abstract Interface Form (XAIF) by Tapenade which is subsequently transformed by XAIFBooster. The transformed XAIF is converted back to source code by Tapenade. We have tested the new tool flow on various test cases from OpenAD's regression testsuite.

{% person narayanan_s %} developed two-level checkpointing of adjoint computations with the additional capability for suspending and restarting the computation. This was applied to MITgcm, a code that can be used to study both atmospheric and oceanic phenomena. The approach is partially based on the work previously performed by {% person aupy_g %} and {% person hovland_p %}.

In {% cite HuckelheimHascoet2022 --file jlesc.bib %} we presented an extension to Tapenade. Our extension adds support for input programs containing OpenMP parallel loops. OpenMP is an industry standard that allows portable parallelization of C, C++, and Fortran programs. In our work, we focus on programs containing OpenMP *worksharing loop constructs*. The behavior of this construct can be controlled by the `schedule` and `scoping` clauses, which affect the data flow and thus must be taken into account during differentiation. Using our extension, Tapenade is able to generate derivative programs that, to a large degree, mimic the parallelism of the input programs, in both forward- and reverse-mode.

Our extension to Tapenade is based on a theoretical framework that we developed in order to reason about the correct scoping of variables in the generated derivative code. For reverse-mode AD, we also developed a runtime support library that correctly reverses OpenMP schedules and handles the storage of inputs to nonlinear intermediate operations during the original computation and retrieval during the derivative computation in a thread-safe manner. This extension is now  publicly available and included by default in Tapenade distributions.

We evaluated the new Tapenade capabilities on three test cases: a stencil loop, which follows a computational pattern occurring in structured-mesh solvers, image processing, neural networks, and many other applications; a lattice-Boltzmann solver from the Parboil benchmark suite, with applications in computational fluid dynamics; and a Green's function Monte Carlo kernel from the CORAL benchmark suite modeling nuclear physics.

The differentiated codes produced by our new version of Tapenade achieve a speedup through parallelization compared with their serial counterparts in all our test cases. The scalability of the forward mode was generally as good as that of the original codes. The reverse-mode derivative codes generally scaled less well but still achieved over 2X speedups compared with sequential code. There is a choice between atomic updates (causing a runtime overhead) and reductions (causing a memory and runtime overhead) for the adjoint, where the best choice was case dependent. Since our adjoint test cases (and possibly many other real-world applications) contain parallel updates to the same output array with a low rate of conflicts between threads, separate tool development was performed to enable faster and more memory-efficient reductions.

We are currently extending this work by investigating the use of automated theorem provers to improve the precision of the static analysis in Tapenade, and improve the parallel scalability of generated derivative programs. Specifically, we build a model in the SMT solver Z3 that contains the knowledge about array index expressions that are accessed concurrently by the input program, and use that model to determine a subset of the array index expressions in the generated derivative code that can also safely be accessed concurrently. Preliminary results of this work are presented in {% cite ppopp22-poster-ad-z3 --file jlesc.bib %}.

We organized a minitutorial *Automatic Differentiation as a Tool for Computational Science* at the 2021 SIAM Conference on Computational Science and Engineering. The tutorial broadly provided an introduction to AD as well as advanced topics such as memory requirements and parallelism. We demonstrated the use of AD tools and developed resources such as Jupyter notebooks for hands-on use on Google Colab by the attendees {% cite NarayananEtAl2021 --file jlesc.bib %}.

## Results for 2023/2024
We have successfully used Tapenade to differentiate the Massachusetts Institute of Technology General Circulation Model (MITgcm){% cite GaikwadEtAl2024 --file jlesc.bib %}, a code which is widely used by the climate science community to simulate planetary atmosphere and ocean circulations. A defining feature of the MITgcm is that it has been developed to be compatible with an algorithmic differentiation (AD) tool, TAF, enabling the generation of tangent-linear and adjoint models.  A subset of MITgcm was also previously differentiated using OpenAD. The tangent-linear and adjoint models provide gradient information which enables dynamics-based sensitivity and attribution studies, state and parameter estimation, and rigorous uncertainty quantification. Importantly, gradient information is essential for computing comprehensive sensitivities and performing efficient large-scale data assimilation, ensuring that observations collected from satellites and in-situ measuring instruments can be effectively used to optimize a large uncertain control space. As a result, the MITgcm forms the dynamical core of a key data assimilation product employed by the physical oceanography research community: Estimating the Circulation and Climate of the Ocean (ECCO) state estimate. Although MITgcm and ECCO are used extensively within the research community, the AD tool TAF is proprietary and hence inaccessible to a large proportion of these users.

## Results for 2024/2025
We have added new profiling capability to Tapenade. Checkpointing is a cornerstone of data-flow reversal in adjoint algorithmic differentiation. Checkpointing is a storage/recomputation trade-off that can be applied at different levels, one of which being the call tree. We are looking for good placements of checkpoints onto the call tree of a given application, to reduce run time and memory footprint of its adjoint. There is no known optimal solution to this problem other than a combinatorial search on all placements. We have implemented a heuristics based on run-time profiling of the adjoint code. We have applied it on test cases taken from the MITgcm ocean and atmospheric global circulation model which we have previously differentiated using Tapenade. 

We have differentiated HFBTHO using Tapenade. The HFBTHO code  implements a nuclear energy density functional solver useful for modeling the structure of atomic nuclei. HFBTHO has previously been used to calibrate energy functionals by using derivative-free optimization methods. To enable gradient-based optimization approaches, we must compute the derivatives of HFBTHO with respect to the parameters of the energy functional, which are a subset of all input parameters of the code. The derivatives obtained by using AD match well with those obtained by finite-difference approximation. 

## Results for 2025/2026
We have published the paper on {HFBTHO-AD}{% cite HascoetEtAl2025 --file jlesc.bib %}. We are differentiating the reference BLAS code using Tapenade. We have used AI tools to generate the invocations of Tapenade and the testing code.

## Visits and meetings
Frequent e-mail exchanges and virtual meetings between the members of the project.

## Impact and publications

* In 2016, we have presented one extended abstract and a poster in AD2016, submitted a talk in USNCCM, and have another publication in preparation.
* In 2017, we have given a talk in USNCCM, included our work at the DOE Applied Math PI meeting in a poster.
* In 2021, we have submitted a paper on automatic differentiation of OpenMP programs;
* In 2021, we have organized a minitutorial at SIAM CSE21.
* In 2023, we have submitted a paper on the differentiation of MITgcm using Tapenade.
* In 2024, we submitted a paper on run-time profiling of the adjoint code generated by Tapenade.
* In 2024, {% person hovland_p %}, {% person hascoet_l %}, {% person hueckelheim_j %}, and {% person narayanan_s %} were organizers for the AD2024 conference.
* In 2025, we published a paper on differenting a nuclear energy density functional solver code, using Tapenade.

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
We plan to continue to work on applying and improving Tapenade. We will plan to work on releasing a library containing differentiated BLAS routines. Additionally, we plan to explore other
topics in the field of algorithmic differentiation.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/shared_infra_ad.bib %}
