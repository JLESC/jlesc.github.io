---
layout: page_project
title: Extreme-Scale Workflow Tools - Swift, Decaf, Damaris, FlowVR
date: 2016-03-21
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - storage
keywords:
head: peterka_t
members:
  - wozniak_j
  - dreher_m
  - ross_r
  - antoniu_g
  - dorier_m
  - raffin_b
---

## Research topic and goals

The goal of the Swift/Decaf/Damaris/FlowVR collaboration is to enhance the programmability of advanced applications composed of simulation and analysis modules. The Decaf project (Peterka), primarily funded by the U.S. Dept. of Energy, is developing a transport layer, high-level data flow primitives (selection, aggregation, pipelining, and buffering), and a high-level data description layer.  Swift (Wozniak), funded through Argonne LDRD, offers a rich, implicitly parallel programming language and scalable, load-balanced runtime.  Damaris (Antoniu) provides asynchronous resources (dedicated cores/nodes) that can be used for I/O, analysis, and visualization. FlowVR (Raffin) is a generic framework for building complex dataflows by plugging components into a Python interface. We intend to compare and contrast these tools and combine some of them to investigate computer science challenges in creating a highly useful, efficient analysis system.

## Results for 2015/2016

 * M. Dorier led the authorship of the ISAV 2015 workshop paper on lessons learned developing all four tools {% cite DorierEtAl2015 --file jlesc.bib %}.
 * M. Dreher and J. Wozniak developed an initial integration plan for Swift and Decaf.
 * M. Dreher presented an initial suite of workflows at the December 2015 meeting.
 * T. Peterka co-organized SC15 BOF on scientific workflows.
* M. Dreher and B. Raffin integrated the Decaf redistribution component with FlowVR and we published a Cluster 2016 paper on this research {% cite DreherEtAl2016 --file jlesc.bib %}.

## Results for 2016/2017

### Damaris

 * Matthieu Dorier (ANL), Gabriel Antoniu (INRIA), Franck Cappello (ANL), Marc Snir (UIUC), Roberto Sisneros (UIUC), Orcun Yildiz (INRIA), Shadi Ibrahim (INRIA), Tom Peterka (INRIA) and Leigh Orf (University of Wisconsin, Madison)

A paper synthesizing the results obtained with Damaris for I/O and in situ visualization was published in the ACM TOPC journal {% cite DorierEtAl2016TOPC --file jlesc.bib %}.

 * Matthieu Dorier of ANL, Laurent Debreu of INRIA

We enabled in situ visualization in the CROCO ocean simulation using Damaris and VisIt. This work was presented by Matthieu Dorier at the VisIt tutorial of Supercomputing 2016 (Salt Lake City) and at a pannel at LDAV 2016 (Baltimore), and by Hadi Salimi at the INRIA booth of SC2016.

### The Bredala library for data model and data redistribution between parallel applications

 * Matthieu Dreher and Tom Peterka (ANL), Bruno Raffin (INRIA)

The Bredala library is one of the base layer of Decaf. The work is done in collaboration with Bruno Raffin (INRIA) to evaluate the interest of integrating Bredala with FlowVR. A paper on Bredala was published at Cluster 2016 {% cite DreherEtAl2016 --file jlesc.bib %}.

### Decaf, FlowVR, Damaris, HPC/big data convergence

 * Bruno Raffin and Gabriel Antoniu of INRIA, Tom Peterka of ANL

This is an exploratory action to evaluate the potential of Big Data approaches for the analysis of large simulation data (actual performance of existing tools, expressiveness of their programming model, integration issues with the HPC stack, etc.). Bruno Raffin gave a talk at Argonne in November 2016 to give an overview of modern Map/Reduce framework and report on the development of the Velassco query based visualization framework based on Hadoop. Gabriel Antoniu participated in the BDEC meetings focused on this topic. Gabriel and Bruno have initiated a prospective reflexion on this subject at INRIA level. 

### PyCompss, Decaf distributed/in situ workflow convergence

 * Rosa Badia and Jorge Ejarque of BSC, Matthieu Dreher and  Tom Peterka of ANL

We are investigating potential convergences between distributed workflows (or wide area workflows) and in situ workflows. PyCommps is a workflow  engine developed at BSC aiming at coordinating the execution of jobs in a wide area. Data exchanges between tasks are done through files. This approach is very convenient for wide areas but are not suitable for HPC resources. Decaf is a runtime to describe and execute in situ workflows. Decaf focuses on coordinating tasks running on the same cluster or data-center. In this context data are exchanged through memory or high performance networks. We are currently building prototypes combining both runtimes where a Decaf workflow is an individual task in a PyCommps workflow. The objective is to automate the full science pipeline to discovery by merging high performance in situ workflows (Decaf) with traditional post-processing methods into a single workflow (PyCommps).

### Decaf, Swift workflow integration

 * Tom Peterka, Matthieu Dreher and Justin Wozniak of ANL

In the first stage, the goal is for swift to be able to execute Decaf workflow as a task. The resources are allocated by Swift and given to the Decaf runtime. We built a first prototype for a simple workflow composed of two tasks exchanging data. The long term objective is for Swift and Decaf to be able to exchange the graph information so that a user could build the graph of the workflow in the Swift language. Another long term objective is for Swift to use Bredala, the data model library of Decaf, to exchange data in parallel between tasks.

### Flow control management for In Situ workflows

 * Bruno Raffin, INRIA and Matthieu Dreher of ANL

Current In Situ infrastructures adopt very often a fixed policy to manage mismatch data rates between parallel tasks exchanging data. If the consumer is too slow,  a policy might be to hold the producer, slowing down the whole pipeline to the slowest component, or to drop an entire frame. FlowVR communication channels are FIFO by default as well, meaning that overflows could happen as well.  However, FlowVR provides components called filters and synchronizer to create more complex sampling policies. We are building a communication library based on the same principles as the components of FlowVR with several improvements: 1) Possibility to buffer data in several memory layers, 2) Buffering done synchronously or asynchronously 3) communications done in parallel, 4) supercomputer compliant.

### Data contract for In Situ workflows

 * Clement Mommessin (ANL), supervised by Matthieu Dreher (ANL), Bruno Raffin (INRIA) and Tom Peterka (ANL)

Scientific workflows are an aggregation of several tasks exchanging messaging. Usually each task is developed independently as a single piece of software. When integrating these codes into a a workflow, the developer has to build interfaces to exchange data between each task. To get the best performance for a particular workflow, the user should only send necessary data. However, simulation and analysis codes are complex code hard to maintain. It is then desired that the user modify only once their respective code. This imposes that the developer should expose as much data as possible to cover the maximum of use cases. Yet this approach could create significant performance impact due to unnecessary data being send for a particular workflow. We are currently investigating the notion of contracts for tasks. A contract is a declaration by the user of all the data that a particular need to work and all the data that the task can emit. Given this information, we can perform several checks and optimizations. First we check that the user is not trying to connect incompatible tasks with a data model mismatch. Second we can check at runtime that each task is sending the correct data. Third we can filter the data at runtime to send only necessary data for each consumer. This work is currently being integrated in Decaf. 

## Results for 2017/2018

### PyCompss, Decaf distributed/in situ workflow convergence

 * Rosa Badia and Jorge Ejarque of BSC, Matthieu Dreher and Tom Peterka of ANL

We are investigating convergence between distributed workflows (or
wide area workflows) and in situ workflows. PyCOMPSs is a workflow  engine
developed at BSC aiming at coordinating the execution of jobs in a wide area.
Data exchanges between tasks are done through files. This approach is very
convenient for wide areas but are not suitable for HPC resources. Decaf is a
runtime to describe and execute in situ workflows. Decaf focuses on coordinating
tasks running on the same cluster or data-center. In this context data are
exchanged through memory or high performance networks. We have built a
prototype combining both runtimes where a Decaf workflow is an individual task
in a PyCOMPSs workflow. The objective is to automate the full science pipeline
to discovery by merging high performance in situ workflows (Decaf) with
traditional post-processing methods into a single workflow (PyCOMPSs).

In 2018, our goal is to investigate science use cases of such an integrated
distributed area / in situ workflow system. We have identified one synthetic
example derived from cosmology and one actual example derived from materials
science. In the first case, the in situ workflow consists of three
tasks -- synthetic particle generation, Voronoi tessellation, and density
estimation -- while the distributed area workflow is a Python plotting task to
visualize the results. In the second case, the in situ workflow consists of the
LAMMPS molecular dynamics code and in situ filtering of molecule clusters while
the distributed area workflow consists of a Python visualization engine.

### Flow control management for in situ workflows

 * Bruno Raffin, INRIA, Matthieu Dreher and Tom Peterka of ANL

Current in situ infrastructures often adopt a fixed policy to manage
mismatched data rates between parallel tasks exchanging data. If the consumer is
too slow,  a policy might be to block the producer, slowing down the whole
pipeline to the slowest component, or to drop an entire frame. We built a
communication library called Manala that offers: 1) Possibility to buffer data in several memory
layers, 2) Buffering done synchronously or asynchronously 3) communications done
in parallel, 4) is part of the Decaf project and is compatible with the Bredala
data model previously developed in this project. This work was published in IEEE
Cluster 2017 and was presented by Matthieu Dreher.

### Data contracts for in situ workflows

 * Clement Mommessin (ANL), supervised by Matthieu Dreher (ANL), Bruno Raffin (INRIA) and Tom Peterka (ANL)

Scientific workflows are an aggregation of several tasks exchanging data.
Usually each task is developed independently as a single piece of software. When
integrating these codes into a a workflow, the developer has to build interfaces
to exchange data between each task. To get the best performance for a particular
workflow, the user should only send necessary data. However, simulation and
analysis codes are complex code hard to maintain. In order to minimize code
changes, the developer often exposes as much data as possible to cover the
maximum number of use cases. Yet this approach could create significant
performance impact due to unnecessary data being send for a particular workflow.
We solved this problem with the notion of contracts for tasks. A contract is a
declaration by the user of all the data that a particular need to work and all
the data that the task can produce.  Given this information, we can perform
several checks and optimizations. First, we check that the user is not trying to
connect incompatible tasks with a data model mismatch. Second, we can check at
runtime that each task is sending the correct data. Third, we can filter the
data at runtime to send only necessary data for each consumer. This work is part
of the Decaf project and is compatible with the Bredala data model and Manala
flow control library developed in this project. This work was published in IEEE
Cluster 2017 and was presented by Matthieu Dreher on behalf of Clement
Mommessin.

### Data contracts for storage systems

* Matthieu Dorier (ANL) and Matthieu Dreher (ANL)

The data contract idea described above was extended to storage systems. Data
management is a critical component of high-performance computing, with storage
as a cornerstone. Yet the traditional model of parallel  file systems fails to
meet users’ needs, in terms of both performance and features. In response, we
proposed CoSS, a new storage model based on contracts. Contracts encapsulate in
the same entity the data model (type, dimensions, units, etc.) and the intended
uses of the data. They enable the storage system to work with much more
knowledge about the input and output expected from an application and how it
should be exposed to the user.  This knowledge enables CoSS to optimize data
formatting and placement to best fit user’s requirements, storage space, and
performance. Matthieu Dorier presented a concept paper at the SC17 PDSW workshop
that introduces the idea of contract-based storage systems and presents some of
the opportunities it offers, in order to motivate further research in this
direction.

### Workflows and operating systems

Implementing an in situ workflow involves several challenges related to data
placement, task scheduling, efficient communication, scalability, and
reliability. Most current in situ workflow systems focus on high-performance
communications and low-overhead execution models at the cost of reliability and
flexibility.  One of the key design choices in such infrastructures is between
providing a single-program, integrated environment or a multiple-program,
connected environment, both solutions having their own strengths and weaknesses.
While these approaches might be appropriate for current production systems, the
expected characteristics of exascale machines will shift current priorities.
After surveying the tradeoffs and challenges of integrated and connected in situ
workflow solutions available today, we studied how exascale systems will impact
those designs. In particular, we identified missing features of current system
software required for the evolution of in situ workflows toward exascale and how
system software innovations can help address those challenges.  Matthieu Dreher
presented a concept paper at the SC17 ISAV workshop on these topics.


## Visits and meetings

 * Pierre-Louis Guhur of ENS 9 months at ANL in 2016
 * Clement Mommessin of INRIA 6 months at ANL in winter 2016/2017
 * Estelle Dirand of INRIA 3 days at ANL (28-29 July 2016)
 * Bruno Raffin of INRIA 3 days at ANL (7-9 November 2016)
 * Estelle Dirant participated in the ATPESC summer school at ANL in 2016
 * Orcun Yildiz hired as a postdoc in ANL, under the direction of Tom Peterka,
   beginning in February 2018


## Impact and publications

{% bibliography --cited --file jlesc.bib %}

 
## Future plans

See above.

## References

{% bibliography --file external/extreme_scale_workflows.bib %}
