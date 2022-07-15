---
layout: page_project
title: Advancing Reproducibility in Computing Continuum Research
date: 2022-07-15
updated:
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

At Inria we introduced a rigorous methodology for such a process and validated 
it through E2Clab {% cite DanielEtAl2020 --file jlesc.bib %}. It is the first 
platform to support the complete analysis cycle of an application on the 
Computing Continuum: (i) configuration of the experimental environment; (ii) 
mapping between the application parts and machines on the Edge-Fog-Cloud; (iii) 
deployment of the application on the infrastructure; (iv) automated execution; 
(v) application optimization {% cite DanielEtAl2021 --file jlesc.bib %};
and (vi) gathering of experiment metrics. 

The main research goal of this project is to enable scientists to effectively 
reproduce and explore experiments run in the Grid5000 platform by integrating 
it with the Trovi portal {% cite ChameleonEtAl2022 --file external/e2clab_project.bib %}. The idea 
of integrating testbeds such as Chameleon {% cite KateEtAl2020 --file external/e2clab_project.bib %} 
and Grid5000 {% cite RaphaEtAl2006 --file external/e2clab_project.bib %} with Trovi is to 
have an open access repository of research artifacts which are visible and 
reproducible across testbeds.

The ultimate goal is to lower the barrier to reproducing research by combining 
the reproducible artifacts and the experimental environment. We will validate 
our methodology with a real-life hydrological application provided by 
collaborators from Rutgers University. The goal is to illustrate how our 
methodology helps scientists to reproduce complex Edge-to-Cloud workflows among 
the various testbeds supported by Trovi.


## Results for 2022/2023


## Visits and meetings

We schedule regular meetings between the members of the project.

{% person rosendo_d %} will visit ANL in the context of a Student Appointment 
during summer 2022.

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


## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/e2clab_project.bib %}
