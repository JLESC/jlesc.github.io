---
layout: post
title: Computational Linear Algebra on FPGAs
date: 2023-03-09
updated: 2024-04-08
navbar: Research
subnavbar: Projects
project_url:
status: finished
topics:
  - architectures
  - numerics
keywords:
  - FPGA
  - Linear Algebra
head: anzt_h
members:
  - kahira_a
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

As the Dennard scaling ended, hardware manufacturers and application scientists have turned to non-traditional architectures to serve the need for compute power while keeping the power-budget low. For mainstream CPU and GPU architectures, there exists a large collection of libraries providing basic linear algebra building blocks (vector and matrix operations) and numerical algorithms (linear solvers, preconditioners, etc.) that are developed either by the hardware manufacturers (“vendor libraries”) or the academic community. For exotic architectures like FPGAs, in many cases the user community is yet too small to drive the development on basic linear algebra subroutines or numerical algorithms. This, in turn, reduces the potential use of these architectures in scientific computations, in particular computational science.

In this project, JSC researchers and ICL researchers will collaborate to develop and expand the existing linear algebra libraries and functionality. The project is expected to accelerate the development of linear algebra functionality for FPGAs, and ensure the functionality hits the architecture-specific performance limits.

## Results for 2023/2024

Albert spent 3 months at ICL and worked extensively on LU Decomposition Kernel for Xilinx FPGA, specifically, U55C. This kernel was integrated with the public release of OOPS library under the OPTIMA Project(https://optima-hpc.eu/). Furthermore, the results of this kernel we part  of Deliverable 5.5(https://optima-hpc.eu/wp-content/uploads/2023/12/D5.5.pdf). 
Besides the deliverable, we also gained expertise in performance measurements for linear algebra routines and that is also reflected in Deliverable 6.2 of the OPTIMA Project. 


## Visits and meetings

* 3-month stay of Albert Njoroge Kahira (JSC) at the University of Tennessee 



## Impact and publications

The collaboration helped the successful completion of the OPTIMA HPC project and was highlighted as a KPI in the project. 


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
None.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/linear_algebra_on_fpga.bib %}
