---
layout: post
title: Towards Storage-Based Convergence Between HPC and Big Data
date: 2018-01-15
updated: 2019-01-01
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - storage
keywords:
head: antoniu_g
members:
  - ross_r
  - carns_p
  - matri_p
  - costan_a
---

## Research topic and goals

The ever-increasing computing power available on HPC platforms raises major challenges for the underlying storage systems, both in terms of I/O performance requirements and scalability. Metadata management has been identified as a key factor limiting the performance of POSIX file systems. Due to their lower metadata overhead, Blobs (Binary Large Objects) have been proposed as an alternative to traditional POSIX file systems for answering the storage needs of data-intensive HPC applications. Yet, the interest for blobs spans far beyond HPC, as they are also used as a low-level primitive for providing higher-level storage abstractions such as key-value stores or relational databases in cloud environments.

We explore the following question: could Blobs be an enabling factor for storage convergence between both worlds? The objective is to leverage standard benchmarks for Big Data as well as real-world HPC applications to answer the question. Through extensive experiments, we seek to prove that blobs are a solid base for HPC and Big Data storage convergence, by demonstrating that the same storage systems (namely RADOS and Týr) applied in both contexts can yield significant performance advantages over the state of the art on both sides. This work is done in collaboration with ANL, UPM (Spain) and DKRZ (Germany).

Leveraging on the previous goal, we intend to further demonstrate the applicability of Blobs on HPC context, which is less studied in the literature. For that matter, we focus on one use-case, distributed logging. We prove that this can bring highly-efficient support for applications such as computational steering, while offering unprecedented scalability on large-scale platforms. We leverage the local storage on the Theta supercomputer to deploy the storage system directly on the compute nodes.

Finally, we seek to prove that such convergence does not impact support for legacy applications that make use of POSIX semantics. This is critical for a range of large HPC applications which can not be easily modified to make use of new storage paradigms such as blobs. We demonstrate that it is possible to mount a thin POSIX-compliant file system interface atop Týr to offer such support for legacy applications. Additionally, we prove that such file system layer does not significantly impact performance compared to traditional parallel file systems.

## Results for 2017/2018

The first sub-goal lead to an extensive research leveraging a set of 5 benchmarks for Spark Bench as well as 4 real-world data-intensive HPC applications. The results show that all 4 applications are able to work unmodified atop object storage. More importantly, they show that the same storage systems (Týr or RADOS) can be used for both HPC and Big Data contexts, and on both show significant performance advantages. This clearly confirms the applicability and relevance of blob-based storage in a storage convergence context. These results have been published as a preliminary publication in the Cluster 2017 conference {% cite MatriEtAl2017 --file jlesc.bib %}.

The second sub-goal was achieved through a 3-month visit of Pierre Matri (Inria) at ANL, under the direct supervision of Philip Carns and Rob Ross. Through extensive experiments on the Theta supercomputer, we did demonstrate the performance benefits of using blobs for distributed logging on HPC. We also showed that the near-limitless scaling of blob storage systems brings significant performance benefits at large scale when compared to traditional, file-based storage.

The third sub-goal was achieved by developing a file system prototype named TýrFS, working as a thin layer between Týr and the application. This demonstration demonstrated the performance benefits of such approach in a converging use-case, on both HPC and Big Data applicative contexts. In particular, relying on various optimisations for small files, TýrFS has been shown to outperform OrangeFS, Lustre, HDFS and Ceph by more than one order of magnitude with such workload. These results have been accepted for publication in the CCGrid 2018 conference {% cite MatriEtAl2018 --file jlesc.bib %}.

## Results for 2018/2019

The availability of blobs as a generic purpose storage system opens opportunities for various storage abstractions. One of these opportunities relates to data streaming. In particular for such applications, the append operation available on mutable object storage systems enables recording streams of events at high velocity. This work builds on top of the results obtained last year on the during the visit of Pierre Matri at ANL.

It led to the development of a prototype layer above Týr named SLoG, that provides a unified interface on top of an object store providing high-velocity data ingestion with near-linear horizontal scalability through transparent partitioning. It can optionally falls back to using a distributed file system as storage backend. The measured throughput reached 250 million events per second using Týr using up to 120,000 cores of the Theta supercomputer at ANL. It was published at the ICDCS 2018 conference {% cite MatriEtAl2018Streaming --file jlesc.bib %}.

## Future plans

We intend to leverage the principles behind SLoG to demonstrate how streaming data services are able to help collecting and processing large volumes of telemetry information for real applications, for the purpose of monitoring, computational steering as well as in-siu visualization of running HPC and Big Data applications. In particular, this will require understanding how part of the processing of the streaming data can performed inside the data service to reduce application complexity and further reduce the time needed to analyze large amounts of events.

## Visits and meetings

- May to July 2017: Internship of Pierre Matri at Argonne National Laboratory (3 months).
- Work meetings between Pierre Matri, Philip Carns, Rob Ross, Alexandru Costan and Gabriel Antoniu at SC'18.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}

## Future plans

## References
