---
layout: post
title: Deep Neural Networks for CFD Simulations
date: 2019-12-16
updated: 2025-01-24
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
  - physics-informed neural networks
  - reduced order models
  - graph neural networks
head: lintermann_a
members:
  - tsubokura_m
  - junya_o
  - kazuto_a
  - ruettgers_m
  - sharma_r
  - calmet_h
  - puri_r
  - krochak_o
  - liu_x
---

## Research topic and goals

Simulation-based optimization in engineering requires high computational power and may benefit from system heterogeneity. Highly scalable CFD solvers have been developed at R-CCS, JSC, and BSC to conduct large-scale simulations. R-CCS focuses on full-scale simulations of vehicles aerodynamics. JSC and BSC investigate respiratory flows to improve medical treatments. Due to massive amounts of data produced, the analysis of the results is becoming a time-consuming process. Data-driven approaches have the potential to speed up analyses or to even replace certain physics in simulations. Deep learning methods have proven to be a fast alternative to extract multi-scale features from high-dimensional data sets. Deep neural networks (DNN) are able to predict the steady-state flow and aerodynamic coefficients around bluff bodies and airfoils, and unsteady laminar vortex shedding over circular bodies. Autoencoders (AE) or generative models, like variational AEs or generative adversarial networks (GANs), have shown great potential in predicting 2D and 3D flow fields.

It is the aim of the proposed cooperation to tie in with these topics and to develop methods to efficiently compute and analyze complex optimization setups in engineering utilizing heterogeneous architectures. The joint project focuses on the following three activities:

* The first activity concentrates on machine learning (ML)-based reduced order models (ROM) for the reconstruction of flow fields. Conventional linear ROM approaches, e.g., proper orthogonal decomposition (POD), cannot successfully reproduce the the nonlinear behavior of high Reynolds number (Re) flow fields. To address this problem, recently, nonlinear ROMs based on neural networks are attracting attention and are studied within this project.    
* The second activity involves physics-informed neural networks (PINNs) for the prediction of flow fields. PINNs integrate the physical laws based on the governing equations along with constraints given by initial and boundary conditions in the loss function of a DNN. In the current project, they are trained with sparse spatial and/or temporal data of a computational domain to predict flow fields of the complete domain. The developments will be used for predicting flow based on sparse data from experimental fluid dynamics, e.g., the sparse pressure and velocity distributions at the surface of a road vehicle.
* The third activity focuses on flow predictions with graph neural networks (GNNs). GNNs can be applied to any shape or volume represented by a graph, e.g., triangulated shapes, or computational grids. Convolutional filters in GNNs operate on nodes and their neighboring nodes. This allows a more efficient training compared to convolutional neural networks (CNNs), whose convolutional filters are rectangular and operate in Cartesian directions. In this project, GNNs are trained with varying geometries of a flow configuration to predict the flow fields in new geometries that have not been part of the training data. The networks are developed for two types of training strategies: (i) in a supervised data-driven manner with ground truth data coming from CFD simulations and (ii) in an unsupervised data-free manner, where the network is guided with physical loss functions towards physically correct flow fields.

Bilateral support activities will lead to
knowledge exchange with respect to the different hardware available
at the partners' sites, in CFD methods, and in deep learning
approaches. Hence, expertise of the centers in these fields are
strongly promoted in the course of this project. To foster the
cooperation, mutual short-time stays of the involved scientists are
planned.

## Results for 2019/2020
None.

## Results for 2020/2021
Due to the CODID-19 pandemic, the activities in the project had to be reduced. Unfortunately, a planned research stay of JSC's Ph.D. student Mario Rüttgers at R-CCS could not take place. An exchange of research ideas took, however, place online via video conferences (see Visits and meetings below).

JSC was able to continue its work on DNNs. The architecture for such a neural network was developed to predict the sound pressure level in a 2D square domain. It was trained by numerical results from up to 20,000 GPU-based lattice-Boltzmann simulations that include randomly distributed rectangular and circular objects, and monopole sources. Types of boundary conditions, the monopole locations, and cell distances for objects and monopoles serve as input to the network. Parameters were studied to tune the predictions and to increase their accuracy. An optimal choice of the parameters lead to network-predicted results that are in good agreement with the simulated findings. The results have been presented at the International Conference on High Performance Computing - ISC High Performance 2020. A peer-reviewed article has been published in the corresponding Springer series as part of the Lecture Notes in Computer Science (LNCS){% cite Ruttgers2020 --file jlesc.bib %}.

R-CCS contributed with their talk "Distributed Learning for Three-dimensional Flow Field Mode Decomposition on Fugaku" to the 34th Computational Fluid Dynamics Symposium, which was held online on Dec. 21-23, 2020 (K. Ando, K. Onishi, R. Bale, M. Tsubokura, A. Kuroda, and K. Minami). In their research, R-CCS developed and investigated non-linear CNN-based mode decompositioning methods for three-dimensional flow fields around circular cylinder configurations. For the distributed learning, up to 25,250 nodes (1,212,000 cores) on the supercomputer Fugaku were used. Scalable model parallelization techniques for auto-encoder neural networks with a sustained performance of 7.8PFLOPs on 25,250 nodes were implemented.

## Results for 2021/2022
The still ongoing pandemic lead again to reduced project activities. Nevertheless, both groups from JSC and R-CCS were able to continue their research.

JSC mainly worked on developing and integrating novel AI technologies into their CFD workflows. Reinforcement learning (RL) was implemented for shape optimization problems. For a generic case, i.e., a 2D channel with a constriction, RL was used to satisfy an optimum criterion that is a function of the pressure loss in the channel and the increase of the temperature given by the heat transfer at the channel wall. The work was presented at the International Conference on High Performance Computing - ISC High Performance 2021. A peer-reviewed article was published in the corresponding Springer series as part of the Lecture Notes in Computer Science (LNCS){% cite Ruttgers2021ISC --file jlesc.bib %}. An application of this technique to the shape optimization of a human nasal cavity is currently ongoing. At the JLESC meeting in 02/2021, the results of automating CFD workflows with a focus on the application to nasal cavity simulation workflows was presented. These results were later integrated into a journal article {% cite Ruttgers2022APIN --file jlesc.bib %}.

R-CCS continued their work on developing DNNs for mode decompositioning of flow fields. They also participated in the International Conference on High Performance Computing - ISC High Performance 2021, with a talk "Nonlinear Mode Decomposition and Reduced-Order Modeling for Three-Dimensional Cylinder Flow by Distributed Learning on Fugaku". They used CNNs to perform a parallel mode decompositioning of the flow field and employed long short-term memory networks (LSTMs) to predict the temporal development of the flow via the modes. The performance of this method was evaluated for different numbers of modes. A peer-reviewed article was published in the corresponding Springer series as part of the Lecture Notes in Computer Science (LNCS){% cite Ando2021ISC --file jlesc.bib %}

## Results for 2022/2023
Rakesh Sarma and Rishabh Puri joined the JLESC activities from the JSC side, and Onishi Junya from the R-CCS side. JSC and R-CCS jointly developed PINNs for flow predictions in classical problems of fluid dynamics, i.e., Poisueille flow, potential flow, Blasius boundary layer flow, and the Taylor-Green vortex. Rhishabh Puri presented the results at the Platform for Advanced Scientific Computing 2023 (PASC23) conference in Davos, Switzerland.

JSC and R-CCS jointly developed a GNN for the prediction of flow around air foils. The GNN uses computational grids of the simulation framework "multiphysics-Aerodynamisches Institut Aachen" (m-AIA), an extended version of the formerly known "Zonal Flow Solver"{% cite Lintermann2020 --file jlesc.bib %}, and automatically generates an adjacency matrix that contains information about nodes and neighbouring nodes. First steps have been initiated to develop an open access library for GNN-based flow predictions. The PINN and GNN activities were intensified by a research visit of Onishi Junya at JSC in August 2023.

Regarding the AI-based reduced-order model, in this fiscal year, the functionality of the model has been enhanced. That is, a variational autoencoder (VAE) has been integrated for outputting latent variables in the model. Due to this modification, the reduction performance was increased for turbulent flow simulation data. These results have been presented at the ParCFD2022 and WCCM2022 conferences.

## Results for 2023/2024
Rishabh Puri starts his PhD programme at KIT, but continues the JLESC activities as an associated researcher. Hadrien Calmet joined the JLESC activities from the BSC side. After demonstrating the robustness of PINNs for flow predictions in classical flow problems, the activities regarding PINNs are extended to vehicle aerodynamics. That is, flow fields around a road vehicle are predicted based on sparse spatial data at the vehicles's surface, to derive force coefficients such as drag or lift. In a first step, the sparse surface data are extracted from CFD simulations conducted by the R-CCS side, as discussed during a research visit of Mario Rüttgers at R-CCS in October 2023. After this proof-of-concept, the sparse surface data could stem from experimental measurements at a driving vehicle.

The activities regarding GNNs are extended to respiratory flows. Hadrien Calmet aims to investigate GNNs by initiating the first phase, which involves employing the existing 2D algorithm of Graph Convolutional Neural Networks (GCNN) {% cite Ogoke2021 --file jlesc.bib %} and evaluating its efficacy with a 3D dataset. The goal is to predict respiratory system flow features such as air resistance, wall shear stress, and energy flux within the human nasal cavity during inspiration. The initial step involves generating a virtual population through random scaling applied simultaneously to length, width, and height. Three distinct geometries are chosen, including an average one based on 35 healthy patients, a Caucasian healthy patient, and an Asian healthy patient. Once the neural network demonstrates satisfactory accuracy, a second phase is planned to assess the algorithm's performance. This evaluation will utilize Paraver, a performance tool developed at BSC. Additionally, there is a consideration for the implementation of multi-GPU using PyTorch, allowing for a performance comparison. The final step involves testing the AI4HPC open-source library to train the dataset with the GNN algorithm and engaging in a discussion about the obtained results.

Regarding the AI-based reduced-order model, the scope of application is extended. First, the method is applied to the turbulent flow around a vehicle calculated with 260 million cells. Distributed training was conducted for over 14 hours using 55,000 Fugaku computing nodes. Since the model is still in the early stages of learning, small-period eddies could not yet be reproduced, but large-scale structure could be reconstructed. Second, the robustness of the model is addressed for a two-dimensional flow around two square cylinders, which have a varying distances. It is demonstrated that flow configurations that did not belong to the training data are successfully reproduced using 24 modes. It is planned to submit these results to the JLESC special issue of the journal "Future Generation Computer Systems".

## Results for 2024/2025
The work on PINNs in collaboration between JSC and RIKEN is published in the JLESC special issue of *Future Generation Computer Systems* {% cite Puri2024 --file jlesc.bib %}. In this work, the accuracy and performance of PINNs is compared to DNNs for classical flow problems. The work quantifies and compares the accuracy of the networks when a fraction of training data is available for training. This comparison also considered the computational effort for training the networks. Furthermore, the effect of location of the training data in the computational domain and potential noise are also assessed. It is found that in most cases, PINNs outperform DNNs in terms of accuracy, especially when the training data is positioned in certain Regions of Interest, such as near the wall. These findings are especially interesting for future investigations in vehicle aerodynamics, where sensor data is sparse and mostly available close to the wall of the vehicle body. 

Currently, RIKEN is leading another development to the PINN model, where it is extended to predict flow fields under arbitrary flow conditions, such as Reynolds numbers and inflow velocity distributions, by introducing a Deep Operator Network (DeepONet). This approach is expected to facilitate the performance of a large number of simulations for various scenarios at a low cost. 

Hadrien Calmet from BSC is continuing his work on the GCNN applied to respiratory flow problems. The objective is to predict the pressure drop and wall shear stress for flow in the nasal cavity with GCNN. Additionally, a data augmentation strategy is developed to generate a virtual population from a limited amount of real data, addressing the problem of data accessibility and enabling generalization to unseen real geometries. The trainings are facilitated by the AI4HPC framework developed at JSC, which enables large scale trainings of ML models in HPC systems. The work is currenly under progress and is planned to be submitted to a journal. 

In this project period, Mario Rüttgers from JSC started working at the Data-Driven Fluid Engineering (DDFE) Lab at Inha University in South Korea. However, he continues to be associated to the JLESC activities in this project. The current efforts are directed towards development of physics-aware GCNNs for different use-cases in respiratory flows, urban flows, and combustion. Apart from the baseline development, model parallelism is being investigated for the GCNN model with graph partitioning approaches in collaboration with JSC.

The work on AI-based reduced-order models between JSC and RIKEN is published in the JLESC special issue of *Future Generation Computer Systems* {% cite Higashida2024 --file jlesc.bib %}.
The robustness of an artificial neural network for model order reduction of flow field data is studied, using large-scale distributed learning on up to 6259 nodes of the Fugaku supercomputer. Flow around two square cylinders with varying center distances is analyzed using simulation data for training and testing. The network's ability to reconstruct flow fields with 2, 12, and 24 modes is evaluated, showing that 2 modes fail to capture both low- and high-frequency structures, while 12 and 24 modes yield more accurate reconstructions, especially for high-frequency waves near the cylinders. With 24 modes, the network produces smooth velocity fields that reproduce all relevant flow features for all geometric variations. Comparisons with proper orthogonal decomposition (POD) using 24 modes reveal that the neural network achieves lower mean squared errors across all cases, highlighting its superiority over linear methods like POD for reconstructing non-linear flow fields.

## Results for 2025/2026
In this project period, Oleksandr Krochak from JSC and Rahul Bale from R-CCS started joining the JLESC meetings. Krochak is working in the HANAMI project, which already collaborates with R-CCS on CFD in bio-medical applications. His association to JLESC is hence useful to mutually benefit the two projects. Bale displayed interest in the JLESC project after a visit to R-CCS by Krochak in the context of the HANAMI project. 

Krochak currently uses the previously mentioned m-AIA simulation framework. He works on simulations of particle inhalation, using a real nasal cavity geometry obtained through an ML-augmented computer tomography processing pipeline developed at JSC by Mario Rüttgers {% cite Ruttgers2025 --file jlesc.bib %}. With the combination of internal and external flow regions, particles initialized at rest outside the nostrils, and time-varying boundary conditions, a realistic study of particle inhalation can be performed to provide a qualitative assessment of viral transmission risks. 

Krochak and Lintermann were responsible for the organization of the biomedical session at the 2nd HANAMI High Level Symposium in Chamonix, France, in December 2025. During this symposium, a number of presentations from JLESC partners and associated parties took place. Mario Rüttgers delivered a keynote presentation, while Rahul Bale, Hadriel Calmet and Oleksandr Krochak gave presentations during the parallel session. Additionally, some associated parties working on biomedical applications also presented: Andrea Schilacci (PostDoc at the Institute of Aerodynamics  - AIA, RWTH Aachen University), Matthias Meinke (head of the numerical group at AIA, RWTH Aachen), and as Beatriz Eguzkitza (BSC). This symposium brought researchers from different institutes together and led to productive knowledge exchange that can lead to future collaborations.  

R-CCS continued their developments on PINNs by developing a PI-DeepONet. In PI-DeepONet, the idea is to achieve generalization across unseen conditions by learning functional mappings between the input and output parameters of the network. This has been demonstrated on a flow over a backward-facing step for an arbitrary inlet velocity profile and Reynolds number. The work, in collaboration with JSC and Inha University, was submitted to the journal Computers & Fluids and is currently under review. Furthermore, the effectiveness of PINNs in simulating unsteady flows, with a particular focus on the impact of the number of collocation points used during the training process were investigated {% cite Onishi2025 --file jlesc.bib %}. 

R-CCS also continued their research on ML-based ROM. The proposed ROM was evaluated for its robustness in predicting turbulent flows around various vehicle body shapes.
By training on instantaneous flow-field snapshots for six different body shapes, it was demonstrated that flows around five untrained body shapes could be successfully reproduced using 32 nonlinear modes with the proposed ROM.

The work on GNNs is progressing across three different use cases. Hadrien Calmet from BSC continued his work on a GCNN applied to respiratory flows {% cite Calmet2025 --file jlesc.bib %}. A joint paper, in collaboration with JSC, was submitted to the journal Physics of Fluids, and is currently under review. Rishabh Puri from KIT is continuing development of a physics-aware GCNN applied to prediction of flow over arbitrary shapes. The work is in collaboration with Mario Rüttgers from Inha University (who continues to be associated to the JLESC project) and JSC. In the third use case, Rüttgers developed a GCNN for urban flows applied to drag aware-path planning for unmanned aerial vehicles. This work is currently under review for the journal Engineering Applications of Artificial Intelligence.  

Lintermann also published the proceedings of the ParCFD 2024 conference, which was organized by JSC at Bonn, Germany {% cite Lintermann2025 --file jlesc.bib %}, with participation from many JLESC collaborators of this project. These proceedings included JLESC-associated contributions on reinforcement learning {% cite Lagemann2025 --file jlesc.bib %}, transformers for time marching of fluid flow fields {% cite Sarma2025 --file jlesc.bib %} and autoencoders for turbulent boundary layers {% cite Shao2025 --file jlesc.bib %}.

In this period, a successful VSR compute time proposal was jointly granted to JSC, R-CCS, and Inha University. The proposal was submitted as an extension project, however R-CCS was included in a sub-project to enable progressing the JLESC efforts on the JURECA-DC system at JSC. A total of 1.3 million CPU and 1.57 million GPU core-hours were granted to the proposal, which runs until April 2026.  

## Visits and meetings

* throughout 2020: discussions of hosting a JSC researcher at R-CCS (canceled due to the COVID-19 pandemic)
* 02.12.2020: R-CCS presents latest work on mode decomposition using ML for 3D cylinder cases to JSC.
* 23.03.2020: JSC presents previous work in the combined field of CFD, AI to the JLESC partners at R-CCS (application of AI methods to automatize CFD workflows, ML-based segmentation of computer tomography images in preparation of CFD computations of respiratory flows, prediction of sound pressure level distributions with DNNs).
* 08.12.2020 - 11.12.2020: Meeting of the PIs Makoto Tsubokura, Andreas Lintermann, and the researchers Keiji Onishi (R-CCS) and Mario Rüttgers in the framework of the COMPSAFE 2020 online conference.
* 24.02.2021 - 26.02.2021: Mario Rüttgers presents the jointly developed results at the 13th JLESC workshop, online.
* 04.07.2022 - 06.07.2022: Mario Rüttgers presents the jointly developed results at the Kobe Opportunities workshop organized by Makoto Tsubokura in Brussels, Belgium.
* 28.09.2022 - 30.09.2022: Mario Rüttgers presents the jointly developed results at the 14th JLESC workshop in Urbana-Champaign, USA.
* 21.03.2023 - 23.03.2023: Ando Kazuto presents the jointly developed results at the 15th JLESC workshop in Bordeaux, France.
* 03.07.2023 - 07.07.2023: Research exchange: Onishi Junya from R-CCS visits researchers from JSC at JSC.
* 24.10.2023 - 27.10.2023: Research exchange: Mario Rüttgers visits researchers from R-CCS at R-CCS.
* 16.04.2024 - 18.04.2024: Rakesh Sarma (JSC), Junya Onishi (R-CCS) and Hadrien Calmet (BSC) present the jointly developed results at the 16th JLESC workshop in Kobe, Japan.
* 02.09.2024 - 04.09.2024: Mario Rüttgers (JSC), Rishabh Puri (KIT), Rakesh Sarma (JSC), Hadrien Calmet (BSC) and Junya Onishi (R-CCS) presented at the 35th Parallel Computational Fluid Dynamics (ParCFD) conference in Bonn, Germany.
* 08.09.2024 - 11.09.2024: Makoto Tsubokura from R-CCS and Mario Rüttgers from JSC presented at the 15th International Conference on Parallel Processing and Applied Mathematics (PPAM), Ostrava, Czech Republic.
* 13.05.2025 - 15.05.2025: Rakesh Sarma (JSC) presents the jointly developed results at the 17th JLESC workshop in Argonne, USA.
* 27.05.2025 - 30.05.2025: Kazuto Ando (R-CCS), Rahul Bale (R-CCS) and Makoto Tsubokura (R-CCS) presented at the 1st international Symposium on AI and Fluid Mechanics, Chania, Greece
* 24.11.2025 - 26.11.2025: Rakesh Sarma (JSC), Hadrien Calmet (BSC), Junya Onishi (R-CCS) and Andreas Lintermann (JSC) presented at the 36th Parallel Computational Fluid Dynamics (ParCFD) conference in Merida, Mexico.
* 08.12.2025 - 11.12.2025: Mario Rüttgers (DDFE), Hadrien Calmet (BSC), Makoto Tsubokura (R-CCS), Oleksandr Krochak (JSC) and Andreas Lintermann (JSC) presented and hosted sessions at the 2nd HANAMI High-Level Symposium in Chamonix, France.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}

## Future plans
Future plans are discussed in regular meetings. Furthermore, Makoto Tsubokura intends to visit JSC in 03/2025 to further discuss the future project plan.

## References


