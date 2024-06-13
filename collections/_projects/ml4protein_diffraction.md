---
layout: post
title: Machine Learning-driven Predictive Analysis of Protein Diffraction Data
date: 2020-01-31
updated: 2024-01-24
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

We explored increasingly complex protein diffraction imaging datasets: four imaging resolutions and two protein types (i.e., EF2 and ribosome) with 4 and 2 conformations, respectively. Each conformation has the spatial orientation represented by the set of the three Euler angles.

We quantified the classification accuracy and performance of XPSI. We observed that as we increased the resolution of the images, we obtained an overall orientation prediction error below 10 degrees for the three angles; a conformation accuracy prediction of 93% for the four EF2's conformations 1n0u, 1n0vc, 9a, and bc; and an accuracy of 100% when differentiating between the  EF2 and ribosome.

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

## Results for 2023/2024
In the 2023-2024 period, our group made significant strides in the field of computational biology by developing A4NN, a highly efficient, composable workflow designed to enhance Neural Architecture Search (NAS) for predicting various protein properties (i.e., orientation, conformation, and protein type) using protein diffraction patterns across different beam intensities (i.e., low, medium, and high). Our workflow's performance was rigorously evaluated against the standalone NAS approach, specifically NSGA-Net, to find models with high validation accuracy and low computational demand (FLOPS). The evaluation yielded impressive results:

At low beam intensity, A4NN achieved 99.8% accuracy under 650 FLOPS, compared to NSGA-Net's 98.1% accuracy with approximately 650 FLOPS.
Our workflow reached 100% accuracy for medium beam intensity using below 500 FLOPS, surpassing NSGA-Net's 99% accuracy with around 700 FLOPS.
Both A4NN and NSGA-Net recorded a 99.9% accuracy at high beam intensity, but A4NN required less than 450 FLOPS, matching NSGA-Net's computational cost.

These results underscore A4NN's superiority in optimizing accuracy and efficiency across varying experimental conditions. Moreover, our workflow demonstrated a remarkable capacity to cut down training time and resource usage by up to 37% and reduce the number of training epochs by up to 38%, all while achieving a prediction accuracy of 100% in classifying protein conformations.

Complementing these technical achievements, our team has provided reproducibility artifacts available on GitHub, including detailed metadata and outcomes from executing our workflow across various protein diffraction datasets and GPU configurations. This commitment to transparency and replicability underscores our approach's robustness and the potential for A4NN to be deployed across a broader spectrum of NAS applications and datasets, showcasing its adaptability and the extensive groundwork laid for future advancements in the classification of protein conformations.

## Visits and meetings
Taufer will meet Tama and Miyashita during her visit at RIKEN on Deb 6-9 for the DOE/MEXT and R-CCS meeting.
During the summer of 2023, Ria Patel (First-year graduate student in Taufer’s group) interned at RIKEN, Japan, working with the Riken project members at that institution: Florence Tama and Osamu Miyashita. 
Michela Taufer and Georgia Channing attended France's Joint Laboratory for Extreme Scale Computing (JLESC) meeting at INRIA Bordeaux from March 21 to 23, 2023.

## Impact and publications
* Georgia Channings dedicated two years to this project with the University of Tennessee, Knoxville (UTK) team. In spring 2023, she applied for graduate fellowships. Her applications were successful, earning her three prestigious ones: the NSF Graduate Fellowship, which offers four years of support for students at U.S. institutions; an Oxford Fellowship; and a Cambridge Fellowship, both in the UK. Ultimately, she accepted the Oxford Fellowship and is currently a graduate student there.
* The project's outcomes have been documented in a comprehensive paper accepted and published at the ICPP 2023 conference: {% cite ChanningEtAl2023 --file jlesc.bib %}. Michela Taufer and Georgia Channing participated in the ICPP conferences. At the event, Georgia took the stage to present the paper and also showcased a poster that detailed the same findings: 
* Additionally, Michela Taufer was a featured speaker at the 6th RCCS Symposium. You can find more information about the symposium here: https://www.r-ccs.riken.jp/R-CCS-Symposium/2024/. During her talk, "Analytics4NN: Accelerating Neural Architecture Search through Modeling and High-Performance Computing Techniques," she shared the insights gained from this project.
* A paper at IEEE e-Science 2022 {% cite OlayaEtAl2022 --file jlesc.bib %}
* A short paper at IEEE e-Science 2022 {% cite PatelEtAl2022 --file jlesc.bib %}
* Talk: 14th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2022. Project Talk: Machine Learning-driven Predictive Analysis of Protein Diffraction Data.
* Talk: 14th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2022. Short Talk: Methods, Workflows, and Data Commons for Reducing Training Costs in Neural Architecture Search on High-Performance Computing Platforms
* Talk: 13th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: XPSI: XFEL-based Protein Structure Identifier.
* Talk: 12th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: XPSI: XFEL-based Protein Structure Identifier.
* Poster: Paula Olaya, Michael R. Wyatt II, Silvina Caino-Lores, Florence Tama, Osamu Miyashita, Piotr Luszczek, and Michela Taufer, “XPSI: X-ray Free Electron Laser based Protein Structure Identifier,” ACM/IEEE International Conference for High Performance Computing, Networking, Storage and Analysis, Research Poster, Atlanta, GA, 2020.
* Talk: 11th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2020. Short Talk: XPSI: XFEL-based Protein Structure Identifier.
* [Github Repository](https://github.com/TauferLab/XPSI)
* Poster: Georgia Channing. Composable Workflow for Accelerating Neural Architecture Search Using In Situ Analytics for Protein Classification. Poster at the 52nd International Conference on Parallel Processing (ICPP '23). Salt Lake City, Utah, US. August 7-10, 2023.
* Talk: Michela Taufer. Analytics4NN: Accelerating Neural Architecture Search through Modeling and High-Performance Computing Techniques. Talk at the  6th R-CCS International Symposium. Jan. 29-30 2024, Kobe, Japan.
* Talk: Georgia Channing. Generating Efficient Neural Networks for Protein Diffraction Data. Talk at the 15th JLESC Workshop. March 21-23, 2023, INRIA, Bordeaux, France.

**Reproducibility badges:**
We delivered two ACM reproducibility artifacts (artifact available and artifact evaluated-functional) for our work in the ICPP paper that contain metadata and results from our workflow executions on several protein diffraction datasets for different GPU distributions – (https://github.com/TauferLab/Reproducibility_A4NN_ICPP23) 

{% bibliography --cited --file jlesc.bib %}


## Future plans
Moving forward, we focus on identifying the characteristics of effective neural network (NN) designs and making them accessible through an interactive software tool. We will evaluate an NN-based approach by applying it across various established neural architecture search (NAS) methods to determine its effectiveness in predicting protein structures. We will incorporate these insights into our software platform, alongside a Jupyter notebook, to facilitate the broader application of our neural networks in analyzing XFEL (X-ray Free Electron Laser) images. Our software will feature an advanced output layer capable of delivering regression and classification outcomes in a single execution instead of requiring separate processes. By the end of 2024, we plan to complete testing of A4NN using at least three different NAS workflows on XFEL image data. The findings from these evaluations will be shared within the community at large.

## References

{% bibliography --file external/ml4protein_diffraction.bib %}
