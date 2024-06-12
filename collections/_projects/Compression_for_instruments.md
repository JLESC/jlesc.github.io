---
layout: post
title: Compression for instruments
date: 2020-02-25
updated: 2024-01-01
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
* Explore the compression needs at ANL and RCCS in terms of scientific instruments, simulations and data analytics, including ML/DL
* Design of new compression algorithms for identified applications
* Design and implementation of hardware accelerators for compression pipelines


## Results for 2019/2020

One of the promising approaches is predictive delta compression. Predictive delta compression is a technique to store only difference between original data and predicted data or the difference between consecutive predicted frames. Therefore, accurate prediction to the original data, which is data to compress, is important for increasing the compression ratio. Because the image data from sensors are time-evolutional images, we need a technique to accuracy predict future image frames. Predictive neural network is a predictive coding based deep convolutional neural network which learns to predict future frames of a video sequence. PredNet is such an architecture which is trained to predict the future movement of objects. We use PredNet to predict the future frames from the given time-evolutional frames. In the evaluation, we observe that we can compress SPring-8 data by a factor of 600 compared to original size using a combination of predictive delta compression and the SZ compressor developed at Argonne with a PSNR of 56dB.

In addition, Argonne collaborated with Clemson to develop a control loop allowing the automatic setting of lossy compressor error bound from user defined analysis metrics. The first implementation of the control loop targeted the fix ratio compression objective. The control loop was used to search for the compressor error bound providing the best accuracy for the targeted compression ratio. A paper has been accepted at IPDPS on this topic.

## Results for 2020/2021
The research on predictive delta compression continued at Riken and produced a paper accepted at IEEE CCGRID 2021. In parallel, the team at Argonne optimized the implementation of Huffman variable lenght coding on GPUs. This effort produced two publications at ACM PACT 2020 and IEEE IPDPS 2021.

## Results for 2021/2022
The main result is the validation from the EXAFEL team of RiobinSZ as a valid lossy compressor for crystallography. The validation experiment used RoibinSZ on Se-SAD SFX Dataset (Selenium Single-wavelength Anomalous Diffraction. Serial Femtosecond Crystallography), 5043 images (1480x1552x4bytes). Many metrics were used to perform the assesment: Number of hits: Number indexed, Rsplit, CC1/2, CCano, Rwork, Rfree, Map-model CC. Roibin SZ electron density successfully reconstructs the protein structure. The dataset compressed with RiobinSZ offered a better result overall compared to the non-compressed dataset. The current explanation is that RiobinSZ not only compress the data but also performs some denoising that results in improving the analysis quality. A paper is submited to IEEE Bigdata on using SZ3 for the Argonne Photon Source data. 

The second main results concerns the compression using SZ3 of X-ray ptychographic data acquired at the Advanced Photon Source (APS). A Dectris Eiger detector (514x1030 pixels) was used to acquire diffraction patterns as X-ray beam scanned across the sample, and the 2D diffraction images were saved along the time dimension to form a 3D matrix array (19500 x 514 x 1030 for chip pillar and 16800 x 514 x 1030 for flat chip). When the decompression data is near lossless (i.e.,
error bound less than 0:5), the compression ratio gain of the proposed compression pipeline is 18% on chip pillar and 12% on flat chip compared with the second-best one.

The third main result is the phychography of a Catalyst Particle Compressed with SZ2.1 (not RiobinSZ). The dataset is a single scan (diffraction patterns): 1856x1030x514. In practice we compressed 1856 images of 514x1030 pixels. For the spatial compression, the dataset is treated as a 3D dataset, so the SZ2.1 predictor adopts a 3D Lorenzo + 3D Linear regression; For the temporal compression, the compressor predicts each data point only based on the temporal dimension. We tested absolute error bound from 2 to 64.  Absolute error bound of 2 translates to (+/-) 2photon count error on the detector. The test consisted in a ptychographic reconstruction on (sz) decompressed diffraction patterns of a Catalyst Particle. The reconstruction used the Conjugate Gradient iterative method that took 300 steps. For spatial compression with an error bound of 4, the compression ratio reached 97 with a SSIM >0.96. For temporal compression with an error bound of 8, the compression ratio reaches: 245 for a SSIM >0.94. The SSIM results validates the use of SZ2.1 for phychrography at the APS.

The research at Argonne also optimized the compression method for crystallography data resulting in ROIBIN-SZ3. This optimized compression strategy resulted in improvements to compression ratios as well as compression and decompression bandwidth subject to the user's quality constraints with publication forthcoming.
Further improvements may be possible by lowering certain aspects of the ROIBIN-SZ3 process to the GPU pending further validation of correctness and effectiveness of the CPU implementation.

Riken released the compression code developed for SPRING-8: https://github.com/kento/TEZip

## Results for 2023/2024

Robert Underwood (Argonne), Kento Sato (Riken), and Amarjit Singh(Riken) supervised a summer student at Riken, Isita, to integrate LibPressio with TEZip.
This integration allows for more exhaustive comparisons between TEZip and other compressor such as SZ3 and ROIBIN-SZ.
There were several technical challenges to overcome for this integration:
1) LibPressio and the other compressors are implemented in C++, but TEZip is written in python, 
2) to make the comparisons possible and efficient, extensions were need to use shared memory to avoid the use of the file system for these large files, 
3) TEZip makes radically different assumptions about input formats that needed to be overcome.
These preliminary results show that TEZip may have an advantage at extremely high compression ratios, but at the cost of low bandwidth while compressors developed at Argonne have only high compression ratios but at much higher speed.
A poster on these efforts was presented by Isita to SC23.
Robert Underwood will visit Riken in April 2024 to help complete and submit these results for publication.

At Argonne, forward progress was also made on RoIBIN-SZ.
RoIBIN-SZ was successfully deployed and used at scale in the S3DM data reduction pipeline cluster at SLAC National Accelerator Center for their SFX workflow demonstrating the viability of this approach in production workflows.
Additionally, there were efforts to port portions of the RoIBIN-SZ pipeline to the GPU -- these efforts show a end-to-end improvement over the CPU with only a potion of the current pipeline on the GPU indicating that even with transfers to/from the GPU it is possible to accelerate this workflow on the GPU.  In the next year, we hope to complete porting of ROIBIN-SZ to the GPU and evaluate its improved performance which should remove the needs to transfer to/from the GPU dramatically improving performance.
An overview of RoIBIN-SZ was included as invited paper to Synchrotron Radiation News.


## Visits and meetings

2020:
* Franck Cappello visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week
* Bogdan Nicolae visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week
* Ali Murat Gok visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week
* Kazumoto Yoshii visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week

2021:
There was no visit due to the Covid situaiton.

2022:
There was no visit due to the COVID situation.

2023: 
There was no visit in 2023.

2024:

* Robert Underwood will visit Riken in April advance of the JLESC workshop for 1 week.

## Impact and publications

The first presentation of this collaboration was made during the DOE-MEXT meeting at Chicago in May 2019.
Franck Cappello presentation of lossy compression for photon source at the International Forum on Detectors for Photon Science March-April 2020 [cancelled because of COVID-19].


### Papers

* A paper at Synchrotron Radiation News providing an overview RoIBIN-SZ {% cite UnderwoodEtAl2023 --file jlesc.bib %}
* A poster at SC23 discussing preliminary evaluation of TEZip against other leading lossy compressors {% cite TalukdarEtAl2023 --file jlesc.bib %}
* A paper at IPDPS on fix ratio compression using control loop {% cite Underwood20 --file jlesc.bib %}
* A poster presented the results of the delta compression developed at Riken combined with the SZ compressor developed at Argonne. {% cite Rupak20 --file jlesc.bib %}
* A paper at ACM PACT 2020 {% cite Tian20 --file jlesc.bib %}
* A paper at IEEE CCGRID 2021 {% cite Rupak21 --file jlesc.bib %}
* A paper at IEEE IPDPS 2021 {% cite Tian21 --file jlesc.bib %}
* A paper at SC/DRBSD 2021 workshop {% cite libpressio --file jlesc.bib %}

{% bibliography --cited --file jlesc.bib %}

### Funding

Robert Underwood from Clemson (Jon Calhoun's group) received a DOE funding for his 6 months stay at Argonne.

### Impact on other projects

The compression scheme (ROI-SZ) developed by Argonne is in extensive testing at LCLS for integration in the data reduction pipeline of the LCLS2. It will be also tested in Germany.
This project has a direct impact on the APS (Argonne Photon Source) and Spring-8 instruments.
This project has a broad impact on other photo sources. Results from this project are impacting the collaborations with the LCLS (Linac Coherent Light Source) instruments.

The implementation of Huffman variable length coding in SZ (part of ROI-S) is the first high performance implementation of Huffman coding on GPU. We will make it stand alone and available for the community, independently of SZ.

## Future plans

Exchange results of experiments and testing of the compression schemes.

## References
{% bibliography --file external/Lossy_checkpoint_restart.bib %}
