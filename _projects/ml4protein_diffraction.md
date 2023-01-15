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
  - channing_g
  - patel_r
---

## Research topic and goals

A protein's structure determines its function. Different proteins have different structures; proteins in the same family share similar substructures and may share similar functions. Additionally, one protein may exhibit several structures (or conformations). Identifying different proteins and differentiating between their different conformations is a task that could help solve many complex problems, such as determining the cause of diseases and designing drugs. X-ray Free Electron Laser (XFEL) beams are used to create diffraction patterns (images) that can reveal protein structure (and function). The translation between diffraction patterns in the XFEL images and protein structures is non-trivial.
 
Three features are embedded in an image and can be captured by ML methods: the orientations of a protein conformation, the conformations of a folded protein, and the different conformations of different proteins. This collaboration between UTK and RIKEN aims to develop an ML-driven workflow integrating a suite of ML methods (from simple k-nearest neighbors and random forest to more complex neural networks) to capture orientations, conformations, and types of proteins from XFEL images. Our ML-driven workflow will build on top of open-source software and open-access datasets. The workflow will be packaged into a tool that will allow us to study and understand the impact of different ML methods and numerical precisions on prediction accuracy, power consumption, and performance for synthetic protein datasets (from simulations) and real XFEL images, as our tool is validated towards noisy, simulated datasets. The collaborators will use the tool at RIKEN for protein discovery.

## Results for 2020/2021

In Year 1, we presented XPSI (XFEL-based Protein Structure Identifier) that is a framework relying on ML methods (e.g., autoencoder and kNN) to capture critical information from X-Ray images. The information allows the identification of properties, such as spatial orientation, protein conformation, and different protein types from the diffraction patterns.

Our framework processes diffraction images (or patterns) through an autoencoder that captures critical information and produces a tensor representation of each image. The autoencoder consists of an encoder and a decoder. The encoder has three convolutional filters and downsampling layers, and the decoder has the reverse structure of the encoder. The framework uses the new latent space to train and validate traditional ML models such as k-nearest neighbors (kNN). We use a kNN-angle regressor to predict the orientation and two kNN-classifiers to predict different protein conformations and types.

We explored increasingly complex protein diffraction imaging datasets: four imaging resolutions and two protein types (i.e., EF2 and ribosome) with 4 and 2 conformations, respectively. Each conformation has the spatial orientation represented by the set of the three Euler angles. We quantified the classification accuracy and performance of XPSI. We observed that as we increased the resolution of the images, we obtained an overall orientation prediction error below 10 degrees for the three angles; a conformation accuracy prediction of 93% for the four EF2's conformations 1n0u, 1n0vc, 9a, and bc; and an accuracy of 100% when differentiating between the  EF2 and ribosome.


## Results 2021/2022

In Year 2, we added the prediction of the final property required to identify a protein structure which is the protein type. Moreover, we designed a solution to overcome symmetry challenges observed when predicting the third rotational angle (in Year 1). Our solution changes the range of the third angle from 0 to 360 degrees to 0 to 180 degrees without affecting the science behind it. Our framework can now accurately identify the predictions, including the three orientation angles, the different conformations, and the protein type. To validate the accuracy, we tested XPSI on a dataset of images from two different proteins (i.e., EF2 and ribosome) with two conformations each (i.e., 1n0u and 1n0vc for EF2 and 9a and bc for ribosome), and two imaging resolutions (high and low). For the high image resolution, we obtained an orientation prediction error of up to 10 degrees, a difference in the predicted third angle of up to 5 degrees, a conformation accuracy prediction of 92%, and a 100% of protein type accuracy prediction. We also released a Jupyter Notebook for the shareability and portability of our framework. 

In Year 3, we will test the framework with a more diverse dataset (i.e., three or more protein types with two or more conformations each). We will compare our framework with a traditional XFEL slice matching approach used for 3D reconstruction.


## Results 2022/2023

In Year 3, we demonstrated the capabilities of our XPSI (X-ray Free Electron Laser-based Protein Structure Identifier) framework by quantifying its accuracy when using challenging datasets and combinations of protein's structural properties. We observed these three key findings:
1. Our framework predicts orientation despite symmetry in the diffraction patterns for the EF2 protein with an error degree and Psi difference within 10 degrees for the 95th percentile of the testing dataset for high beam intensity.
2. The framework predicts confirmations with an accuracy of 97%, even when the structural shapes of the conformations are nearly indistinguishable.
3. Our framework correctly differentiates (with 100% accuracy ) between two protein types (EF2 and ribosome) in a broad and realistic set of diffraction patterns with multiple conformations and orientations. 

We delivered a Jupyter Notebook implementing the XPSI framework, which can be found at: https://github.com/TauferLab/XPSI. 

Neural networks (NNs) are gaining momentum in high-throughput scientific workflows; they inspired a new direction for this project. We expanded the framework to use a multi-objective Neural Architecture Search (NAS), NSGA-Net, to search for highly accurate NNs capable of predicting protein structural properties while optimizing resource efficiency (i.e., minimizing FLoating-point Operations Per Second or FLOPS). We define a domain-agnostic methodology to generate NNs with the support of NSGA-Net, select promising NNs that balance accuracy and FLOPS usage, and refine a subset of NNs to curate networks suitable for efficient data analysis. We apply this methodology to our protein diffraction use case. Preliminary results show NNs that efficiently classify the conformation of proteins with a final accuracy of 97.7% or higher and using only 187 FLOPS. 

In Year 4, we will work on the following:
* We will complete the prediction of the entire property set (i.e., orientation, conformation, and protein type) using near-optimal NNs.
* We will make the advanced framework available through open-source software, with Jupyter notebook tutorials to increase access to our technology.
* We will compare our framework with a traditional XFEL slice matching approach used for 3D reconstruction and follow the premises of orientation prediction through multiple and time-consuming iterations.


## Visits and meetings
Taufer will meet Tama and Miyashita during her visit at RIKEN on Deb 6-9 for the DOE/MEXT and R-CCS meeting.

## Impact and publications

* P. Olaya, S. Caino-Lores, V. Lama, R. Patel, A. Rorabaugh, O. Miyashita,  F. Tama, and M. Taufer, "Identifying Structural Properties of Proteins from X-ray Free Electron Laser Diffraction Patterns”. In Proceedings of the 18th IEEE International Conference on e-Science (eScience), pages 1–10, Salt Lake City, Utah, USA, October 10-14, 2022. IEEE Computer Society. Best paper candidate. (Acceptance Rate: 37/59, 62.7%).
* R. Patel, A. Keller Rorabaugh, P. Olaya, S. Caino-Lores, G. Channing, C. Schuman, O. Miyashita, F. Tama, and M. Taufer, “A Methodology to Generate Efficient Neural Networks for Classification of Scientific Datasets”, In Proceedings of the 18th IEEE International Conference on e-Science (eScience), pages 1–2, Salt Lake City, Utah, USA, October 2022. IEEE Computer Society. (Short paper)
* Talk: 14th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2022. Project Talk: Machine Learning-driven Predictive Analysis of Protein Diffraction Data.
* Talk: 14th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2022. Short Talk: Methods, Workflows, and Data Commons for Reducing Training Costs in Neural Architecture Search on High-Performance Computing Platforms
* Talk: 13th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: XPSI: XFEL-based Protein Structure Identifier.
* Talk: 12th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: XPSI: XFEL-based Protein Structure Identifier.
* Poster: Paula Olaya, Michael R. Wyatt II, Silvina Caino-Lores, Florence Tama, Osamu Miyashita, Piotr Luszczek, and Michela Taufer, “XPSI: X-ray Free Electron Laser based Protein Structure Identifier,” ACM/IEEE International Conference for High Performance Computing, Networking, Storage and Analysis, Research Poster, Atlanta, GA, 2020.
* Talk: 11th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2020. Short Talk: XPSI: XFEL-based Protein Structure Identifier.


## Future plans

Looking ahead, we are working on understanding the qualities of successful neural architectures and visualizing them in an interactive software package. Currently, we are testing a NN-based solution with a suite of popular neural architecture search workflows and assessing their suitability for predicting protein structural properties. In Year 4, we will package the findings into our software framework and an associated Jupyter notebook to allow for the widespread use of our NNs in XFEL image analysis. Our package will integrate a multi-type output layer that predicts regression and classification results from a single run rather than two distinct runs. By the end of 2023, we will have the results of tests of our prediction engine with at least three different NASes on our XFEL image dataset. The results of all these tests will be available in a NN data commons. 

## References
[Github Repository](https://github.com/TauferLab/XPSI)
