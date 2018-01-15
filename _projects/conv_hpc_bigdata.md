---
layout: page_project
title: Towards Blob-Based Convergence Between HPC and Big Data
date: 2018-01-15
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - storage
keywords:
head: antoniu_g
members:
  - ross_r
  - antoniu_g
  - carns_p
  - matri_p
  - costan_a
---

## Research topic and goals

The ever-increasing computing power available on HPC platforms raises major challenges for the underlying storage systems, both in terms of I/O performance requirements and scalability. Metadata management has been identified as a key factor limiting the performance of POSIX file systems. Due to their lower metadata overhead, Blobs (Binary Large Objects) have been proposed as an alternative to traditional POSIX file systems for answering the storage needs of data-intensive HPC applications. Yet, the interest for blobs spans far beyond HPC, as they are also used as a low-level primitive for providing higher-level storage abstractions such as key-value stores or relational databases in cloud environments.

We explore the following question: could Blobs be an enabling factor for storage convergence between both worlds? The objective is to leverage standard benchmarks for Big Data as well as real-world HPC applications to answer the question. Through extensive experiments, we seek to prove that blobs are a solid base for HPC and Big Data storage convergence, by demonstrating that the same storage systems (namely RADOS and Týr) applied in both contexts can yield significant performance advantages over the state of the art on both sides. This work is done in collaboration with ANL, UPM (Spain) and DKRZ (Germany). 

Leveraging on the previous goal, we intend to further demonstrate the applicability of Blobs on HPC context, which is less studied in the literature. For that matter, we focus on one use-case, distributed logging. We prove that this can bring highly-efficient support for applications such as computational steering, while offering unprecedented scalability on large-scale platforms. We leverage the local storage on the Theta supercomputer to deploy the storage system directly on the compute nodes. 

## Results for 2017/2018

The first sub-goal lead to an extensive research leveraging a set of 5 benchmarks for Spark Bench as well as 4 real-world data-intensive HPC applications. The results show that all 4 applications are able to work unmodified atop object storage. More importantly, they show that the same storage systems (Týr or RADOS) can be used for both HPC and Big Data contexts, and on both show significant performance advantages. This clearly confirms the applicability and relevance of blob-based storage in a storage convergence context. These results have been published as a preliminary publication in the Cluster 2017 conference {% cite MatriEtAl2017 --file jlesc.bib %}.

The second sub-goal was achieved through a 3-month visit of Pierre Matri (Inria) at ANL, under the direct supervision of Philip Carns and Rob Ross. Through extensive experiments on the Theta supercomputer up to 120,000 cores, we did demonstrate the performance benefits of using blobs for distributed logging on HPC. We also showed that the near-limitless scaling of blob storage systems brings significant performance benefits at large scale when compared to traditional, file-based storage. The results of this work resulted in a second submission to IPDPS 2018.

## Visits and meetings

May to July 2017: Internship of Pierre Matri at Argonne National Laboratory (3 months).

## Impact and publications

{% bibliography --cited --file jlesc.bib %}

## Future plans

Plans for 2018: Such a convergence through blobs leads to two main questions that we intend to answer in the next year. First, how can we further optimize object storage for convergence? Indeed, the conclusions from this preliminary experiments prove that the performance advantage of blobs over the state of the art can be further improved by leveraging the technologies available on both platforms. This includes RDMA, that is increasingly available on Big Data platforms through RoCE for example, or leveraging advanced memory architectures such as NVRAM available on next-generation supercomputers. Second, how can this model be applied to converging data processing frameworks? While originating on clouds, there is a growing interest in the HPC community for artificial intelligence, through frameworks such as TensorFlow. This gives an unprecedented opportunity to take convergence one level higher, and shows how convergent frameworks can be integrated with convergent storage to offer users with a unified experience on HPC and Clouds for such use-cases.

## References
