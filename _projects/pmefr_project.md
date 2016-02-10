---
layout: page_project
title: Programming Model Extensions for Resilience
date: 2016-02-10
updated:
navbar: Projects
footer: true
project_url:
status: starting
topics:
  resilience
keywords:
  -
head: amer_a
members:
  - balaji_p
  - beltran_v
  - casas_m
---
{% comment %}
===============================
=== HOWTO USE THIS TEMPLATE ===
===============================

Copy this file to `_projects` and rename it to a very short version of your project's title, e.g.
the project "Scalability Enhancements to FMM for Molecular Dynamics Simulations" chooses
"fmm_project.md".

Also copy the file `_templates/project.bib` to `_bibliography/external` and name it exactly as this
one, but the file extension, e.g. "fmm_project.bib".

!IMPORTANT!
Remember to adjust the file name of the BibTeX file at the very bottom of this file!!

Then fill in the YAML header variables above.

- title
  The full title of the project

- date
  The date this page was created in the format: YYYY-MM-DD.
  This will get displayed at the very bottom of the generated website.

- updated
  In case you or somebody else came back later and edited significant parts of the page, put in the
  date (format: YYYY-MM-DD) of that change.
  If present, this will get displayed at the very bottom of the generated website.

- project_url
  Optional URL to some external website of the project.

- status
  The current status of the project.
  You have to use one of the keys defined in '_data/project_stati.yml'

- topics
  A list of topic keys (as defined in '_data/topics.yml') for this project.
  Each topic on a new line with a leading dash.

- keywords
  Optional list of keywords for this project.
  Each topic on a new line with a leading dash.

- head
  The dedicated project leader.
  This is the identifier of a person as found in '_data/people.yml'.

- members
  A list of members of this project, i.e. the people doing the work.
  Each member must be listed as its identifier as found in '_data/people.yml' on a new line with a
  leading dash.
{% endcomment %}

## Research topic and goals

The reliability of high performance computing systems is predicted to worsen given current
technology trends, where several errors per day are expected to occur in exascale systems. 
Consequently, the software stack that targets HPC systems needs to tolerate faults in order to cope with
the instability of such systems. 
Particularly, current parallel programming models, which assume that applications will execute on 
failure-free systems, require resilience extensions.
The most popular models used to program parallel systems are MPI for distributed memory
and thread-based models, such as OpenMP, for shared-memory. 
Several works have studied faulttolerance methods for MPI applications at the process level such as 
the User-Level Fault Mitigation (ULFM) effort at ANL. 
Recently, the need for finer-grained levels of resilience arose in the community
because of the space and time overheads of coarse-grained approaches. 
Consequently, research in this direction has become more active leading to new methods such as the rollbackrecovery
method applied to asynchronous tasks in the OmpSs programming model.
Despite recent advances, there exists no programming model that offers high degrees of resilience
and low overheads for hybrid MPI+threads applications. 
This collaboration aims at providing resilience extensions for hybrid MPI+threads programming models at multiple levels. 
At the thread-level, errors are contained within the failing threads except if recovery is not possible,
in which case propagating the failure to the MPI process will be necessary. 
The system then will rely on process-level fault-tolerance techniques to mitigate the failure.

## Results for 2014/2015

There were interactions through telecon between the collaborators which involved discussions
about ULFM for process-level resilience and the feasibility of thread-level fault-tolerance extensions.

## Visits and meetings

There were frequent telecon meetings since the beginning of the collaboration. There are no
planned visits yet.

## Impact and publications

None yet.
<!--

-->
{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2014/2015
Since December 2014:

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person amer_a %}    | 0.5 PM |
| {% person balaji_p %}    | 1 PM |
| {% person beltran_v %} | 1 PM |
| {% person casas_m %}   | 1 PM   |

## Future plans

We plan to push further the investigation of fine-grained fault-tolerance support in hybrid MPI+threads programming models. 
The goal is to answer several open questions including, but not limited to, the degree of granularity suitable for the 
fine-grained level (threads or tasks), define the interaction between the coarse-grained and fine-grained levels of 
fault-tolerance, the way communication issued by a failed thread should be handled (flushed or ignored), and investigate
the role and necessity of using robust synchronization mechanisms, such as robust mutexes, by the
underlying multithreaded runtime system.

## References

{% bibliography --file external/pmefr_project.bib %}

