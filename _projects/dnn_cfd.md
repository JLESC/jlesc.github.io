---
layout: page_project
title: Deep Neural Networks for CFD Simulations
date: 2019-12-16
updated: 2019-12-16
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - apps
  - numerics
keywords:
  - CFD
  - deep neural networks
  - autoencoders
  - generative adversial networks
  - transfer learning
head: lintermann_a
members:
  - tsubokura_m
  - onishi_k
  - ruettgers_m
---

## Research topic and goals

Simulation-based optimization
in engineering requires high computational power and
may benefit from system heterogeneity. Highly scalable CFD
solvers have been developed at R-CCS and JSC to conduct
large-scale simulations. R-CCS focuses on full-scale
simulations of vehicles aerodynamics. JSC
investigates respiratory flows to improve
medical treatments. Due to massive amounts of data produced, the
analysis of the results is becoming a time-consuming
process. Data-driven approaches have the potential to speed up
analyses or to even replace certain physics in simulations. Deep
learning methods have proven to be a fast alternative to extract
multi-scale features from high-dimensional data
sets. Deep neural networks (DNN) are able to
predict the steady-state flow and aerodynamic coefficients around bluff
bodies and airfoils, and unsteady laminar vortex shedding over
circular bodies. Autoencoders (AE) or generative models, like variational AEs or generative adversarial networks (GANs),
have shown great potential in predciting 2D and 3D flow fields.

It is the aim of the proposed cooperation to tie in with these
topics and to develop methods to efficiently compute and analyze
complex optimization setups in engineering utilizing heterogeneous
architectures. Physics-informed trained networks that allow for
transfer learning are developed. That is, learning starts with pre-trained networks
trained on data with similar features. It is
investigated (i) how such such pre-trained DNNs adapt to the various flow
configurations of interest for R-CCS and JSC, (ii) how they can
speed up the simulation workflow, and (iii) how they
overcome a shortage of training data.

Bilateral support activities will lead to
knowledge exchange with respect to the different hardware available
at the partners' sites, in CFD methods, and in deep learning
approaches. Hence, expertise of the centers in these fields are
strongly promoted in the course of this project. To foster the
cooperation, mutual short-time stays of the involved scientists are
planned.  

## Results for 2020/2021
Due to the CODID-19 pandemic, the activities in the project had to be reduced. Unfortunately, a plannned research stay of JSC's Ph.D. student Mario Rüttgers at R-CCS could not take place. An exchange of research ideas took, however, place online via video conferences (see Visits and meetings below). 

JSC was able to continue its work on DNNs. The architecture for such a neural network was developed to predict the sound pressure level in a 2D square domain. It was trained by numerical results from up to 20,000 GPU-based lattice-Boltzmann simulations that include randomly distributed rectangular and circular objects, and monopole sources. Types of boundary conditions, the monopole locations, and cell distances for objects and monopoles serve as input to the network. Parameters were studied to tune the predictions and to increase their accuracy. An optimal choice of the parameters lead to network-predicted results that are in good agreement with the simulated findings. The results have been presented at the International Conference on High Performance Computing - ISC High Performance 2020. A peer-reviewed article has been published in the corresponding Springer series as part of the Lecture Notes in Computer Science (LNCS){% cite Ruttgers2020 --file jlesc.bib %}.

## Results for 2019/2020
None.

## Visits and meetings

* troughout 2020: discussions of hosting a JSC reasearcher at R-CCS (canceled due to the COVID-19 pandemic)
* 02.12.2020: R-CCS presents latest work on mode decomposition using ML for 3D cylinder cases to JSC.
* 23.03.2020: JSC presents previous work in the combined field of CFD, AI to the JLESC partners at R-CCS (application of AI methods to automatize CFD workflows, ML-based segmentation of computer tomography images in preparation of CFD computations of respirtaory flows, prediction of sound pressure level distributions with DNNs).
* 07.03.2020 - 20.03.2020: Research exchange: Mario Rüttgers from JSC will work together with researchers from R-CCS at R-CCS
* 07.03.2020 - 11.03.2020: Meeting of the PIs Makoto Tsubokura, Andreas Lintermann, and the researchers Keiji Onishi (RIKEN) and Mario Rüttgers at COMPSAFE 2020 (Kobe, Japan)

## Impact and publications
<!-- {% cite Ruettger2020 --file jlesc.bib %} -->

{% bibliography --cited --file jlesc.bib %}

## Future plans
Further intensification of the cooperation and planning of research stays for a post-pandemic phase.

## References

 
