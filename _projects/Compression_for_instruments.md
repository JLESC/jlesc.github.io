---
layout: page_project
title: Compression for instruments
date: 2020-02-25
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:  
  - storage
keywords:
head: cappello_f
members:
  - di_s
  - gok_a
  - sato_k
  - sano_k
  - ueno_t
  - calhoun_j
  - underwood_r
---

## Research topic and goals

Scientific instruments, simulation and data analytics applications are generating or using extremely large datasets that are difficult (if not impossible) to move, store and transform in full. Compression of scientific data, either lossless or lossy, is considered as one of the solutions to address this problem. Already several applications, including ECP applications, are relying on compression to reduce their data. The purpose of the collaboration is first to explore the compression needs at ANL and RCCS from instruments (in particular light sources like the APS and Spring-8), simulations and data analytics involving ML/DL. Second, the collaboration will design new compression algorithms or adapt existing ones responding to ANL and RCCS application needs. Third, the collaboration will explore advanced implementations in FPGA and GPU of the designed compression pipelines.
We propose to:
-Explore the compression needs at ANL and RCCS in terms of scientific instruments, simulations and data analytics, including ML/DL
-Design of new compression algorithms for identified applications
-Design and implementation of hardware accelerators for compression pipelines


## Results for 2019/2020

One of the promising approaches is predictive delta compression. Predictive delta compression is a technique to store only difference between original data and predicted data or the difference between consecutive predicted frames. Therefore, accurate prediction to the original data, which is data to compress, is important for increasing the compression ratio. Because the image data from sensors are time-evolutional images, we need a technique to accuracy predict future image frames. Predictive neural network is a predictive coding based deep convolutional neural network which learns to predict future frames of a video sequence. PredNet is such an architecture which is trained to predict the future movement of objects. We use PredNet to predict the future frames from the given time-evolutional frames. In the evaluation, we observe that we can compress SPring-8 data by a factor of 600 compared to original size using a combination of predictive delta compression and the SZ compressor developed at Argonne with a PSNR of 56dB.

In addition, Argonne collaborated with Clemson to develop a control loop allowing the automatic setting of lossy compressor error bound from user defined analysis metrics. The first implementation of the control loop targeted the fix ratio compression objective. The control loop was used to search for the compressor error bound providing  the best accuracy for the the targeted compression ratio. A paper has been accepted at IPDPS on this topic.

## Results for 2020/2021
The research on predictive delta compression continued at Riken and produced a paper accepted at IEEE CCGRID 2021. In parallel, the team at Argonne optimized the implementation of Huffman variable lenght coding on GPUs. This effort produced two publications at ACM PACT 2020 and IEEE IPDPS 2021. 



## Visits and meetings

2020:
Franck Cappello visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week
Bogdan Nicolae visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week
Ali Murat Gok visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week
Kazumoto Yoshii visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week

2021:
There was no visit due to the Covid situaiton.

## Impact and publications

The first presentation of this collaboration was made during the DOE-MEXT meeting at Chicago in May 2019.
Franck Cappello presentation of lossy compression for photon source at the International Forum on Detectors for Photon Science March-April 2020 [cancelled because of COVID-19].


### Papers

A paper at IPDPS on fix ratio compression using control loop {% cite Underwood20 --file jlesc.bib %}
A poster presented the results of the delta compression developed at Riken combined with the SZ compressor developed at Argonne. {% cite Rupak20 --file jlesc.bib %}
{% bibliography --cited --file jlesc.bib %}

A paper at ACM PACT 2020 {% cite Tian20 --file jlesc.bib %}
A paper at IEEE CCGRID 2021 {% cite Rupak21 --file jlesc.bib %}
A paper at ACM IPDPS 2021 {% cite Tian21 --file jlesc.bib %}


### Funding

Robert Underwood from Clemson (Jon Calhoun's group) received a DOE funding for his 6 months stay at Argonne.

### Impact on other projects

The compression scheme (ROI-SZ) developed by Argonne is in extensive testing at LCLS for integration in the datareduction pipeline of the LCLS2. It will be also tested in Germany.
This project has a direct impact on the APS (Argonne Photon Source) and Spring-8 instruments.
This project has a broad impact on other photo sources. Results from this project are impacting the collaborations with the LCLS (Linac Coherent Light Source) instruments.

The implementation of Huffman variable lenght coding in SZ (part of ROI-S) is the first high performance implementation of Huffman coding on GPU. We will make it stand alone and available for the community, independently of SZ.

## Future plans

Exchange results of experiments and testing of the compression schemes.

## References
{% bibliography --file external/Lossy_checkpoint_restart.bib %}
