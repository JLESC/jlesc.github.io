---
layout: post
title: Mitigating I/O Interference in Concurrent HPC Applications
date: 2016-02-11
updated: 2016-02-11
navbar: Research
subnavbar: Projects
project_url:
status: finished
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

With million-core supercomputers comes the problem of I/O interference between distinct applications
accessing a shared file system in a concurrent manner {% cite LofsteadEtAl2010 --file external/ichpc_project.bib %}.
Our work in this context is twofold. We aim to investigate and quantify this interference effect, as well as find its root causes, and we aimto mitigate I/O interference through novel approaches
based on scheduling and cross-application communication and coordination.
In previous work, experiments done during Matthieu Dorier’s internship at ANL (2013) led to a better understanding of the I/O
interference phenomena, and to the implementation of a prototype of the CALCioM approach with
currently includes 3 scheduling strategies.
As a result of this work, a paper was published at IEEE IPDPS 2014 {% cite DorierEtAl2014a --file jlesc.bib %}.

## Results for 2014/2015

### Sub-goal 1:
Having exemplified the interference phenomenon on synthetic benchmarks, we
are now interested in showing how often such interference occurs and the nature of the applications
that are involved in this phenomenon. This investigation was done through the analysis of traces
produced by the Darshan library on ANL’s Intrepid BlueGene/P system.

### Results:
We developed Darshan-Ruby and Darshan-Web ([http://darshan-ruby.gforge.inria.fr](http://darshan-ruby.gforge.inria.fr)). Darshan-Ruby is a Ruby wrapper to ANL’s Darshan library. Darshan-Web is a Web
platform for online analysis of Darshan log files. This platform is based on Ruby on Rails, D3.js,
and AJAX technologies. A demo is available here: [http://darshan-web.irisa.fr](http://darshan-web.irisa.fr).

### Sub-goal 2:
Our second goal was to find a way to improve CALCioM by modeling and
predicting I/O patterns. This prediction should be made at run time, with no prior knowledge of
the application, and should converge toward an accurate model of the application’s I/O within a
few iterations only.

### Results:
To this end, we developed Omnisc’IO, an approach that leverages format grammars
to model and predict the I/O behavior of HPC applications. Omnisc’IO was evaluated with four
real application: CM1 {% cite BryanFritsch2002 --file external/ichpc_project.bib %}, Nek5000 {% cite LottesEtAL2008 --file external/ichpc_project.bib %},
LAMMPS {% cite LAMMPS2010 --file external/ichpc_project.bib %} and GTC {% cite GTC2010 --file external/ichpc_project.bib %}, and our results led to a paper
at SC’14 {% cite DorierEtAl2014b --file jlesc.bib %}.

## Results for 2015/2016

### Sub-goal 1:
We continued maintaining and developing Darshan-Ruby in order to adapt it to the new Darshan 3 format.

### Results:

The development of Darshan-Ruby for Darshan 3 was moved to Argonne ([https://xgitlab.cels.anl.gov/darshan/darshan-ruby](https://xgitlab.cels.anl.gov/darshan/darshan-ruby)). A new tool called Quarshan was developed to efficiently query a large number of log files and perform operations on Darshan data.

#### Sub-goal 2:
Research efforts from the literature on mitigating I/O interference focus on a single potential cause of interference (e.g., the network). Yet the root causes of I/O interference can be diverse. In this research direction, we aim to better understand the root causes of I/O interference, and to propose new I/O scheduling techniques to solve the interference issue.

#### Results:

We conducted an extensive experimental campaign to explore the various root causes of I/O interference in HPC storage systems. We used microbenchmarks on the Grid'5000 testbed to evaluate how the applications' access pattern, the network components, the file system's configuration, and the backend storage devices influence I/O interference. The results of this campaign have been published at the IPDPS 2016 conference {% cite YildizIPDPS2016 --file jlesc.bib %}.

## Visits and meetings

* June 2, 2014 - June 6: Rob Ross visited KerData in Rennes.
* June 9, 2014 - June 11: 1st workshop of the JLESC held in Nice, France.
* November 24, 2014 - November 26: Meetings for updates and planning were held during the 2nd JLESC workshop
* July - September 2015: Internship of Orcun Yildiz at Argonne National Laboratory.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}

## References

{% bibliography --file external/ichpc_project.bib %}
