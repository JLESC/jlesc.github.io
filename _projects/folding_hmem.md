---
layout: page_project
title: Study the use of the Folding hardware-based profiler to assist on data distribution for heterogeneous memory systems in HPC
date: 2016-03-22
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - perf_tools
keywords:
  -
head: pena_a
members:
  - pena_a
  - servat_h
  - gimenez_j
  - labarta_j
  - balaji_p
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

  head             (optional)
                   the dedicated project leader;
                   this is the identifier of a person as found in '_data/people.yml'

  members          (optional)
                   a YAML list of members of this project, i.e. the people doing the work;
                   each member must be listed as its identifier as found in '_data/people.yml'

Now, fill in the details for the current report below. Please do not change headings, headings level
or order.
Read the comments carefully!

{% endcomment %}

## Research topic and goals
We are extending the research on data distribution and partitioning for heterogeneous memory systems started at Argonne {% cite PenaBalaji2014 --file external/folding_hmem %}. This approach is based on an emulator-based data-oriented profiler (now named EVOP) {% cite PenaBalaji2014b --file external/folding_hmem %}. However, the profiling stage is time-consuming. We are evaluating the possibility of adapting and using the profiling tool "Folding" from BSC for this purpose {% cite ServatEtAl2015 --file external/folding_hmem %}. Since it is based on hardware counters, it seems clear that the profiling time will be greatly reduced. Given the lossy nature of profilers based on hardware counters, however, it is interesting to determine if this solution provides sufficient resolution for the subsequent stage to generate a well-optimized data distribution.

## Results for 2015/2016
So far we have:
  - Modified the Extrae profiler to generate EVOP-like reports with PEBS data.
  - Developed a mechanism to compare the results.
  - Performed early profiling performance and quality of object distribution evaluation.
We have noticed that our distributions from EVOP and Extrae data do not always match. This may be attributed to a combination of two factors: data loss, but also different cache behaviors (in EVOP the cache is simulated after the queried system cache properties).

## Visits and meetings
Frequent teleconferences and e-mail exchanges. No planned visits yet. Antonio J. Peña moved from Argonne to BSC.

## Impact and publications
We are writing a paper and seeking further funding.

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


## Person-Month efforts in 2015/2016

{% comment %}
=========================================
== ADD A TABLE OF PERSON-MONTH EFFORTS ==

Put it in the following form, each person on its own line

| {% person PERSON_ID %} | X.Y PM |

e.g.:

| {% person kabadshow_i %} | 2.0 PM |

Above the very first person put the following line:

{:.person-months-table.table.table-bordered.table-hover.table-sm}

==================================
== START HERE ==
{% endcomment %}
{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person pena_a %} | 1.0 PM |
| {% person servat_h %} | 1.0 PM |
| {% person ginemez_j %} | 0.5 PM |
| {% person labarta_j %} | 0.5 PM |
| {% person balaji_p %} | 0.5 PM |

## Future plans
Validate the sampling technique for data distribution by implementing and evaluating sampling on EVOP.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/folding_hmem.bib %}
