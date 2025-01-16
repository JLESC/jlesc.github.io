---
layout: post
title: Optimization of Fault-Tolerance Strategies for Workflow Applications
date: 2016-03-16
updated: 2025-01-16
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - resilience
keywords:
  - resilience
  - replication
  - detection
  - SDC
head: benoit_a
members:
  - bosilca_g
  - bouteiller_a
  - cappello_f
  - herault_t
  - perotin_l
  - robert_y
  - sun_h
  - vivien_f
---
{% comment %}
================================
=== HOW TO USE THIS TEMPLATE ===
================================

Copy this file to `_projects` and rename it to a very short version of your project's title, e.g.
the project "Scalability Enhancements to FMM for Molecular Dynamics Simulations" chooses
"fmm_project.md".

Also copy the file `_templates/project.bib` to `_bibliography/external` and name it exactly as this
one, but the file extension, e.g. "fmm_project.bib".

For citing references, use the Liquid citing syntax as explained in the wiki:
https://github.com/JLESC/jlesc.github.io/wiki/Markup-Language#cite-and-list-publications

!IMPORTANT!
Remember to adjust the file name of the BibTeX file at the very bottom of this file!!

Then fill in the YAML header variables above.

  title            (required)
                   the full title of the project

  date             (required)
                   the date this page was created in the format: YYYY-MM-DD; this will get displayed
                   at the very bottom of the generated website

  updated          (optional)
                   in case you or somebody else came back later and edited significant parts of the
                   page, put in the date (format: YYYY-MM-DD) of that change;
                   if present, this will get displayed at the very bottom of the generated website

  project_url      (optional)
                   optional URL to some external website of the project.

  status           (optional)
                   the current status of the project;
                   you have to use one of the keys defined in '_data/project_states.yml'

  topics           (optional)
                   a YAML list of topic keys (as defined in '_data/topics.yml') for this project;
                   each topic on a new line with a leading dash

  keywords         (optional)
                   a YAML list of keywords for this project;
                   each topic on a new line with a leading dash.

  head             (optional)
                   the dedicated project leader;
                   this is the identifier of a person as found in '_data/people.yml'

  members          (optional)
                   a YAML list of members of this project, i.e. the people doing the work;
                   each member must be listed as its identifier as found in '_data/people.yml'

Now, fill in the details for the current report below. Please do not change headings, headings level
or order.
Read the comments carefully!

{% endcomment %}

## Research topic and goals

In this project, we aim at finding efficient fault-tolerant scheduling schemes
for workflow applications that can be expressed as a directed acyclic graph (DAG)
of tasks.

Checkpointing-recovery is the traditional fault-tolerance technique when it comes
to resilience for large-scale platforms. Unfortunately, as platform scale increases,
checkpoints must become more frequent to accommodate with the increasing
Mean Time Between Failure (MTBF). As such, it is expected that checkpoint-recovery
will become a major bottleneck for applications running on post-petascale platforms.

We first focus on replication as a way of mitigating the checkpointing-recovery
overhead. A task can be checkpointed and/or replicated, so that if a single replica
fails, no recovery is needed. Our goal is to decide which task to checkpoint,
which task to replicate, and how much resource should be allocated to each task
for the execution of general workflow applications. For that, we first need to
derive a clear model for replication, as there are many ways to implement it,
even for a single task.


## Results for 2016/2017

The initial work for this project has been focused towards using replication as a detection and correction mechanism for Silent Data Corruptions (SDC). Although other detection techniques exist for HPC applications, based on algorithms (ABFT), invariant preservation or data analytics, replication remains the most transparent and least intrusive technique.

In this project, replication is combined with checkpointing to enable rollback and recovery when forward recovery is not possible, which occurs when too many replicas are corrupted. The goal is to find the right level of replication (duplication, triplication or more) needed to efficiently detect and correct silent errors at scale. We have provided a detailed analytical study for this framework.


## Results for 2017/2018

We have extended these results for platforms subject to both silent and fail-stop errors. Fail-stop errors are immediately detected, unlike silent errors, and replication may also help tolerating such errors.

We have considered two flavors of replication: process replication and group replication. Process replication applies to message-passing applications with communicating processes. Each process is replicated, and the platform is composed of process pairs, or triplets. Group replication applies to black-box applications, whose parallel execution is replicated several times. The platform is partitioned into two halves (or three thirds). In both scenarios, results are compared before each checkpoint, which is taken only when both results (duplication) or two out of three results (triplication) coincide. If not, one or more silent errors have been detected, and the application rolls back to the last checkpoint, as well as when fail-stop errors have struck.

We provide a detailed analytical study for all of these scenarios, with formulas to decide, for each scenario, the optimal parameters as a function of the error rate, checkpoint cost, and platform size. We also report a set of extensive simulation results that nicely corroborates the analytical model.

While the previous work had focused on applications for which we can decide at which frequency we can checkpoint, and our aim has been to find the optimal checkpointing period, we have also initiated the study for linear chains of parallel tasks. The aim is then to decide which tasks to checkpoint and/or replicate. In this case, we have
provided an optimal dynamic programming algorithm, and an extensive set of simulations to assess (i) in which scenarios checkpointing performs better than replication, or vice-versa; and (ii) in which scenarios the combination of both methods is useful, and to what extent.



## Results for 2018/2019

In high-performance computing environments, input/output (I/O) from various
sources often contend for scarce available bandwidth. Adding to the I/O
operations inherent to the failure-free execution of an application, I/O
from checkpoint/restart (CR) operations (used to ensure progress in the presence
of failures) place an additional burden as it increase I/O contention,
leading to degraded performance.  We have considered a cooperative scheduling policy that optimizes the
overall performance of concurrently executing CR-based applications which share
valuable I/O resources.  First, we provide a theoretical model and then derive a set
of necessary constraints needed to minimize the global waste on the
platform.
  Our results demonstrate that the optimal checkpoint interval, as defined by
Young/Daly, despite providing a sensible metric for a single application, is not
sufficient to optimally address resource contention at the platform scale.  We
therefore show that combining optimal checkpointing periods with I/O scheduling
strategies can provide a significant improvement on the overall application
performance, thereby maximizing platform throughput.
Overall, these results provide critical analysis and direct guidance on checkpointing
large-scale workloads in the presence of competing I/O while minimizing the impact
on application performance. This work has received the best paper award at APDCM 2018,
a workshop run in conjunction with IPDPS 2018.


Three JLESC partners, Inria, Riken and UTK,  have conducted a study to compare
the performance of different approaches to
  tolerate failures using checkpoint/restart when executed on
  large-scale failure-prone platforms. We study (i) rigid
  applications, which use a constant number of processors throughout
  execution; (ii) moldable applications, which can use a different
  number of processors after each restart following a fail-stop error;
  and (iii) rid applications, which are moldable applications
  restricted to use rectangular processor grids (such as many dense
  linear algebra kernels). For each application type, we compute the
  optimal number of failures to tolerate before relinquishing the
  current allocation and waiting until a new resource can be
  allocated, and we determine the optimal yield that can be
  achieved. We instantiate our performance model with a realistic
  applicative scenario and make it publicly available for further
  usage.

Also, the Inria partner has studied checkpointing strategies for workflows and has shown
how to design an efficient strategy that achieves an efficient trade-off between extreme approaches where either all application data is checkpointed, or no application data is checkpointed. Results demonstrate that our algorithm outperforms both the former approach, because of lower checkpointing overhead, and the latter approach, because of better resilience to failures {% cite HanEtAl2018 --file external/ft_workflow_project.bib %},
{% cite HanEtAl2018b --file external/ft_workflow_project.bib %}.



## Results for 2019/2020

We have revisited replication coupled with checkpointing for fail-stop errors. This work focuses on divisible-load applications rather than workflows. In this context, replication enables the application to survive many fail-stop errors, thereby allowing for longer checkpointing periods. Previously published works use replication with the NORESTART strategy, which works as follows: (i) compute the application Mean
  Time To Interruption (MTTI) as a function of the number of processor pairs and the individual processor Mean Time Between Failures (MTBF); (ii) use
 checkpointing period  P à la Young/Daly, replacing the MTBF by the MTTI;
  and (iii) never restart failed processors until the application crashes.
We introduce the RESTART strategy where failed processors are restarted after each checkpoint.
We compute
 the optimal checkpointing period Q for this strategy, which is much larger than P thereby
 decreasing I/O pressure.
We show through simulations that using Q and the RESTART strategy, instead of P  and the usual NORESTART strategy, significantly decreases the overhead
induced by replication, in terms of both total execution time and energy consumption.
This work has appeared in the proceedings of SC'2019.


## Results for 2020/2021

We have first focused on the resilient scheduling of parallel jobs on high performance computing (HPC) platforms to minimize the overall completion time, or makespan. We have revisited the problem by assuming that jobs are subject to transient or silent errors, and hence may need to be re-executed each time they fail to complete successfully. This work generalizes the classical framework where jobs are known offline and do not fail: in this classical framework, list scheduling that gives priority to longest jobs is known to be a 3-approximation when imposing to use shelves, and a 2-approximation without this restriction. We show that when jobs can fail, using shelves can be arbitrarily bad, but unrestricted list scheduling remains a 2-approximation. We have designed several heuristics, some list-based and some shelf-based, along with different priority rules and backfilling options. We have assessed and compared their performance through an extensive set of simulations, using both synthetic jobs and log traces from the Mira supercomputer. This work has appeared at APDCM'2020, and an extended version appeared in IJNC. 

We have then focused the resilient scheduling of moldable parallel jobs on high-performance 
computing (HPC) platforms. Moldable jobs allow for choosing a processor allocation before execution, 
and their execution time obeys various speedup models. The objective is to minimize 
the overall completion time of the jobs, or the makespan, when jobs can fail due to silent errors 
and hence may need to be re-executed after each failure until successful completion. 
Again, this work generalizes the classical scheduling framework for failure-free jobs. To cope with silent errors, 
we introduce two resilient scheduling algorithms, LPA-List and Batch-List, both of which use the List strategy 
to schedule the jobs. Without knowing a priori how many times each job will fail, LPA-List relies 
on a local strategy to allocate processors to the jobs, while Batch-List schedules the jobs in batches 
and allows only a restricted number of failures per job in each batch. We prove new approximation ratios 
for the two algorithms under several prominent speedup models (e.g., roofline, communication, 
Amdahl, power, monotonic, and a mixed model). An extensive set of simulations is conducted 
to evaluate different variants of the two algorithms, and the results show that they consistently 
outperform some baseline heuristics. Overall, our best algorithm is within a factor of 1.6 of 
a lower bound on average over the entire set of experiments, and within a factor of 4.2 in the worst case. Preliminary results with a subset of speedup models have been published in 
Cluster'2020. 

In parallel, we have also been working on the comparison of several fault-tolerance methods 
for the detection and correction of floating-point errors in matrix-matrix multiplication.  
These methods include replication,
triplication, Algorithm-Based Fault Tolerance (ABFT) and residual checking
(RC).  Error correction for ABFT can be achieved either by recovering the 
corrupted entries from the correct data and the checksums by
solving a small-size
linear system of equations, or by recomputing corrupted coefficients. We show
that both approaches can be used for RC. We provide a synthetic presentation of
all methods before discussing their pros and cons.  We have implemented all
these methods with calls to optimized BLAS routines, and we provide performance
data for a wide range of failure rates and matrix sizes. In addition, with
respect to the literature, we have considered relatively high error rates.

## Results for 2021/2022

At Inria, we have pursued the work on resilient scheduling of moldable parallel jobs on high-performance computing (HPC) platforms, and an extension of the results has been published in Transactions on Computers (TC) in August 2021 {% cite BenoitEtAl2021 --file jlesc.bib %}.

We have also proposed an optimal checkpointing strategy to protect iterative applications from fail-stop errors. 
We consider a general framework, where the application repeats the same execution pattern 
by executing consecutive iterations, and where each iteration is composed of several tasks.
These tasks have different execution lengths and different checkpoint costs.  
Assume that there are $n$ tasks, and that task $a_i$ has execution time $t_{i}$ and checkpoint cost $c_{i}$.
A naive strategy would
checkpoint after each task. Another naive strategy would checkpoint at the end of each iteration. A strategy inspired by the Young/Daly formula would work for $\sqrt{2 \mu C}$ seconds, where $\mu$ is the application MTBF
and C is the average checkpoint time, and checkpoint at the end of the current task (and repeat). Another strategy, also
inspired by the Young/Daly formula, would select the task $a_{min}$ with the smallest checkpoint 
cost $c_{min}$ and would checkpoint after every p-th instance of that task, leading to a checkpointing period $p T$,  where $T = \sum_{i=0}^{n-1} a_{i}$ is the time per iteration. One would choose the period so that $p T \approx \sqrt{2 \mu c_{\min}}$ to obey the Young/Daly formula. 
All these naive and Young/Daly strategies are suboptimal.
 Our main contribution is to show that the optimal checkpointing strategy is globally periodic, and to design a dynamic programming algorithm that computes the optimal checkpointing pattern. This pattern may well checkpoint many different tasks, and this across many different iterations. We show through simulations, both from synthetic and real-life application scenarios, that the optimal strategy outperforms the naive and Young/Daly strategies.
 These results have been published in IEEE Transactions on Parallel and Distributed Systems (TPDS) in 2022 {% cite DuEtAl2022 --file jlesc.bib %}.



At UTK, there has been some work on several fronts:

* Interruption Scope: Failure detection and subsequent error reporting is the starting point
of the entire recovery procedure.
In the ULFM fault tolerant MPI, the scope of error reporting has been
limited to processes that perform a direct communication operation with a failed
process. The main rationale is found in application use cases
(e.g., master/worker, stencil, job-stealing, etc.) that operate under the
assumption that communication between non-failed processes should proceed
without interruption (running through failures except when critical).
However, when considering complex applications comprised on multiple software modules,
certain modules may require more thorough information about errors.
Many recovery techniques are global in nature, and a fault
must trigger a recovery action in all modules of the application---including in processes that
may not be currently involved in communications  for the module.
Thus we added controls that can set MPI communicators in a mode that
will implicitly interrupt MPI communication on the communicator when any
process on the communicator group, or in the entire application, has failed.
The benefit of this scoped recovery is to significantly improve on the
complexity of the error management
code by streamlining multiple error paths, making implicit the propagation
of errors when appropriate, and enable cross-module, cross-library
response to faults.

* Uniform Errors: Collective communication in MPI are a powerful tool for expressing patterns
where a group of processes participate in the same communication
operation. By abstracting the intent of the communication pattern, the
operation can help the user structure the code flow, and let the MPI
implementation optimize.
A simplistic assumption postulates that such structuring features
would translate intact into a regime with failures.
A notable aspect is if errors should be raised _uniformly_, that is
the same error code is returned at all rank by the same collective operation.
While this is desirable for the structuring aspect this gives to fault-tolerant
codes, this also entails a significant overhead in most cases as
it adds a supplementary concensus,
an extra fault-tolerant synchronization step that is not required by the
semantic of the underlying communication. Thus, to protect
fault-free performance, users need to be able to control when such
consensus are performed. The MPI_COMM_AGREE operation has provided
an explicit means for users to synchronize in a fault-tolerant fashion
when the need arises.
We added a per-communicator property (practically,
by setting specific MPI Info keys on the communicator) that
lets the user decide whether collective operations on the communicator
should operate at maximum speed (non-uniform) or with implicit safety
(uniform error reporting at all ranks). This control enables a
distinction between pure communication operations (which are often critical for
performance) and setup/management operations (like operations that create
new communicators, or operations that change the logical epoch in the algorithm).

* Asynchronous Recovery: 
The MPI_COMM_SHRINK operation provides the operational
construct that permits recreating a fully functional communication
context in which not only select point-to-point communication but
also collective communication can be carried. The core of the operation
relies on agreeing on the set of failed processes that need to be excluded
from the input communicator and then producing a resultant communicator with
a well-specified membership of processes. The current definition of
the shrink operation is blocking and synchronous, which limits the
opportunity for overlapping its cost.
We introduce a new non-blocking variant of the shrink
operation, MPIX_COMM_ISHRINK(comm, newcomm, req). To support
this operation, we designed a non-blocking variant of the
consensus-like elimination of failed processes as well
as the selection of the internal context identifier (a unique number
that is used to match MPI messages to the correct communicator on which
the operation was posted). The expected advantages are multiple.
Some applications may have to recover multiple communicators after a failure;
with the availability of the non-blocking shrink, these multiple shrink operation have an
opportunity to overlap one another.
The non-blocking shrink also gives an opportunity for overlap between the
cost of rebuilding communicators with the cost of restoring the application
dataset (e.g., reloading checkpoints, computing checksum on data, etc.).

## Results for 2022/2023

First, we have been further investigating the Young/Daly formula. This formula provides an approximation of the optimal checkpoint period for a parallel application executing on a supercomputing platform. It was originally designed for preemptible tightly-coupled applications. We provided some background and survey various application scenarios to assess the usefulness and limitations of the formula in {% cite BenoitEtAl2022 --file jlesc.bib %}. 

Also, we have been revisiting distributed termination detection algorithms in the context of High-Performance Computing (HPC) applications. We introduced an efficient variant of the Credit Distribution Algorithm (CDA) and compared it to the original algorithm (HCDA) as well as to its two primary competitors: the Four Counters algorithm (4C) and the Efficient Delay-Optimal Distributed algorithm (EDOD). We analyzed the behavior of each algorithm for some simplified task-based kernels and showed the superiority of CDA in terms of the number of control messages. We then compared the implementation of these algorithms over a task-based runtime system, PaRSEC and showed the advantages and limitations of each approach on a practical implementation {% cite BosilcaEtAl2022 --file jlesc.bib %}. 

Some progress on the projects mentionned in 2021-2022 were also done by UT Knoxville, in particular on integrating process, control-flow, and data resiliency layers using a hybrid Fenix/Kokkos approach, demonstrating that designing integrable systems rather than integrated systems allows for user-designed optimization and upgrading of resilience techniques while maintaining the simplicity and performance of all-in-one resilience solutions. More application-specific choice in resilience strategies allows for better long-term flexibility, performance, and - importantly - simplicity.

Finally, we have initiated a study about the impact of I/O interference on application performance. HPC applications execute on dedicated nodes but share the I/O system. As a consequence, interferences surge when several applications perform I/O operations simultaneously, and each I/O operation takes much longer than expected because each application is only allotted a fraction of the I/O bandwidth. Checkpoint operations are periodic and high-volume I/O operations and, as such, are particularly sensitive to interferences.



## Results for 2023/2024

This year, as a follow-up to our joint work published last year in {% cite BenoitEtAl2022 --file jlesc.bib %}, we have extended this paper by adding contributions of other JLESC members
(Leonardo Bautista-Gomez from BSC, and Sheng Di from ANL). Hence, we have considerably extended the scope of our survey, and we have submitted this contribution, entitled "A Survey on Checkpointing Strategies: Should We Always Checkpoint à la Young/Daly?",  to the special issue of FGCS scheduled for 2024 and which will focus on JLESC collaboration results. We are covering several new topics such as multi-level checkpointing, checkpointing preemptible applications in practice, checkpoints taking variable times, silent error detectors, imperfect verifications, cases where the order of the optimal checkpointing period changes, and the combination of checkpointing with replication. 


We have also considered applications executing for a fixed duration, namely the length of the reservation that it has been granted. The checkpoint duration is a stochastic random variable that obeys some well-known probability distribution law. The question is when to take a checkpoint towards the end of the execution, so that the expectation of the work done is maximized. We addressed two scenarios. In the first scenario, a checkpoint can be taken at any time; despite its simplicity, this natural problem has not been considered yet (to the best of our knowledge). We provided the optimal solution for a variety of probability distribution laws modeling checkpoint duration. The second scenario was more involved: the application is a linear workflow consisting of a chain of tasks with IID stochastic execution times, and a checkpoint can be taken only at the end of a task. First, we introduced a static strategy where we computed the optimal number of tasks before the application checkpoints at the beginning of the execution. Then, we designed a dynamic strategy that decides whether to checkpoint or to continue executing at the end of each task. We instantiated this second scenario with several examples of probability distribution laws for task durations. This work has been published in FTXS’2023, a workshop co-located with SC’2023 
{% cite BarbutEtAl2023 --file jlesc.bib %}.


## Results for 2024/2025

This year, we have published a survey on the FGCS special issue focusing on JLESC collaboration results,
see {% cite BautistaEtAl2024 --file jlesc.bib %}. The Young/Daly formula provides an approximation of the optimal checkpointing period for a parallel application executing on a supercomputing platform. It was originally designed to handle fail-stop errors for preemptible tightly-coupled applications, but has been extended to other application and resilience frameworks. We provide some background and survey various scenarios to assess the usefulness and limitations of the formula, both for preemptible applications and workflow applications represented as a graph of tasks. We also discuss scenarios with uncertainties, and extend the study to silent errors. We exhibit cases where the optimal period is of a different order than that dictated by the Young/Daly formula, and finally we explain how checkpointing can be further combined with replication.

As a follow-up of our work published the previous year at FTXS'2023, a workshop co-located with SC’2023 {% cite BarbutEtAl2023 --file jlesc.bib %}, we have considered checkpointing strategies for a parallel application executing on a large-scale platform whose nodes are subject to failures. The application executes for a fixed duration, namely the length of the reservation that it has been granted. We have shown the difficulty of the problem with small examples: it turns out that the optimal checkpointing strategy neither always uses periodic checkpoints nor always takes its last checkpoint exactly at the end of the reservation. Then, we have introduced a dynamic heuristic that is periodic and decides for the checkpointing frequency based upon thresholds for the time left; we have determined threshold times Tn such that it is best to plan for exactly n checkpoints if the time left (or initially the length of the reservation) is between Tn and Tn+1. Next, we have used time discretization and designed a (complicated) dynamic programming algorithm that computes the optimal solution, without any restriction on the checkpointing strategy. Finally, we have reported the results of an extensive simulation campaign that shows that the optimal solution is far more efficient than the Young/Daly periodic approach for short or mid-size reservations. These results have been published at FTXS'2024, see {% cite BenoitEtAl2024 --file jlesc.bib %}. 


## Visits and meetings

{% person cavelan_a %} visited {% person cappello_f %} in Chicago for three months (March, April, and May 2016) to initiate the project. Furthermore, we have been meeting regularly in the previous years. In particular,
we have been attending the SC conference (November 2016
and November 2017), where we had extensive discussions to make progress.
We represented the JLESC at the Inria booth during these conferences.

When not meeting in person, we have stayed in close collaboration through regular Skype meetings,
which allowed us to make progress on the project.

{% person robert_y %} made several visits in 2018/2019 to Univ. Tenn. Knoxville, for a total of approximately two months, and a total of two months and a half for 2019/2020. 

{% person lefevre_v %} has visited Univ. Tenn. Knoxville for 10 days in February 2019,
and for 10 days in January 2020.

Due to the Covid-19 sanitary situation, we have not had any visits for two years (March 2020 - February 2022), but we had numerous virtual interactions. 

{% person robert_y %} made three visits to Univ. Tenn. Knoxville in 2022, for a total of approximately one month. 

{% person robert_y %} made four visits to Univ. Tenn. Knoxville in 2023, for a total of approximately one month and a half. 

{% person robert_y %} made one visit to Univ. Tenn. Knoxville in 2024 for 9 days. The partners have attended SC'24 in Atlanta, USA, and had project discussions during the conference. 


## Impact and publications

Two papers have been published in FTXS'17 {% cite benoitEtAl2017identifying --file jlesc.bib %}, {% cite benoitEtAl2017optimal --file jlesc.bib %}.

The work combining fail-stop and silent errors has been published in JPDC
{% cite BenoitEtAl2018 --file jlesc.bib %}.

A work on executing workflows on high-bandwidth memory architectures was published in ICPP'18 {% cite BenoitEtAl2018b --file jlesc.bib %}.

The work on optimal cooperative checkpointing for shared high-performance computing platforms was the best paper at APDCM'18 {% cite HeraultEtAl2018 --file jlesc.bib %}.

The work studying whether moldable applications perform better
on failure-prone HPC platforms was published in Resilience'18 {% cite LeFevreEtAl2018 --file jlesc.bib %}.

The work on replication with checkpointing was published at SC'19 {% cite BenoitEtAl2019 --file jlesc.bib %}.

The work on the comparison of several fault-tolerance methods for the detection and correction of floating-point errors in matrix-matrix multiplication was published at Resilience'20 {% cite LeFevreEtAl2020 --file jlesc.bib %}. 

The work on resilient scheduling of moldable parallel jobs on high-performance computing (HPC) platforms was published in IEEE TC in 2021 {% cite BenoitEtAl2021 --file jlesc.bib %}.

In 2022, two joint publications were published from the project, the first one to assess the usefulness and limitations of the Young/Daly formula for checkpointing, in the IC3 conference {% cite BenoitEtAl2022 --file jlesc.bib %}, and the other one to compare distributed termination detection algorithms for modern HPC platform, in the IJNC journal {% cite BosilcaEtAl2022 --file jlesc.bib %}. 

In 2023, we have published one joint publication {% cite BarbutEtAl2023 --file jlesc.bib %} on when to checkpoint at the end of a fixed-length reservation. 

In 2024, we have published  a survey on the FGCS special issue focusing on JLESC collaboration results 
{% cite BautistaEtAl2024 --file jlesc.bib %}, and a publication on checkpointing strategies for a fixed-length execution {% cite BenoitEtAl2024 --file jlesc.bib %}.


{% comment %}
=============================
== CITING OWN PUBLICATIONS ==
=============================

You can list your own publications below in case you did not cite them in the text
(which you should do, though).
Use the Liquid citing syntax as explained in the wiki:
https://github.com/JLESC/jlesc.github.io/wiki/Markup-Language#cite-and-list-publications
Remember to use the `--file jlesc.bib` with the `cite` tag.

=====================================
== START HERE WITH YOUR ADDITIONAL REFERENCES ==
{% endcomment %}



{% comment %}
== NO MORE BELOW THIS ==
========================
{% endcomment %}

{% bibliography --cited --file jlesc.bib %}

## Future plans

There remains a lot to explore for workflow applications, consisting of tasks.
We have so far focused only on duplication in this case, but
one may want to consider different replication levels (duplication, triplication or more) to different tasks, depending upon their criticality in terms of longest paths, number of successors, etc.
This may be even more important when considering a general directed acyclic graph of tasks,
rather than restricting to linear chains of tasks. This topic is called partial replication,
and even though it has been empirically studied by some previous work, designing an optimal strategy that combines partial redundancy and checkpointing and analyzing its efficacy remain to be done.


Finally, our initial goal was to target pipelined workflow applications, where data continuously
enters the workflow, and where the objective is to maximize the throughput that can be achieved.
This causes several new challenges that we hope to address in the future.


## Former members
{% person cavelan_a %}, {% person lefevre_v %}, {% person han_l %}, {% person du_y %}. 




## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/ft_workflow_project.bib %}
