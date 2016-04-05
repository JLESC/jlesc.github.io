---
layout: page_project
title: Mitigating I/O Interference in Concurrent HPC Applications
date: 2016-02-11
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - storage
keywords:
  -
head: dorier_m
members:
  - antoniu_g
  - ibrahim_s
  - yildiz_o
  - ross_r
---

## Research topic and goals

With million-core supercomputers comes the problem of interference between distinct applications
accessing a shared file system in a concurrent manner {% cite LofsteadEtAl2010 --file external/ichpc_project.bib %}.
Our work aims to investigate and quantify this interference effect, and to mitigate I/O interference through a novel approach
that uses cross-application communication and coordination: CALCioM.
In previous work experiments done during Matthieu Dorier’s internship at ANL led to a better understanding of the I/O
interference phenomena, and to the implementation of a prototype of the CALCioM approach with
currently includes 3 scheduling strategies.
As a result of this work, a paper was accepted at IEEE IPDPS 2014 {% cite DorierEtAl2014a --file jlesc.bib %}.

## Results for 2015/2016

#### Sub-goal 1:
Having exemplified the interference phenomenon on synthetic benchmarks, we
are now interested in showing how often such interference occurs and the nature of the applications
that are involved in this phenomenon. This investigation was done through the analysis of traces
produced by the Darshan library on ANL’s Intrepid BlueGene/P system.

#### Results:
We developed Darshan-Ruby and Darshan-Web ([http://darshan-ruby.gforge.inria.fr](http://darshan-ruby.gforge.inria.fr)). Darshan-Ruby is a Ruby wrapper to ANL’s Darshan library. Darshan-Web is a Web
platform for online analysis of Darshan log files. This platform is based on Ruby on Rails, D3.js,
and AJAX technologies. A demo is available here: [http://darshan-web.irisa.fr](http://darshan-web.irisa.fr).

#### Sub-goal 2:
Our second goal was to find a way to improve CALCioM by modeling and
predicting I/O patterns. This prediction should be made at run time, with no prior knowledge of
the application, and should converge toward an accurate model of the application’s I/O within a
few iterations only.

#### Results:
To this end, we developed Omnisc’IO, an approach that leverages format grammars
to model and predict the I/O behavior of HPC applications. Omnisc’IO was evaluated with four
real application: CM1 {% cite BryanFritsch2002 --file external/ichpc_project.bib %}, Nek5000 {% cite LottesEtAL2008 --file external/ichpc_project.bib %},
LAMMPS {% cite LAMMPS2010 --file external/ichpc_project.bib %} and GTC {% cite GTC2010 --file external/ichpc_project.bib %}, and our results led to a paper
at SC’14 {% cite DorierEtAl2014b --file jlesc.bib %}.

## Visits and meetings

* June 2 - June 6: Rob Ross visited KerData in Rennes.
* June 9 - June 11: 11th workshop of the JLESC held in Nice, France.
* November 24 - November 26: Meetings for updates and planning were held during the 2nd JLESC
* July - September 2015: Internship of Orcun Yildiz at Argonne National Laboratory.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person antoniu_g %}    | 1 PM |
| {% person ibrahim_s %} | 2 PM |
| {% person dorier_m %}   | 1 PM   |
| {% person yildiz_o %} | 10 PM |
| {% person ross_r %}   | 1 PM   |

## Future plans

#### Sub-goal 1:
Our plan is to integrate Omnisc’IO within CALCioM in order to provide a fully-featured
I/O scheduling system.
Evaluations will be made using event-driven simulations, using traces from Argonne’s Darshan tools.

#### Sub-goal 2:
Our plan is to investigate the different factors which contribute to the interference
in HPC systems and explore a model to predicate this interference. And ultimately to provide
a new framework for interference-aware scheduling that would help in improving the performance
of HPC applications. This work is the subject for the summer internship for Orcun Yildiz at ANL
(2015).

## References

{% bibliography --file external/ichpc_project.bib %}
