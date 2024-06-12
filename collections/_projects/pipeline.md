---
layout: post
title: Advanced data and visualization pipelines on the example of nekRS
date: 2023-05-20
updated: 2024-01-31
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - storage
keywords:
  -
head: bode_m
members:
  - goebbert_j
  - windgassen_j
  - ferrier_n
  - insley_j
  - mateevitsi_v
  - rizzi_s
  - fischer_p
  - lan_y
  - papka_m
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

Fifteen years since the publication of "Exascale computing study: Technology challenges in achieving exascale systems" {% cite BergmanEtAl2008 --file external/pipeline.bib %} we have finally arrived at the dawn of the Exascale era. In the US, Aurora, Argonne National Laboratory's (ANL) first exascale computer is being built, while Europe's Jülich Supercomputing Centre (JSC) is gearing up for a 2024 launch of JUPITER. However, with increased computing power comes an influx of data that requires novel methods for data analysis, storage, processing, and visualization. The exascale era presents one significant challenge in the form of I/O bandwidth limitations, making reading and writing to disks slower than running simulations. Frameworks like SENSEI {% cite AyachitEtAl2016 --file external/pipeline.bib %} address this issue by providing in situ visualization and analysis tools to process data while it is still in memory.

NekRS {% cite FischerEtAl2022 --file external/pipeline.bib %}, an open-source Navier Stokes solver based on the spectral element method targeting classical processors and accelerators like GPUs, is an example of a simulation code that scientists will run on the entire machine. ANL and JSC are already collaborating on experimenting with and improving the corresponding data and visualization pipeline. Please note that while NekRS will be our initial focus, the developed methods and pipeline will be general enough for use with other exascale simulation codes and in situ frameworks.

Our team's current implementation uses a SENSEI-instrumented NekRS code to stream data in transit via an ADIOS n:m bridge to a ParaView server that manages the visualization. The data is then streamed to the cloud via TRAME, thus making it accessible in the browser and through JupyterLab. This preliminary work has already been performed and is very promising.

This project aims to improve the data and visualization pipeline in four steps: First, the workflow, as mentioned above, will be hardened and thoroughly evaluated. Second, we will evaluate our solution in terms of scaling and throughput. Third, we will perform scaling studies on exascale machines. Finally, we will demonstrate the usage of the pipeline with other simulation codes.

Our goal is to deliver a high-performance, flexible, and user-friendly data and visualization pipeline.

## Results for 2022/2023
None yet.

## Results for 2023/2024
We have examined the developments in relation to different visualization strategies and at scale. We detailed our approach of instrumenting NekRS, a GPU-focused thermal-fluid simulation code employing the spectral element method (SEM), and analyzed varied \textit{in situ} and \text{in transit} strategies for data rendering. Additionally, we provided concrete scientific use-cases and reported on runs performed on Polaris, Argonne Leadership Computing Facility's (ALCF) 44 Petaflop supercomputer and Jülich Wizard for European Leadership Science (JUWELS) Booster, Jülich Supercomputing Centre's (JSC) 71 Petaflop High Performance Computing (HPC) system, offering practical insight into the implications of our methodology. Our results were presented at the ISAV23, awarded with the best paper award, and publish in the ISAV23 proceeding {% cite MateevitsiEtAl2023 --file jlesc.bib %}.

## Visits and meetings
 * Mathis Bode visited ANL in April 2023 to coordinate better on the visualization strategies.

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

{% bibliography --file external/pipeline.bib %}
