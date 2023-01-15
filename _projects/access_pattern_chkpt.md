---
layout: page_project
title: Optimizing Checkpoint Restart Through Access Pattern Awareness
date: 2022-09-22
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - resilience
keywords:
  - checkpoint restart
head: nicolae_b
members: 
  - tan_n
  - luettgau_j
  - cappello_f
  - taufer_m
---

## Research topic and goals
Checkpoint restart is a common resilience strategy used by many applications. Naively writing checkpoints to the parallel filesystem incurs unacceptable overheads due to three challenges.
First, limited I/O bandwidth combined with frequent large checkpoints by multiple processes makes checkpointing difficult at scale. 
Second, the heterogeneity of the storage hierarchy increases the complexity of performing resilient checkpoints. 
Last, developers are often unaware of the storage hierarchy's high cost or need to learn how to efficiently leverage the complex storage tiers. 
VeloC addresses these resilience challenges: it takes advantage of the different storage tiers and provides scalable asynchronous checkpoints. This project combines VeloC with the Kokkos performance portability framework to enable performance-portable, resilient checkpointing at runtime. 

Specifically, this project will improve checkpoint restart scalability and performance by leveraging information about the memory access patterns in large-scale applications at runtime. Memory access patterns describe how an application updates its data over time. We use the information to reduce checkpoint sizes, increase checkpoint frequency, and ultimately alleviate pressure on the I/O system. Sparse update patterns, in which applications update very little data between checkpoints, can significantly benefit from VeloC. Sparse update patterns frequently occur in graph applications such as graph alignment. Checkpointing the entire piece of sparsely updated data is inefficient. A better strategy is to make an incremental checkpoint that only saves the sparse updates. The project studies different hash-based techniques for efficiently identifying differences between checkpoints. Objectives include analyzing the various methods' checkpoint size and runtime tradeoffs on both CPU and GPU platforms. Graph alignment is only one of the applications considered in this project; other applications and access patterns will be selected among those of interest to the JLESC community.

## Results for 2022/2023
During Year 2 of this project, we defined and tuned a novel metadata compaction method to reduce checkpoint size by shrinking the restart metadata. Our method efficiently identifies the set of metadata needed to restart the checkpoint. We introduced additional performance optimizations in the method that reduced the time spent gathering scattered data for checkpointing.

We used our method to checkpoint the graph alignment application ORANGES, demonstrating sparse update patterns. We compared different incremental checkpointing methods with our solution for a rich pool of input graphs with different sparse update patterns. We ran our tests on single nodes and distributed systems, quantifying the tradeoffs between checkpoint size and runtime performance. 

In Year 3 of this project, we will compare our method with existing compression methods, investigate alternative hash functions for lossy deduplication, and evaluate other applications that exhibit sparse patterns or different patterns that gradually change over time.

## Results for 2021/2022

In Year 1 of this project, we devised a framework for providing portable, efficient checkpoint restart capabilities for Kokkos applications. The portability abstractions of Kokkos are combined with the scalable checkpoint restart runtime VeloC to allow Kokkos applications to add resilience capabilities with minimal developer effort. We further enhance our solution by developing memory access pattern-aware checkpointing. We used the Kokkos Resilience intermediary layer to analyze applications and identify common memory access patterns. Ultimately, VeloC can use the new knowledge to make more efficient checkpoints.

In a preliminary characterization of graph algorithms, we identified a typical memory access pattern, such as the sparse update patterns. We used a graph alignment application developed at the University of North Texas in collaboration with the University of Tennessee Knoxville as a use case. We implemented hash-based incremental checkpointing techniques to reduce checkpoint size drastically in the application. Specifically, we implemented two hash-based incremental checkpointing algorithms that operate efficiently on both CPUs and GPUs. The first algorithm uses a simple hash list to compare two memory snapshots associated with two checkpoints. The second algorithm uses Merkle trees to reduce the cost of comparisons between the current and prior states of the data. Our preliminary results show that both algorithms dramatically reduce checkpoint size and cost compared with a full checkpoint. 

## Visits and meetings
 * Nigel Tan spent the summer of 2022 at ANL working on the project
 * The team meets weekly during the entire year

## Impact and publications
 * Talk: **Nigel Tan**, Elisabeth Giem, Matthew Whitlock, Bogdan Nicolae, Nicolas Morales, Keita Teranishi, Sanjukta Bhowmick, Franck Cappello, and Michela Taufer. 13th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: Towards Access Pattern Aware Checkpointing for Kokkos Applications
 * Poster: **Nigel Tan**, Bogdan Nicolae, Nicolas Morales, Keita Teranishi, Sanjukta Bhowmick, and Michela Taufer, “Towards Access Pattern Aware Checkpointing For Kokkos Applications,” ACM/IEEE International Conference for High Performance Computing, Networking, Storage and Analysis, Research Poster, St. Louis, MO, 2021.
 * Talk: **Nigel Tan**, Bogdan Nicolae, Nicolas Morales, Keita Teranishi, Sanjukta Bhowmick, Franck Cappello, and Michela Taufer, SIAM Parallel Processing 22 Conference, 2022. Towards Access Pattern Aware Checkpointing For Kokkos Applications

## Future plans
We will study how our checkpointing can dynamically guide the duplication process at runtime. We will improve our incremental checkpoint restart algorithm to take advantage of available memory access pattern information. We will test new applications and access patterns to improve checkpoint performance for various applications relevant to the JLESC community.

## References

