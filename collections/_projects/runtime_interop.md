---
layout: post
title: Enhancing Interoperability in Task-based Programming Models through Common Low-Level Interfaces
date: 2024-09-11
updated: 2025-01-30
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - prog_lang
keywords:
  - Interoperability
  - Runtime systems
  - StarPU
  - Charm++
  - PaRSEC
  - OmpSs-2
  - nOS-V
head: beltran_v
members:
  - alvarez_d
  - aumage_o
  - herault_t
  - kale_s
  - bhosale_a
  - maya_t
  - rao_r
  - schuchart_j
---

## Research topic and goals

Task-based programming models are a promising approach to exploiting complex
distributed and heterogeneous systems. Recently, these models have emerged as a
viable alternative to traditional message-passing and fork-join approaches,
reflecting the research community's growing interest in their numerous
benefits. Despite these advantages, the broader adoption within the scientific
and industrial sectors remains limited. A major barrier is the poor
interoperability among existing runtime systems, which prevents the development
of complex applications through the integration of multiple components or
libraries written in different task-based programming models. Such
interoperability issues often lead to oversubscription, significantly impairing
applications’ performance. Maintainability presents another significant challenge within task-based programming models, encountered by projects at varying stages. The relatively modest level of effort anticipated in a future steady-state raises critical questions about the sustainability of support for these models. Can the organization of software, potentially through the utilization of shared code bases for sub-components, facilitate easier maintenance? Such an approach could potentially streamline the support process, thereby enhancing the long-term viability and operational efficiency of task-based systems.

Our project aims to address these challenges by identifying the low-level
primitives necessary for building efficient and scalable task-based runtime
systems. Based on these findings, we will develop unified low-level tasking
interfaces to enhance interoperability among different runtime systems,
optimizing performance and encouraging broader adoption of task-based
programming models.


## Results for 2025/2026

We have continued the monthly video call to coordinate activities and ensure continuous progress.

Main highlights for this period:
* **StarPU and PaRSEC ported to nOS-V.** David Álvarez carried out a summer internship at Inria Bordeaux (hosted by Olivier Aumage and Thomas Hérault). During the internship, he completed the port of **StarPU** and **PaRSEC** to **nOS-V**, and evaluated their **interoperability with OpenMP** using **three applications**. This work was submitted as a full research paper to **IPDPS**, but it was not accepted.
* **Charm++ reconvers discussions.** We discussed the new implementation of Charm++ runtime convers, called **reconvers**, aimed at reducing code-base complexity, addressing technical debt, and enabling a simpler design that can better leverage new high-performance communication libraries, especially in highly multithreaded environments. Charm++ already works with reconvers but there are some performance issues with large applications. 
* **Community coordination.** We plan to organize another **BoF** at the next **JLESC workshop** to align on interoperability priorities and cross-runtime collaboration.

## Results for 2024/2025

Since the project's inception in September 2024, we have established a monthly video call to coordinate activities and ensure continuous progress.

Our work is currently organized around two main objectives:
* Survey and Documentation of Runtime System Components
We are actively discussing and documenting key components of various runtime systems, including schedulers, dependency management, and communication libraries. This effort aims to identify commonalities and opportunities for cross-runtime interoperability. We plan to consolidate our findings into a survey paper that will highlight similarities and differences among existing runtime systems and propose reusable components that could benefit multiple implementations.
* Porting StarPU and PaRSEC to nOS-V
We have initiated work on adapting StarPU and PaRSEC to run on top of nOS-V. A working prototype of StarPU/nOS-V has already been developed, marking a significant milestone. To further advance this effort, we have secured a summer internship for 2025 in collaboration with Inria and BSC. This internship will focus on improving the integration and evaluating the performance of StarPU and PaRSEC within the nOS-V environment

## Visits and meetings

* We had a BoF session in Kobe 2024 workshop, where we decided to start this project.
* We had a BoF session in Argonne 2025 workshop, where we discussed interoperability challengues.
* David Álvarez completed a summer internship at **Inria Bordeaux** (June–August 2025), hosted by **Olivier Aumage** and **Thomas Hérault**, focused on porting **StarPU** and **PaRSEC** to **nOS-V** and evaluating interoperability with **OpenMP**.
* We plan to organize another BoF at the next **JLESC workshop**.

## Publications

* David Álvarez, Olivier Aumage, Thomas Hérault, Vicenç Beltran. **Efficiently combining parallel libraries and programming models in HPC applications.** *(to be submitted in early 2026).*

## Impact 
* Port of StarPU to nOS-V completed in 2025 
* Port of PaRSEC to nOS-V completed in 2025
* Solve interoperability problems between task-based programming models
* Increase software development productivity and reach of task-based
  programming models
* Research and document needs from higher-level programming systems (Charm++,
  HPX, Legion, PaRSEC, OpenMP, OmpSs, ..) for the task-based execution systems
* Explore possibility of creating a standard that allows for different use
  cases currently served,  either via a flexible design or allowing for
extensions

## References

{% bibliography --file external/runtime_interop.bib %}
