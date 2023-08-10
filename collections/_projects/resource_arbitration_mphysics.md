---
layout: post
title: Automatic Optimization of Multi-Physics Coupled Executions through Closed-Loop Resource Arbitration
date: 2020-02-26
updated: 2020-02-26
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - apps
keywords:
  - Multi-physics coupling
  - Multi-code execution
  - Closed-Loop Resource Arbitration
  - Runtime optimization
head: borrell_r
members:
  - perarnau_s
  - houzeaux_g
  - reis_v
---

## Research topic and goals

Many complex simulation problems are tackled by coupling independent
domain-specific physics solvers; e.g. fluid-structure simulations, or weather
simulations combining models at different scales. Enabling efficient multi-code
executions facilitates code reuse and is a natural way of increasing simulation
capabilities of a specific framework. However, being the efficient exploitation
of modern computing architectures already a challenging problem, combining
different codes on a coupled execution can become even more complex. One of the
problems is the distribution of resources among the various physics software
that compose the model. A non-perfect distribution would result in some idle
time, implying a waste of computational resources. For staggered coupling
schemes, where the physics software are not running concurrently, the computing
resources should be transferred from one physics software to the other. For
monolithic or implicit approaches, a balance needs to be found so that both
software instances spend the same time to reach the communication stage of the
coupling. There are different strategies to be applied to achieve these goals,
most of them relying on the malleability of the software being coupled.

In this project we aim to investigate strategies to increase the efficiency of
coupled executions on modern architectures. The investigation will be
demonstrated on coupled executions with the multi-physiscs framework Alya,
developed at the Computer Applications for Science and Engineering (CASE)
department of the Barcelona Supercomputing Center (BSC). For the resource
arbitration, we will be using Argonne’s Node Resource Manager, an
infrastructure to partition resources among application components using
control-theoretical methods. This infrastructure combine application monitoring
(PMPI, performance counters) with multi-armed-bandit strategies to
automatically learn the performance-resource sweet spot for a collection of
application components. As such, it relies on accurate monitoring capabilities
and the right set of actuators (resource arbitration mechanisms), that we will
explore in depth for this set of use cases.

## Future Plans

We are in the process of identifying proper signals (MPI communications) that
can be used to identify load imbalance and trigger load balancing.

We expect to have a working solution for subsets of the Alya workloads within
a year.


## Visits and meetings

The projects members met during previous JLESC meetings and at Supercomputing
2019.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## References

{% bibliography --file external/resource_arbitration_mphysics.bib %}
