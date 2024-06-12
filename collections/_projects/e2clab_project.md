---
layout: post
title: Advancing Chameleon and Grid'5000 testbeds II
date: 2022-07-15
updated: 2024-01-31
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - architectures
keywords:
  - computing continuum
  - reproducibility
  - methodology
head: keahey_k
members:
  - rosendo_d
  - costan_a
  - antoniu_g
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
                   WARNING: do not use quotation marks, colons and the likes

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

  topics           (required)
                   a YAML list of topic keys (as defined in '_data/topics.yml') for this project;
                   each topic on a new line with a leading dash

  keywords         (optional)
                   a YAML list of keywords for this project;
                   each topic on a new line with a leading dash.

  head             (required)
                   the dedicated project leader;
                   this is the identifier of a person as found in '_data/people.yml'

  members          (optional)
                   a YAML list of members of this project excluding the head;
                   each member must be listed as its identifier as found in '_data/people.yml'

Now, fill in the details for the current report below. Please do not change headings, headings level
or order.
Read the comments carefully!

{% endcomment %}

## Research topic and goals

Distributed digital infrastructures for computation and analytics are now
evolving towards an interconnected ecosystem allowing complex applications
to be executed from IoT Edge devices to the HPC Cloud (aka the Computing
Continuum). Understanding end-to-end performance in such a complex continuum
is challenging. This breaks down to reconciling many, typically contradicting
application requirements and constraints with low-level infrastructure design
choices. One important  challenge is to accurately reproduce relevant behaviors
of a given application workflow and representative settings of the physical
infrastructure underlying this complex continuum {% cite DanielEtAl2022 --file jlesc.bib %}.

At Inria we introduced a rigorous methodology for such a process and validated it through
E2Clab {% cite DanielEtAl2020 --file jlesc.bib %}. It is the first platform to support the
complete analysis cycle of an application on the Computing Continuum: (i) configuration of
the experimental environment; (ii) mapping between the application parts and machines on
the Edge-Fog-Cloud; (iii) deployment of the application on the infrastructure; (iv) automated
execution; (v) application optimization {% cite DanielEtAl2021 --file jlesc.bib %}; and
(vi) gathering of experiment metrics.

The main research goal of this project is to enable scientists to effectively
reproduce and explore experiments run in the Grid5000 platform by integrating
it with the Jupyter environment and the Trovi portal {% cite ChameleonEtAl2022 --file external/e2clab_project.bib %}.
The idea of integrating testbeds such as Chameleon {% cite KateEtAl2020 --file external/e2clab_project.bib %}
and Grid5000 {% cite RaphaEtAl2006 --file external/e2clab_project.bib %} with Trovi/Jupyter
is to have an open access repository of research artifacts which are visible and reproducible
across testbeds.

The ultimate goal is to lower the barrier to reproducing research by combining
the reproducible artifacts and the experimental environment. We will demonstrate
how our Jupyter/Trovi approach for reproducibility helps scientists to reproduce
complex Edge-to-Cloud workflows across Chameleon/CHI@Edge/G5K.

## Results for 2022/2023

This research work was developed during the summer internship of Daniel Rosendo (INRIA) at
ANL (July to September 2022) and was presented in the 14th JLESC Workshop.

We started this project by exploring the following research question: What are the
limitations of the existing collaborative environments? We investigate the main
state of the art environments, such as: Google Colab, Kaggle, and Code Ocean.
We observed that existing approaches lacks support to: (1) providing access to
heterogeneous resources (e.g., IoT/Edge devices); (2) practical reproducibility of
experiments (e.g., it is hard to reproduce experiments on the exact same hardware since
the resources vary over time); and (3) executing experiments at large scale (e.g., users
have to pay to access multiple machines).

Based on these limitations, we explored the following research question: What would a
good collaborative system look like? In our vision, collaborative environments for
enabling Computing Continuum research should provide mainly the following three
features: (1) open access to research artifacts to allow other researchers to reproduce
published experiments; (2) an interactive computing environment packaged with code, data,
environment configurations, and experiment results; and (3) experiment methodologies
exploring large-scale scientific testbeds.

Finally, we proposed and implemented our collaborative environment. It provides the
following main features: (1) Trovi sharing portal: allow users to package code, data,
environment configurations, and results and archive them in this portal, so artifacts
can be easily shared and found by other users; (2) Grid’5000 Jupyter environment: guides
users to systematically define the experiment workflow and execute experiments; (3) Our
experiment methodology: abstracts all the complexities to deploy applications on multiple
testbeds (e.g., Grid5000, Chameleon, FIT IoT lab, and CHI@Edge), as well as repeat
experiments on the same infrastructure.

We illustrate our collaborative environment with an Edge-to-Cloud experiment workflow
deployed on multiple testbeds, such as: Grid5000 + FIT IoT lab; and Chameleon + CHI@Edge.
The use case refers to a monitoring system in the African savanna where various edge
devices (Raspberry Pi available at FIT IoT lab / CHI@Edge) located in different regions
take pictures of animals, perform some image preprocessing and then send images to the
cloud server (available at Grid5000 / Chameleon). On the cloud there is a Deep Learning
application that identifies the animals. Evaluations show that our collaborative
environment has proven useful for reproducing experiments on large-scale platforms from
the IoT/Edge to the HPC/Cloud Continuum. It helps users to: (1) systematically configure
the experimental environment; (2) deploy distributed applications on multiple testbeds
easily; (3) repeat experiments on the same testbed configurations; and (4) make code,
data, environment, and results shared easily.

## Results for 2023/2024

In 2023, the collaboration between INRIA and ANL continued principally via discussions on reproducibility as well as around an emergent common interest in edge computing. 

On the reproducibility front, Daniel Rosendo presented a paper on practical reproducibility in Edge-to-Cloud experiments at the ACM REP conference on June 27, 2023 {% cite RosendoEtAl2023 %}. The results presented in the paper were largely an outcome of the joint work performed in the prior year.

On the ANL side, we continued our investment in reproducibility topics by engaging a wide community of researchers and educators to advance the mission of popularizing the concept of practical reproducibility in Computer Science. This work was performed as part of the ANL-led REPETO project {% cite Repeto2024 --file external/e2clab_project.bib %}. We held four reproducibility hackathons in collaboration with major CS conferences, including at FAST 2023, ACM REP 2023, ATC/OSDI 2023, and IC2E 2023. In addition, we organized two additional hackathons with the Chameleon community (one at the Chameleon User Meeting in May 2023 and another virtual hackathon in Dec. 2023). These events showed attendees how to package experiments for practical reproducibility and share them on Chameleon’s Trovi service so others could reproduce them. Furthermore, we published a paper (Three Pillars of Practical Reproducibility) at the 2023 IEEE eScience ReWorDS Workshop, outlining the methodology and support needed for practical reproducibility {% cite KeaheyEtAl2023 --file external/e2clab_project.bib %}.

Over the summer of 2023, members of the REPETO project hosted the first Summer of Reproducibility program. The program offers summer internship opportunities for students and mentors who are interested in reproducibility for computer science research. It is modeled on Google Summer of Code: mentors propose a project and students apply for it. We particularly sponsor projects that package experiments to advance practical reproducibility, i.e., the idea that reproducibility can be a mainstream method of scientific exploration, similar to what reading papers is today. Those experiments can be replayed -- and potentially modified and improved to propose and test new ideas -- on Chameleon. The program provides funding for both US-based and international students and collaborations. In 2024, the REPETO project will continue to support the Summer of Reproducibility initiative and a call for projects for this summer is already underway.

The discussions of edge computing are emergent with both INRIA and ANL making separate investigations for the time being. The ANL team is working in the context of the CHI@Edge platform on Chameleon {% cite ChiEdge2024 --file external/e2clab_project.bib %} and FLOTO projects {% cite KeaheyEtAl2023b --file external/e2clab_project.bib %}. The INRIA team is focusing on two challenges: (1) the efficient provenance data capture at the edge, for reproducibility purposes {% cite RosendoEtAl2023b --file external/e2clab_project.bib %}, and (2) enabling continual learning and federated learning at the edge, in the context of the ENGAGE project {% cite Engage2024 --file external/e2clab_project.bib %}, where initial results target the efficient deployment of such workloads on the edge-cloud continuum {% cite PrigentEtAl2022 --file external/e2clab_project.bib %} and securing the learning in the heterogeneous and volatile edge environments {% cite ChelliEtAl2023 --file external/e2clab_project.bib %}.


## Visits and meetings

We schedule regular meetings between the members of the project.

{% person rosendo_d %} visited ANL in the context of a Student Appointment during summer
2022 (July to September).

## Impact and publications

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

A first publication is in the works, we plan to submit results to the ACM REP conference.
As a continuation of our search work, we will explore the benefits of our collaborative
environment considering the point of view of authors of an article, as well as the readers
of an article. In this work we are targeting the practical reproducibility of experiments
in a cost-effective way, that means: reproducing the exact same experiment environment,
hardware/software versions, network topology, processing workflow; and experiment results.
The goal is to show that our approach facilitates reproducibility of complex Edge-to-Cloud
workflows on open testbeds in a cost-effective way.

For instance, authors want to efficiently configure the experimental infrastructure, not
spending a lot of time satisfying all the experiment’s requirements. Besides, they want to
easily share their experiment artifacts. While, readers want to perform the experiment,
not just read about it. Besides, they want not just the “What” (What the experiment does?),
but also the “Why” (Why did authors setup that way?) and “How” (How did authors connect
machines/devices together?). Finally, they want to find and access the experiment to be as
simple as finding and reading the article.

We will illustrate with a real-life Edge-to-Cloud application workflow and study the
performance trade-offs of cloud-only vs edge+cloud processing. We will demonstrate how
authors of an article may perform experiments on the Chameleon + CHI@Edge testbeds and
then share their artifacts. Then, we show how our collaborative environment also helps
readers to have access to the author's artifacts and reproduce the experiment results in
different testbeds, such as the Grid5000 + FIT IoT LAB.


## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/e2clab_project.bib %}
