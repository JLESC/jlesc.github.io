---
layout: page_project
title: Sharing and extension of OmpSs2 runtime for XMP 2.0 PGAS task model
date: 2018-3-28
updated: 
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - prog_lang
keywords:
  - OmpSs
  - XcalableMP
  - PGAS
  - task
  - asynchronous parallelism
head: sato_m
members:
  - lee_j
  - labarta_j
  - beltran_v
  - perez_j
---

## Research topic and goals

Many-core architecture is widely used in clusters to achieve power-efficient high performance systems. As the number of computing cores in a system increases,　traditional data parallelism with threads cannot achieve high performance because of load-imbalance between cores and large synchronization overhead. Researchers are investigating task parallelism as a promising solution for both load balancing and synchronization overhead. Several programming models are being developed to integrate task programming models into node-level programming models to establish a hybrid programming model for many-core clusters.

RIKEN AICS and University of Tsukuba have been developing their PGAS language, XcalableMP, and working on a new feature that enables thread-level tasks on distributed memory systems. Task programming in XcalableMP is independent from other programming models such as OpenMP, and data transfer should be specified explicitly using the PGAS feature so that the user can expect the performance and optimize it easily.
OmpSs have been being developed by Barcelona Supercomputing Center (BSC). It extends the standard OpenMP task model to support advanced asynchronous parallelism and heterogeneous programming for accelerators such as GPUs. OmpSs provides interoperability with MPI for hybrid parallelism and its cluster version enables multi-tasking on clusters based on a shared memory space.

Although two programming models take different approaches, they can share underlying software layers such as communication runtime and thread generation and scheduling mechanics. We propose a collaboration between RIKEN AICS and BSC to share OmpSs2 runtime as a common infrastructure for multi-tasking on large-scale many-core clusters. Since RIKEN AICS have been mainly focused on its PGAS runtime and BSC has been developed thread programming infrastructure, we are interested in extending OmpSs2 runtime to support PGAS operations. Exchanging experiences and technology can boost the development on both sides, and enable open programming interface which can lead future collaboration.

## Results for 2015/2016

This activity has just started in March 2018. No results yet.

## Visits and meetings

To be planned.

## Impact and publications

None yet.

## Person-Month efforts in 2015/2016

To be planned.

## Future plans

The first steps will be using OmpSS runtime as a XMP runtime. 
We will investiage how to combine PGAS operations onto OmpSS runtime.

## References

{% bibliography --file external/ompss_xmp_project.bib %}


