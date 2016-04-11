---
layout: page_project
title: Optimization of Fault-Tolerance Strategies for Workflow Applications
date: 2016-03-16
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - resilience
keywords:
  -
head: benoit_a
members:
  - cappello_f
  - robert_y
  - cavelan_a
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

  topics           (optional)
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

In this project, we aim at finding efficient fault-tolerant scheduling schemes 
for workflow applications that can be expressed as a directed acyclic graph (DAG) 
of tasks. A task can be checkpointed and/or replicated, so that if a single replica fails,
no recovery is needed. 

We propose a model of process replication for tasks, and a theoretical analysis allowing us
to decide when to checkpoint/replicate a task. 


## Results for 2015/2016
None yet.

## Visits and meetings

{% person cavelan_a %} is visiting {% person cappello_f %} in Chicago for three months (march-april-may 2016) to initiate this project. We are working in close collaboration to make progress.


## Impact and publications

None yet.

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

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person benoit_a %} | 1.0 PM |
| {% person cappello_f %} | 1.0 PM |
| {% person robert_y %} | 1.0 PM |
| {% person cavelan_a %} | 3.0 PM |


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

## Future plans

None yet.


## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/ft_workflow_project.bib %}
