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
scales. The first phase made some initial steps in forming a communications
model.
Communication costs dominate most sparse solvers leading to sharp strong scaling limitations.
The specific topology of the computation plays an important role in these costs and current sparse
solvers do not take this into account — e.g. algebraic multigrid. Since algebraic methods only approximate
a solution, there is an opportunity to reduce communication costs by limiting algebraic
decisions to efficient paths in the topology.  Moreover, aggregating node-level communication can lead to additional performance gains.
The primary goal is to develop solvers in this direction. The partnership between Illinois and
INRIA through the JointLab will directly enhance this effort.

The project involves Illinois graduate student Amanda Bienz, Illinois professors Bill Gropp
and Luke Olson, and INRIA professor Laura Grigori. The work has highlighted
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
2016.  The work was extended to aggregate communication at on the nodes and was presented at SC16 and at Copper Multigrid 2017.

The next steps of the collaboration will look at adding pushing the topology aware process to sparse algorithms at INRIA.

## Visits and meetings

Completed: JointLab Meeting in Barcelona, June 2015.

Completed: JointLab Meeting in Bonn, December 2015.

Completed: Amanda Bienz visit to INRIA, Spring 2016 for 4 months.

Planned: JointLab Meeting in Champaign, July 2017.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Future plans

Going forward, we have outlined a plan to work with a broader collection of
sparse solvers by collaborating with the expertise at INRIA.  We continue to anticipate
meeting again at SIAM PP in Paris as well as the upcoming Joint Lab meetings.

## References

{% bibliography --file external/reducing_communication_sparse.bib %}
