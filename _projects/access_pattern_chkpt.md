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
  - roachell_b
  - cappello_f
  - taufer_m
---

## Research topic and goals
Checkpoint restart is a common resilience strategy used by many applications. Limited I/O bandwidth combined with frequent large checkpoints by multiple processes makes checkpointing difficult at scale. The heterogeneity and complexity of the storage hierarchy further increases the challenge of making efficient checkpoints. Naively writing checkpoints to the parallel filesystem incurs unacceptable overheads but is still frequently done by developers unaware of the storage hierarchy or unable to leverage the complex storage tiers efficiently. The challenges have led to checkpoint runtimes such as VeloC that take advantage of the various storage tiers to provide scalable asynchronous checkpoints. We combine VeloC with the Kokkos performance portability framework to enable a performance portable resilience runtime. 

This project will improve checkpoint restart scalability and performance by leveraging information about the memory access patterns of an application at runtime. Memory access patterns describe how the application updates its data over time. We use the information to reduce checkpoint sizes, increase checkpoint frequency, and ultimately alleviate pressure on the I/O system. One example is sparse update patterns where the application updates very little data between checkpoints. Checkpointing the entire piece of sparsely updated data is inefficient. A better strategy is to make an incremental checkpoint that only saves the sparse updates. Sparse update patterns occur frequently in graph applications such as graph alignment. The project explores different hash-based techniques for efficiently identifying differences between checkpoints. Objectives include analyzing the checkpoint size and runtime tradeoffs of the different techniques on both CPU and GPU platforms. Graph alignment is only one of the applications considered in this project; other applications and access patterns will be selected among those of interest to the JLESC community.

## Results for 2021/2022
We devised a framework for providing portable efficient checkpoint restart capabilities for Kokkos applications. The portability abstractions of Kokkos are combined with the scalable checkpoint restart runtime VeloC in order to allow Kokkos applications to add resilience capabilities with very little developer effort. We further enhance this by developing memory access pattern aware checkpointing. We can use the Kokkos Resilience intermediary layer to analyze applications and identify common memory access patterns. Using this knowledge the runtime can then guide VeloC to make more efficient checkpoints.

We identified a common memory access pattern and strategy for improving checkpoint restart. Sparse update patterns are common in graph algorithms. Using a graph alignment code developed at UTK as a use case, we used hash based incremental checkpointing techniques to drastically reduce checkpoint size.

We implemented two hash based incremental checkpointing algorithms that operate efficiently on both CPUs and GPUs. One algorithm uses a simple hash list and is used for comparison. Our second algorithm uses Merkle trees to reduce the cost of comparisons between the current and prior states of the data. Analysis shows that both algorithms dramatically reduce checkpoint size and cost relative to the cost of a full checkpoint. 

## Visits and meetings
 * Nigel Tan spent the summer of 2022 at ANL working on the project
 * The team meets weekly during the entire year

## Impact and publications
 * Talk: **Nigel Tan**, Elisabeth Giem, Matthew Whitlock, Bogdan Nicolae, Nicolas Morales, Keita Teranishi, Sanjukta Bhowmick, Franck Cappello, and Michela Taufer. 13th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: Towards Access Pattern Aware Checkpointing for Kokkos Applications
 * Poster: **Nigel Tan**, Bogdan Nicolae, Nicolas Morales, Keita Teranishi, Sanjukta Bhowmick, and Michela Taufer, “Towards Access Pattern Aware Checkpointing For Kokkos Applications,” ACM/IEEE International Conference for High Performance Computing, Networking, Storage and Analysis, Research Poster, St. Louis, MO, 2021.
 * Talk: **Nigel Tan**, Bogdan Nicolae, Nicolas Morales, Keita Teranishi, Sanjukta Bhowmick, Franck Cappello, and Michela Taufer, SIAM Parallel Processing 22 Conference, 2022. Towards Access Pattern Aware Checkpointing For Kokkos Applications

## Future plans
We will continue to improve our incremental checkpoint restart algorithm to better take advantage of available memory access pattern information. Runtime checkpoint performance analysis will be added in order to dynamically guide the checkpoint deduplication process. Other test applications and access patterns will be identified and used to improve checkpoint performance for a variety of applications relevant to the community.

## References

