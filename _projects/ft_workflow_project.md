---
layout: page_project
title: Optimization of Fault-Tolerance Strategies for Workflow Applications
date: 2016-03-16
updated: 2017-04-01
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
  - cappello_f
  - robert_y
  - cavelan_a
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


## Results

The initial work for this project has been focused towards using replication as a detection and correction mechanism for Silent Data Corruptions (SDC). Although other detection techniques exist for HPC applications, based on algorithms (ABFT), invariant preservation or data analytics, replication remains the most transparent and least intrusive technique. 

In this project, replication is combined with checkpointing to enable rollback and recovery when forward recovery is not possible, which occurs when too many replicas are corrupted. The goal is to find the right level of replication (duplication, triplication or more) needed to efficiently detect and correct silent errors at scale. We have provided a detailed analytical study for this framework in the previous years.

In the last year of the project, we have extended these results for platforms subject to both silent and fail-stop errors. Fail-stop errors are immediately detected, unlike silent errors, and replication may also help tolerating such errors. 

We have considered two flavors of replication: process replication and group replication. Process replication applies to message-passing applications with communicating processes. Each process is replicated, and the platform is composed of process pairs, or triplets. Group replication applies to black-box applications, whose parallel execution is replicated several times. The platform is partitioned into two halves (or three thirds). In both scenarios, results are compared before each checkpoint, which is taken only when both results (duplication) or two out of three results (triplication) coincide. If not, one or more silent errors have been detected, and the application rolls back to the last checkpoint, as well as when fail-stop errors have struck. 

We provide a detailed analytical study for all of these scenarios, with formulas to decide, for each scenario, the optimal parameters as a function of the error rate, checkpoint cost, and platform size. We also report a set of extensive simulation results that nicely corroborates the analytical model.

While the previous work had focused on applications for which we can decide at which frequency we can checkpoint, and our aim has been to find the optimal checkpointing period, we have also initiated the study for linear chains of parallel tasks. The aim is then to decide which tasks to checkpoint and/or replicate. In this case, we have
provided an optimal dynamic programming algorithm, and an extensive set of simulations to assess (i) in which scenarios checkpointing performs better than replication, or vice-versa; and (ii) in which scenarios the combination of both methods is useful, and to what extent.



## Visits and meetings

{% person cavelan_a %} visited {% person cappello_f %} in Chicago for three months (March, April, and May 2016) to initiate the project. Furthermore, we have been meeting regularly in the previous years. In particular,
we have been attending the SC conference (November 2016
and November 2017), where we had extensive discussions to make progress. 
We represented the JLESC at the Inria booth during these conferences. 

While not meeting in person, we have stayed in close collaboration through regular Skype meetings,
which allowed us to make progress on the project. 


## Impact and publications

Two papers have been accepted to FTXS'17 {% cite benoitEtAl2017identifying --file external/ft_workflow_project.bib %},{% cite benoitEtAl2017optimal --file external/ft_workflow_project.bib %}.

The most recent work combining fail-stop and silent errors has been submitted to JPDC ("Coping with silent and fail-stop errors at scale by combining replication and checkpointing"). 

The initial work on linear chain of tasks will be submitted to APDCM'18 ("Combining Checkpointing and Replication for Linear Workflows"). 


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

Also, we have not yet explored how replication may help correct silent data corruptions in 
workflow applications, since our initial study considers only fail-stop errors. Combining
both types of errors for workflow applications is a challenging perspective to our work. 

Finally, our initial goal was to target pipelined workflow applications, where data continuously
enters the workflow, and where the objective is to maximize the throughput that can be achieved.
This causes several new challenges that we hope to address in the future. 



## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/ft_workflow_project.bib %}
