---
layout: post
title: A common workflow registry of compute endpoints and applications
date: 2020-07-02
updated: 2024-01-12
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - prog_lang
keywords:
  -
head: katz_d
members:
  - badia_r
  - chard_k
  - ejarque_j
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

There is now a large and ever-growing number of workflow systems, and we have lost hope in
encouraging users not to continue developing more. Instead, we want to focus on building
shared elements that can help us with our own systems, as well as the users of those systems
and the developers of applications that will increasingly be used as workflow elements in
simulation, analysis, search, optimization, and parameter study research campaigns.

As discussed briefly at JLESC 9 (in ST A1.1. Python-based Workflows & Software Sustainability),
two of the common types of elements that workflow systems interact with are the end computing
systems and the preexisting applications that the workflows wrap and call. Today, users of a
workflow system have to find information about both the end points and the applications, they
have to map that information to workflow-specific configuration formats, individually customize
their workflow to use these configurations, and keep up with changes over time. Instead, we
propose a registry of compute end points and applications, where an entry could be automatically
brought in to a workflow system.

This requires a pair of components:

1. The registry itself and a means for adding and editing entries, potentially along with curation,
or perhaps community curated, using WikiData

2. A means to use entries for a given workflow system

Registry entries could be added by three different groups:

1. Compute resource providers could enter their systems, and application developers could enter their
applications

2. Workflow system providers could enter systems and applications that they support, or we could collect
published configurations and map them to our common schema

3. Workflow developers could enter system and applications that they and their workflow users need


## Results for 2020--2022

The BSC team, in the context of the eFLows4HPC project, has developed an extension of the PyCOMPSs programming model to allow the integration of 3rd party software execution within a PyCOMPSs workflow with a simple JSON description. This integration is done with a new python decorator which is located on top of a python function which represent the 3rd party software invation, as indicated below.
```
@software (config_file=software_description.json)
def external_software(params):
  pass
```
The software_description.json can be stored locally or retrieved from a repository and provides a description of how the software is executed, If it is a multicore binary execution, mpi application, service invocation, etc. This description is processed by the PyCOMPSs runtime which replaces the method call by the application executed indicated in the description. A code example can be found in this [link](https://github.com/bsc-wdc/compss/blob/stable/tests/sources/local/python/1_decorator_software/src/modules/testSoftwareDecorator.py)

In collaboration with the ECP ExaWorks project, we have contributed to the definition
and development of PSI/J, a common Python library for managing asynchronous execution
of jobs on schedulers.
We contributed to the [specification](https://exaworks.org/job-api-spec/specification.html)
and the [Python library](https://github.com/ExaWorks/psi-j-python).
The evolving implementation currently supports Slurm, Cobalt, Flux, and LSF.

We have also worked with the Science Gateways Community Institute to provide feedback on
the [SGCI Resource Inventory](https://sgci-resource-inventory.readthedocs.io/en/latest/).
This initiative shares similar goals to our work in the NSF community. The inventory
includes a JSON schema and a GitHub-based flow for cataloging systems.

We've also been involved in spinning up the [Workflows Community Initiative](https://workflows.community),
which is another part to build buy-in for this work.

## Visits and meetings


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

### Contributions:

1. A prototype of the registry itself and a means for adding and editing entries,
potentially along with curation, or perhaps community curated, using WikiData

2. Methods to use registry entries in Parsl and PyCOMPs

### Timeline:

The initial work that proposed is

1. defining the schema for the registry, and implementing it as a REST service
2. building some test elements, and entering them manually
3. building software for Parsl and PyCOMPs to import and use registry entries

We originally planed to do this initial work in the summer of 2020, but due to COVID-19 disruptions, we are now planning to focus initially
on defining the registration schema and collecting resource documents in a GitHub repository during 2020.
In early 2021, we will get some experience with using them in an ad hoc fashion.  With the help of students we will develop the REST API
and integrate with Parsl over summer 2021.
Also in 2021, the use of the registry will be considered within the EU eFlows4HPC project and its integration with PyCOMPSs.
After these initial activities, we will evaluate progress and decide on next steps, which likely include a publication and bringing in additional workflow systems.


### Computer resource needs:
Very few – no testing needs to be done at large scale, though we will need access
to a few HPC systems to test mechanisms for their use

### Expected results:

* Paper describing the prototype
*	The prototype registry
*	Initial methods added to Parsl and PyCOMPs to use the registry


## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/workflow-endpoint-registry.bib %}
