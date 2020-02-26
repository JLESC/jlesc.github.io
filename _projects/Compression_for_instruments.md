---
layout: page_project
title: Compression for instruments
date: 2020-02-25
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
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
---

## Research topic and goals

Scientific instruments, simulation and data analytics applications are generating or using extremely large datasets that are difficult (if not impossible) to move, store and transform in full. Compression of scientific data, either lossless or lossy, is considered as one of the solutions to address this problem. Already several applications, including ECP applications, are relying on compression to reduce their data. The purpose of the collaboration is first to explore the compression needs at ANL and RCCS from instruments (in particular light sources like the APS and Spring-8), simulations and data analytics involving ML/DL. Second, the collaboration will design new compression algorithms or adapt existing ones responding to ANL and RCCS application needs. Third, the collaboration will explore advanced implementations in FPGA and GPU of the designed compression pipelines.
We propose to:
-Explore the compression needs at ANL and RCCS in terms of scientific instruments, simulations and data analytics, including ML/DL
-Design of new compression algorithms for identified applications
-Design and implementation of hardware accelerators for compression pipelines


## Results for 2019/2020

The first results experimental of the new collaboration were presented during the workshop at Knoxville. Nick Schenkels then visited Argonne for 2 weeks. During the two weeks we decided to focus the work on Flexible GMRES. Franck Cappello visited Bordeaux in June 2019. There were several meetings about the collaboration. Nick Schenkels visited Argonne on February 2020 for 1 week. Discussions were about the draft of a paper on the theoretical results of this collaboration. The results of the collaboration will be presented at the JLESC workshop at Bonn in April 2020.

## Visits and meetings

Franck Cappello visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week
Bogdan Nicolae visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week
Ali Murat Gok visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week
Kazumoto Yoshii visited Riken-CCS and Riken Spring-8 facility in August 2019 for 1 week

## Impact and publications

The first presentation of this collaboration was made during the DOE-MEXT meeting at Chicago in May 2019.
Franck Cappello presented lossy compression for photon source at the International Forum on Detectors for Photon Science March-April 2020.

### Papers

A poster presented the results of the delta compression developed at Riken combined with the SZ compressor developed at Argonne. {% cite Rupak20 --file jlesc.bib %}
{% bibliography --cited --file jlesc.bib %}

### Funding

### Impact on other projects

This project has a direct impact on the APS (Argonne Photon Source) and Spring-8 instruments.
This project has a broad impact on other photo sources. Results from this project are impacting the collaborations with the LCLS (Linac Coherent Light Source) instruments.

## Future plans


## References
{% bibliography --file external/Lossy_checkpoint_restart.bib %}
