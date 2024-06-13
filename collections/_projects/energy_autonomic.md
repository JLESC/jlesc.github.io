---
layout: post
title: Improving the Performance and Energy Efficiency of HPC Applications Using Autonomic Computing Techniques
date: 2018-04-17
updated: 2024-01-26
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - architectures
keywords:
  - autonomic computing
  - energy efficiency
  - control theory
head: rutten_e
members:
  - perarnau_s
  - bleuse_r
  - cerf_s

---

## Research topic and goals

Behavior of HPC systems, such as performance, power consumption, thermal
distribution, are increasingly hard to predict due to process variations and
dynamic processors, which conflicts with conventional bulk synchronous
parallelism software models such as MPI. Additionally, computing facilities are
now interested in limiting computing resources by power/energy budget rather
than CPU time. Such idea is also negatively affected by unpredictable behavior
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

## Results for 2019/2020

On the basis of the preliminary work done at ANL on instrumentation of HPC
applications, INRIA has begun work on a range of controllers for the runtime
adaptation of the Power Cap level in RAPL. A first approach is considered,
re-using results on other work concerning a different problem (regulating the
degree of parallelism according to synchronization cost), but which could be
transferred here. Another approach involves measuring progress and power and
making decisions based on predictions.

Argonne completed the design and implementation of an infrastructure to perform
control experiments using Jupyter notebooks. This infrastructure can be
deployed on a wide range of servers, and allows collaborators to independently
implement their own control algorithm using a simple interface and a high level
language. The notebook then connect remotely to the existing Argo NRM
infrastructure, that keeps track of actuators, sensors and application
management.

## Results for 2020/2021

{% person cerf_s %} started working as an INRIA-funded postdoc on this project
in October 2020. Using the Jupyter notebook infrastructure and Grid'5000, we
are in the process on designing and validating control-theory based approaches
to the problem of power/performance efficiency, with RAPL as the main actuator.
We have identified our main objective for HPC systems: as applications
dynamically undergo variations in workload, due to phases or data/compute
movement between devices, one can dynamically adjust power across compute
elements to save energy with limited and controllable impact on application
performance. We are also focusing on leveraging preliminary work from Argonne
on periodical monitoring of application progress.

We are in the process of publishing our first study, using a preliminary
offline identification process to derive a model of the dynamics of the system
and a proportional-integral (PI) controller, on top of the Argo NRM
infrastructure.

## Results for 2021/2022

We published our first study, using a preliminary offline identification
process to derive a proportional-integral (PI) controller on top of the Argo
NRM infrastructure, at Euro-Par 2021 {% cite cerf2021europar %}. This study
includes a controller applied to several Grid5000 clusters, and controlling a
singe memory-bound application, using Intel RAPL for power control.

A second publication is in the works, more on the control theory aspects of the
work. Following this, we will work on expanding our control design process to
allow for various types of applications and applications with phases in
particular. The goal is to improve the NRM infrastructure and the controller
design to detect phases in application performance and adapt the control to
them.

{% person reis_v %} left Argonne for Groq in March 2021. {% person daoudi_i %}
started working as an ANL-funded postdoc on this project in October 2021. {% person cerf_s %}
became an INRIA research scientist in Lille in October 2021.

## Results for 2022/2023

We published our second publication, involving results from the MSc internship
of Ismail Hawila {% cite hawila2022ccta %}. Observing limitations of our
previous work regarding both modeling (nonlinear models with numerous
parameters) and control performance (mainly instability caused by platform
variations), we developed a novel adaptive control that is robust to the variety
of execution platforms while maintaining the existing global goals of energy
management. It improves the reusability and portability of our controller. We
evaluated, on a real system using the Grid'5000 testbed, the robustness of the
control to changes in initial parameters and to disturbances, and we compared it
with the previous proportional-integral (PI) control. Our adaptive control
approach allows for up to 25% energy savings.

We continue to improve the NRM infrastructure for robustness, and the
evaluation of our control schemes towards supporting more applications and more
hardware control knobs.

## Results for 2023/2024

A MSc internship at Inria Lille, co-advised by {% person cerf_s %} and {%
person bleuse_r %} at Inria Grenoble, was performed by Kouds Halitim, on
"Enhancing Efficiency through Control theory in Compute-Intensive
Applications". It extended on previous work by adding a compute-intensive
benchmark (NAS EP) to possible workloads. Modeling was carried-out on extensive
experimentations on various Grid’5000 clusters, following the identification
techniques from Control Theory. The approach additionally explored novel
control strategies, in the form of cascaded control such as PI control and MPC
to enable better robustness e.g., w.r.t. noisy signals from sensors. INRIA
hired an engineer, Jonathan Bleuzen, as a support for experimentations around
NRM, and automation of identification and validation of controller on
Grid'5000.  The NRM infrastructure continues to improve, a new software release
with better stability and event management, as well as additional actuators is
scheduled for early 2024.

We are working on a journal paper to be submitted, on the methodological and
instrumentation aspects of implementing managers, based on Control Theory or
Reinforcement Learning, in HPC systems, based on our experiences, and
documenting the concrete problems of implementing sensors and actuators, as
well as integrating the controllers.

## Visits and meetings

We schedule regular video meetings between the different members of the
project.

{% person rutten_e %} visited ANL for two days to make progress on the project
on April 18-19 2019.

{% person perarnau_s %} visited INRIA in December 2023.


## Impact and publications

{% bibliography --cited --file jlesc.bib %}

## Future plans

We now have a reasonable collection of controller designs to experiment on, and
are focusing on improving our designs towards a wider range of benchmarks. Our
experience is that adding applications to monitor or control tends to highlight
shortcomings in the controller designs or the signals used to characterize
performance.  Given the expected architectures on future systems, we are also
planning to evaluate different actuators than RAPL (i.e. accelerator power
capping). We also plan to consider more elaborate control techniques, to obtain
controllers that are more robust to generic applications, including phases,
tracing OpenMP or MPI, or using performance counters in monitoring.

## References

{% bibliography --file external/energy_autonomic.bib %}
