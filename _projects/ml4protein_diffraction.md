---
layout: page_project
title: Machine Learning-driven Predictive Analysis of Protein Diffraction Data
date: 2020-01-31
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
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
---

## Research topic and goals

A protein's structure determines its function. Different proteins have different structures; proteins in the same family share similar substructures and may share similar functions. Additionally, one protein may exhibit several structures (or conformations). Identifying different proteins and differentiating between their different conformations is a task that could help solve many difficult problems, such as determining the cause of diseases and designing drugs. X-ray Free Electron Laser (XFEL) beams are used to create diffraction patterns (images) that can reveal protein structure (and function). The translation between diffraction patterns in the XFEL images and protein structures is non-trivial.

Three features are embedded in an image and can be captured by ML methods: the orientations of a protein conformation, the conformations of a folded protein, and the different conformations of different proteins. This collaboration between UTK and RIKEN aims to develop a ML-driven workflow integrating a suite of ML methods (from simple k-nearest neighbors and random forest to more complex neural networks) to capture orientations, conformations, and types of proteins from XFEL images. Our ML-driven workflow will build on top of open-source software and open-access datasets. The workflow will be packaged into a tool that will allow us to study and understand the impact of different ML methods and numerical precisions on prediction accuracy, power consumption, and performance for synthetic protein datasets (from simulations) first, and for real XFEL images, as our tool is validated towards noisy, simulated datasets. The tool will be used by the collaborators at RIKEN for protein discovery.


## Results for 2019/2020
We present XPSI (XFEL-based Protein Structure Identifier) which is a framework that relies on ML methods (autoencoder and kNN) to capture key information that allows the identification of properties, such as spatial orientation, protein conformation, and different protein types from the diffraction patterns. 

An overview of our framework goes as follows, the diffraction patterns are processed by an autoencoder that captures key information and produces a tensor representation of each pattern. The autoencoder consists of an encoder and a decoder. The encoder has 3 convolutional filters and downsampling layers. The decoder has the reverse structure of the encoder. The new latent space is used to train and validate traditional machine learning models such as k-nearest neighbors (kNN). We use a kNN-angle regressor for predicting the orientation and a two kNN-classificators for predicting different protein conformations and types.

We have explored increasingly complex protein diffraction imaging datasets: four imaging resolutions, two protein types: EF2 and ribosome, with 4 and 2 conformations respectively, and each conformations has the spatial orientation represented by the set of the three euler angles. 

We quantify the classification accuracy and performance of XPSI, observing that as we increase the resolution of the images we obtain an orientation prediction error below 10 degrees for the three angles, four-conformation (1n0u, 1n0vc, 9a, bc) accuracy prediction of 93%, and two-protein (EF2, ribosome) types accuracy of 100%.

## Results for 2020/2021

## Visits and meetings
None yet.

## Impact and publications

 * _[Talk]_ 11th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2020. Short Talk: XPSI: XFEL-based Protein Structure Identifier.
 * _[Poster]_ Paula Olaya, Michael R. Wyatt II, Silvina Caino-Lores, Florence Tama, Osamu Miyashita, Piotr Luszczek, and Michela Taufer, “XPSI: X-ray Free Electron Laser based Protein Structure Identifier,” ACM/IEEE International Conference for High Performance Computing, Networking, Storage and Analysis, Research Poster, Atlanta, GA, 2020.
 * _[Talk]_ 12th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: XPSI: XFEL-based Protein Structure Identifier.


## Future plans
We expect to deliver the next results: (a) annual JLESC internal reports; (b) apply current predictions for 3-D reconstruction and curation of data; (c) papers presenting both computer science and computational chemistry results;  (d) an open-source software tool including open access datasets for testing and replication; and (d) Jupyter interfaces to the software and datasets presenting the annotated workflow for predictions.

## References
[Github Repository](https://github.com/TauferLab/Project_Protein_Diffraction)
