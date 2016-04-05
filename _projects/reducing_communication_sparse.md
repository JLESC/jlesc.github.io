---
layout: page_project
title: Reducing Communication in Sparse Iterative and Direct Solvers
date: 2016-03-23
updated:
navbar: Research
subnavbar: Projects
footer: true
project_url:
status: running
topics:
  - numerics
keywords:
  -
head: olson_l
members:
  - bienz_a
  - grigori_l
  - gropp_b
---

## Research topic and goals

The focus of this collaboration is on the development of topology-aware sparse solvers at extreme
scales. In this first phase we have made some initial steps in forming a communications
model and formalizing the project with INRIA.
Communication costs dominate most sparse solvers leading to sharp strong scaling limitations.
The specific topology of the computation plays an important role in these costs and current sparse
solvers do not take this into account — e.g. algebraic multigrid. Since algebraic methods only approximate
a solution, there is an opportunity to reduce communication costs by limiting algebraic
decisions to efficient paths in the topology.
The primary goal is to develop solvers in this direction. The partnership between Illinois and
INRIA through the JointLab will directly enhance this effort.

The project involves Illinois graduate student Amanda Bienz, Illinois professors Bill Gropp
and Luke Olson, and INRIA professor Laura Grigori. Amanda Bienz presented initial results at
the Copper Mountain Conference on Multigrid Methods in March 2015. The work highlighted
several aspects in moving toward topology-based algorithm decisions. Here, we investigated the
communication overhead of an algebraic multigrid method at scale, where coarse grids push the
strong scaling limit and exhibit irregular memory access patterns. As a result, high communication
lead to reduced efficiency. We developed an alpha-beta type communication model that attempts
to account for two aspects in the communication: message distance and message contention in the
network. The result is a model that may help make point-wise decisions in the algorithm. For
example, sparse entries could be strengthened or weakened depending on their communication
burden.


## Results for 2015/2016

Recent efforts have focused on overlapping communication with computation in the
sparse matrix-vector multiplication operation.  This work led to an
asynchronous SpMV operation that was presented at Supercomputing15 in November
2015 as well as the Copper Mountain Conference on Iterative Methods in March
2016.

The next steps of the collaboration include incorporating the sparsification
strategies that we have developed for algebraic multigrid (AMG) into low-rank
preconditioners.  To this end, we are also focussed on developed topology-based
decisions into the sparsification process.

## Visits and meetings

Completed: JointLab Meeting in Barcelona, June 2015.

Completed: JointLab Meeting in Bonn, December 2015.

Planned: Amanda Bienz visit to INRIA, Spring 2016 for 4 months

## Impact and publications

None yet.

{% bibliography --cited --file jlesc.bib %}

## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person bienz_a %}    | 0.1 PM |
| {% person olson_l %}    | 0.1 PM |
| {% person grigori_l %}  | 0.1 PM |
| {% person gropp_b %}    | 0.1 PM |

## Future plans

Going forward, we have outlined a plan to work with a broader collection of
sparse solvers by collaborating with the expertise at INRIA. Amanda Bienz will
be supported through the NSF Grow project for a four-month visit to INRIA to
work with Grigori and others on these topics.   We continue to anticipate
meeting again at SIAM PP in Paris as well as the Joint Lab meeting in Lyon.

## References

No references.

{% bibliography --file external/reducing_communication_sparse.bib %}
