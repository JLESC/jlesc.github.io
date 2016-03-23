---
layout: page_project
title: Topology-aware sparse solvers
date: 2016-02-24
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
head: bienz_a
members:
  - olson_l
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

## Results for 2014/2015

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

## Visits and meetings

Planned: JointLab Meeting in Barcelona, June 2015. Planned: Amanda Bienz visit to INRIA,
Spring 2016 for 3 months

## Impact and publications

None yet.

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2014/2015

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person bienz_a %}    | 0.1 PM |
| {% person olson_l %}    | 0.1 PM |
| {% person grigori_l %} | 0.1 PM |
| {% person gropp_b %}   | 0.1 PM   |

## Future plans

Going forward, we have outlined a plan to work with a broader collection of sparse solvers
by collaborating with the expertise at INRIA. Amanda Bienz has submitted an application
for the NSF Grow project which would support a longer visit to INRIA to work with Grigori
and others on these topics. A decision on the funding is immanent. We will be attending the
JointLab meetings in Barcelona to present initial findings and to outline the next steps in the
project before Amanda Bienz visits in the coming year.

## References

No references.

{% bibliography --file external/topology_aware_project.bib %}
