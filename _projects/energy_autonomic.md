---
layout: page_project
title: Improving the Performance and Energy Efficiency of HPC Applications Using Autonomic Computing Techniques
date: 2018-04-17
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - architectures
keywords:
  - autonomic computing
  - energy efficiency
head: rutten_e
members:
  - yoshii_k
  - perarnau_s

---

## Research topic and goals

Behaviour of HPC systems, such as performance, power consumption, thermal
distribution, are increasingly hard to predict due to process variations and
dynamic processors, which conflicts with conventional bulk synchronous
parallelism software models such as MPI. Additionally computing facilities are
now interested in limiting computing resources by power/energy budget rather
than CPU time. Such idea is also negatively affected by unpredictable behaviour
of modern HPC systems. Hardware-level power-limiting capability is becoming a
standard feature in modern processors. Intel running average power limit
(RAPL), for example, adjusts CPU core frequency (and CPU states if needed)
periodically in order to limit the CPU power consumption not to exceed
user-specified per-socket power budget. While RAPL, in fact, is an excellent
mechanism for independent workloads, there are multiple considerations for HPC
usage. The side effect of such power limiting is performance variation between
cores/sockets/nodes; no mechanism to communicate between sockets or nodes. The
effective range of user-specifiable power budget is limited; lower efficiency
with lower power budget. They tend to be a hardware feature; not tuneable.

We propose a software-level solution to provide additional control mechanisms
that increase hardware power-limiting feature and work for multiple nodes by
applying autonomic computing techniques and targeting HPC workloads.  We adopt
an approach involving Autonomic Computing and Control Theory. We will identify
significant sensors and actuators (e.g., switching on/off cores, changing CPU
frequency), build adaptive models of the process to be controlled, and define
robust adaptive control objectives w.r.t. appropriate metrics. We will design
and experimentally validate controllers regulating consumption while ensuring
performance. We will explore variants, beyond simple threshold-based control
e.g., predictive control to avoid overshooting or adaptive control for
robustness to the natural variability, considering costs of actions, avoiding
oscillations and over-reaction, handle multiple criteria, coordinate multiple
autonomic loops. Based on our previous experience in Cloud-oriented Autonomic
Computing, we will generalize and explore novel issues in adapting our
approaches to specificities of HPC and power management.

## Results for 2018/2019

We performed analysis of power capping mechanisms, RAPL in particular, and of
their interaction with application-level variations. We identified potential
retroaction loops in that context, and currently focus on a particular
representative autonomic loop : deciding at runtime, dynamically, on the
sufficient/minimal level of power capping  such that the application
performance remains maximum. The range of flexibility/elasticity typically
comes from some phases of an application involving more input/output, slowing
down computations, and therefore the same performance can be achieved while
slowing down the processor, through lower power cap.

Preliminary work completed at Argonne to instrument a collection of HPC
applications to report _progress_: an application-specific measure of online
performance. These progress reports will be used as a sensor in future work.

## Visits and meetings

We schedule regular video meetings between the different members of the
project. {% person perarnau_s %} visited Grenoble for a week to make progress
on the project in April 2018.

## Impact and publications

None yet.

{% bibliography --cited --file jlesc.bib %}

## Future plans

Short term plans are to finalize the design of controllers for this feedback
loop : we consider a range of controllers, from simple intuitive algorithms, to
model-based approaches involving control theoretical approaches.

We then plan to perform a series of experimental evaluations in order to
characterize and compare the different controllers w.r.t. the gain in power
consumption as well as properties of the controllers (convergence, stability).

## References

{% bibliography --file external/energy_autonomic.bib %}
