---
layout: page_project
title: Reducing Communication in Sparse Iterative and Direct Solvers
date: 2019-02-28
updated:
navbar: Research
subnavbar: Projects
footer: true
project_url:
status: suspended
topics:
  - numerics
keywords:
  - sparse matrix
  - multigrid
  - Krylov
  - iterative
  - communication
head: olson_l
members:
  - bienz_a
  - grigori_l
  - gropp_b
  - lockhart_s
---

## Research topic and goals

The focus of this collaboration is on reducing communication in sparse solvers at extreme
scales. The first phase made some initial steps in forming a communications
model.
Communication costs dominate most sparse solvers leading to sharp strong scaling limitations.
The specific topology of the computation plays an important role in these costs and current sparse
solvers do not take this into account — e.g. algebraic multigrid. 
Aggregating communication to align with machine topology can lead to performance gains.
The primary goal is to develop advanced solvers in this direction. The partnership between Illinois and
INRIA through the JointLab will directly enhance this effort.

The project involves Illinois graduate student Shelby Lockhart, postdoc Amanda Bienz, Illinois professors Bill Gropp
and Luke Olson, and INRIA professor Laura Grigori. The work has highlighted
several aspects in moving toward topology-based algorithm decisions. 
The next steps in the project will take a closer look at the performance opporunitities in enlarged Krylov methods.

## Results for 2015/2016

Recent efforts have focused on overlapping communication with computation in the
sparse matrix-vector multiplication operation.  This work led to an
asynchronous SpMV operation that was presented at Supercomputing15 in November
2015 as well as the Copper Mountain Conference on Iterative Methods in March 2016.  

## Results for 2016/2017

The work was extended to aggregate communication at on the nodes and was presented at SC16 and at Copper Multigrid 2017.

The next steps of the collaboration will look at adding pushing the topology aware process to sparse algorithms at INRIA.

## Results for 2017/2018

The work resulted in presentations at the 7th JLESC Workshop in July, 2017, along with presentation of multigrid and sparse-matrix multiplication results at SC17 and Copper Mountain Multigrid (2017) and Copper Mountain Multigrid (2018).  In addition, the main code Raptor, was released as open source.

Grigori (INRIA) serves on Bienz's thesis committee; Bienz is expected to finish in 2018.

The next steps include completing contention modeling.

## Results for 2018/2019

Recent progress has included a paper in review, significant updates to the code
base, and a beta version of a node aware communication package.  Bienz
completed a PhD in summer 2018, with Grigori (INRIA) serving on the final
defense committee.  Shelby Lockhart has joined the collaboration and is making
some initial steps toward performance analysis of enlarged Krylov methods.

## Visits and meetings

Completed: JointLab Meeting in Barcelona, June 2015.

Completed: JointLab Meeting in Bonn, December 2015.

Completed: Amanda Bienz visit to INRIA, Spring 2016 for 4 months.

Completed: JointLab Meeting in Champaign, July 2017.

Completed: JointLab Meeting in Barcelona, April 2018.

Planned: JointLab Meeting in Tennessee, April 2019.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}

## Future plans

Going forward, we have outlined a plan to work with a broader collection of
sparse solvers by collaborating with the expertise at INRIA.  We continue to anticipate
meetings at the upcoming Joint Lab meetings.

## References

{% bibliography --file external/reducing_communication_sparse.bib %}
