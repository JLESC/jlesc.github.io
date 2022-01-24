---
layout: page_project
title: Machine Learning-driven Predictive Analysis of Protein Diffraction Data
date: 2020-01-31
updated: 2022-01-24
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - apps
keywords:
  - machine learning, protein folding
head: taufer_m
members:
  - tama_f
  - luszczek_p
  - miyashita_o
  - olaya_p
  - cainolores_s
  - wyatt_m
  - lama_v
---

## Research topic and goals

A protein's structure determines its function. Different proteins have different structures; proteins in the same family share similar substructures and may share similar functions. Additionally, one protein may exhibit several structures (or conformations). Identifying different proteins and differentiating between their different conformations is a task that could help solve many difficult problems, such as determining the cause of diseases and designing drugs. X-ray Free Electron Laser (XFEL) beams are used to create diffraction patterns (images) that can reveal protein structure (and function). The translation between diffraction patterns in the XFEL images and protein structures is non-trivial.

Three features are embedded in an image and can be captured by ML methods: the orientations of a protein conformation, the conformations of a folded protein, and the different conformations of different proteins. This collaboration between UTK and RIKEN aims to develop a ML-driven workflow integrating a suite of ML methods (from simple k-nearest neighbors and random forest to more complex neural networks) to capture orientations, conformations, and types of proteins from XFEL images. Our ML-driven workflow will build on top of open-source software and open-access datasets. The workflow will be packaged into a tool that will allow us to study and understand the impact of different ML methods and numerical precisions on prediction accuracy, power consumption, and performance for synthetic protein datasets (from simulations) first, and for real XFEL images, as our tool is validated towards noisy, simulated datasets. The tool will be used by the collaborators at RIKEN for protein discovery.

## Results for 2021/2022

We added the prediction of the final property required to identify a protein structure which is the protein type. Moreover we identify and propose a solution to overcome symmetry challenges observed when predicting the 3rd rotational angle. We do this by changing the range for the third angle from 0 to 360 degrees to 0 to 180 degrees without affecting the science behind it. 
We quantify the accuracy of the predictions including the three angles of the orientation, the different conformations, and now the protein type. To this end we test XPSI on two protein types: EF2 and ribosome, with two conformations each (1n0u and 1n0vc for EF2 and 9a and bc for ribosome), and two imaging resolutions (high and low). For the high image resolution, we obtain an orientation prediction error up to 10 degrees, a difference in the predicted third angle up to 5 degrees, conformation accuracy prediction of 92%, and 100% of protein type accuracy prediction. We also provide a Jupyter Notebook for shareability and portability of our framework. As next steps, we aim to test the framework with more data (i.e. three or more protein types with two or more conformations each); and compare our framework with a traditional XFEL slice matching approach which is used for 3D reconstruction and follows the premises of orientation prediction through multiple and time consuming iterations.

## Visits and meetings

None yet.

## Impact and publications

Talk: 11th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2020. Short Talk: XPSI: XFEL-based Protein Structure Identifier.
Poster: Paula Olaya, Michael R. Wyatt II, Silvina Caino-Lores, Florence Tama, Osamu Miyashita, Piotr Luszczek, and Michela Taufer, “XPSI: X-ray Free Electron Laser based Protein Structure Identifier,” ACM/IEEE International Conference for High Performance Computing, Networking, Storage and Analysis, Research Poster, Atlanta, GA, 2020.
Talk: 12th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: XPSI: XFEL-based Protein Structure Identifier.
Talk: 13th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: XPSI: XFEL-based Protein Structure Identifier.

## Future plans

As next steps, we are working on 1) Share our current Jupyter Notebook on platforms like Wasabi or Google Collab; 2) testing the framework with new provided data 3) comparing our framework with a traditional XFEL slice matching approach which is used for 3D reconstruction and follows the premises of orientation prediction through multiple and time consuming iterations.

## References
[Github Repository](https://github.com/TauferLab/Project_Protein_Diffraction)
