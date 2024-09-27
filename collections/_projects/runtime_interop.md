---
layout: post
title: Enhancing Interoperability in Task-based Programming Models through Common Low-Level Interfaces
date: 2024-09-11
updated: 2024-09-11
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

## Visits and meetings

We had a BoF session in the Kobe workshop, where we decided to start this project.
There are no planned visits yet.

## Impact and publications

* Solve interoperability problems between task-based programming models
* Increase software development productivity and reach of task-based
  programming models
* Research and document needs from higher-level programming systems (Charm++,
  HPX, Legion, OpenMP, OmpSs, ..) for the task-based execution systems
* Explore possibility of creating a standard that allows for different use
  cases currently served,  either via a flexible design or allowing for
extensions

## Future plans

not defined yet.

## References

{% bibliography --file external/runtime_interop.bib %}