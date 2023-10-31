---
layout: post
title:  Automatic I/O scheduling algorithm selection for parallel file systems
date: 2016-09-08
updated: 2018-01-01
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics:
  - storage
keywords:
  -
head: cortes_t
members:
  - zanon_f
  - nou_r
  - mehaut_j
  - navaux_p

---


## Research topics and goals

This is an finished collaboration between researchers from the
BSC, INRIA, and the Federal University of Rio Grande do Sul (UFRGS).

We are investigating the use of pattern matching at parallel file system (PFS) servers for automatic I/O scheduling algorithm selection.
Previous research from Boito et al. (INRIA, UFRGS) indicated the best choice
in scheduling algorithm for PFS servers depends on characteristics of
the applications and of the server, therefore there is potential for
dynamic algorithm selection to improve performance. Additionally,
previous research from Nou et al. (BSC, IOLanes European project,
FP7-248615) applied pattern matching for dynamic scheduler selection
in the context of disk scheduling. The main difference between the
contexts of disk scheduling and parallel file system scheduler is the
level - the former works with blocks, while the latter works with
files and offsets. Furthermore, the high concurrency in the access to
the servers, and the variability of arrival times impose a greater
challenge to the pattern matching task.

The collaboration started during the JLESC workshop in June 2015, in
Barcelona. Progress has been slow due to the lack of personnel.

## Report 2015/2016

As a first step, it was important to check the viability of such
dynamic scheduling algorithm selection. Previously evaluated
approaches involved selecting an algorithm at the beginning of the
execution only. On the other hand, the idea of this work is to have a
time window of requests to form a pattern, and re-select the algorithm
after each pattern. The viability of this approach is related to the
size of the window, which impacts the pattern matching capacities.

A new scheduling policy was added to the AGIOS scheduling library
(developed by Francieli Boito). This scheduler, called Armed Bandit,
periodically changes the scheduling algorithm in place. It does not
use any knowledge about patterns, but keeps performance metrics
(measured in different time windows) to each scheduling algorithm
available, and selects the next algorithm randomly, giving higher
probability to the algorithms that presented higher performance.

Experiments were conducted with different window lengths, using the
OrangeFS parallel file system, searching for a balance between
performance improvements and the overhead of deciding and changing the
scheduling algorithm.  Results show that 4s windows are a good
trade-off, and the results are also similar to what was observed to
the best static scheduling algorithm in each situation, as long as
tests are long enough to compensate the initial phases when the
mechanism is changing between schedulers just to collect
information. This indicated there is potential for the pattern
matching approach to be successful, and provides a baseline of
comparison for its results.

## Report 2016/2017

The idea of the pattern matching approach is to build a knowledge base
about access patterns and performance with different scheduling
algorithms. A Markov chain must be built with these patterns, so by
predicting the next pattern, we can change the scheduling algorithm to
the best one for that pattern. The pattern matching module, added to
AGIOS, is executed after each time window. The pattern observed during
this window is compared with existing patterns, and stored as a new
one if there is no match. Performance information with different
scheduling algorithms is kept to each pattern, so with the prediction
we can also choose the next algorithm to be used. When information is
not enough to decide, the Armed Bandit approach can be used. It is
clear the success of the approach depends on how access patterns are
represented, matched, and predicted, hence this was the first aspect
to be evaluated.

Patterns are represented as time series of file offset differences
(each point is the distance inside the file between two consecutive
requests). Situations with multiple files are modeled with an idea of
a virtual disk where files are placed sequentially, so the distance
between positions in different files can be measured. To compare
patterns, the FastDTW approximation of the DTW algorithm was
used. Additional information about patterns - number of read/write
requests, amount of data read/written, number of accessed files, etc -
are used before comparing the time series to improve the quality of
the results and to decrease the number of calls to DTW.

The time series comparison results in a score that depends on the
time series, so these scores are normalized by the maximum DTW score
observed by the pattern matching module. The normalized scores are
compared to a given threshold to decide if the patterns match or
not. Depending on the past comparisons, it may be the case that very
similar patterns do not match because of the inadequate maximum score,
but by adjusting this value over time, the mechanism decisions are
expected to improve after an initial phase.

We executed the MPI-IO Test benchmark generating different access
patterns regarding spatiality (contiguous or non-contiguous), request
size (32KB, 4MB, or 16MB), and number of processes (32 or 64). A set
of these executions, composed of 120 executions (10 repetitions of
each of the 12 different tests), was provided to the mechanism in
random order.

Initial evaluations showed the mechanism creates very small knowledge
 bases, meaning it was matching more patterns than it should. We have
 also identified the comparisons between patterns using FastDTW could
 become a performance problem as the knowledge base grows.

## Report 2017/2018

The behavior of the FastDTW mechanism when comparing patterns was
further analyzed, leading to better choices for the mechanism's
parameters such as the maximum tolerated difference between patterns
and the threshold for matching. New results presented good results
when comparing 1D strided application patterns, but results were not
as good for contiguous application patterns, as they lead to more
non-contiguous patterns at server-side, and the distances calculated
between the time series become higher.

To mitigate this problem, we have investigated compression of
patterns, using buckets to combine requests in order to make patterns
shorter. The compression decreases the variation between repetitions
of the same application access pattern, and improves results for
the contiguous case.

Regarding performance, the sequential FastDTW code was modified to
optimize its memory accesses, leading to a speedup of up
to 6000. Additionally, we implemented version that uses OpenMP to
perform different comparisons in parallel. Preliminary results show a
speedup of 2 with 4 OpenMP threads.

We are now investigating the pattern matching mechanism with more
complex patterns, mixing read and write operations to multiple files
from multiple applications. In the next months, we hope to translate
these results into performance improvements, and write a scientific
paper with our findings.


## Visits and meetings
Email interaction. Meetings in JLESC'16 at Kobe.
Telco to discuss new results.

## Impact and publications
None yet.

<!--
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
-->

{% bibliography --cited --file jlesc.bib %}


## Future plans
The project is considered finished, and had opened new collaboration with the same actors that will create a new project inside the JLESC umbrella. For this finished project, the final step is to write a paper and publish the results.

## References

{% bibliography --file external/automatic_scheduler_project.bib %}
