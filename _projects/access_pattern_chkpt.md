---
layout: page_project
title: Optimizing Checkpoint Restart Through Access Pattern Awareness
date: 2022-09-22
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics: 
  - resilience
keywords:
  - checkpoint restart
head: taufer_m
members: 
  - tan_n
  - nicolae_b
  - cappello_f
  - luettgau_j
  - roachell_b
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
Checkpoint restart is a common resilience strategy used by many applications. Limited I/O bandwidth combined with frequent large checkpoints by multiple processes makes checkpointing difficult at scale. The heterogeneity and complexity of the storage hierarchy further increases the challenge of making efficient checkpoints. Naively writing checkpoints to the parallel filesystem incurs unacceptable overheads but is still frequently done by developers unaware of the storage hierarchy or unable to leverage the complex storage tiers efficiently. The challenges have led to checkpoint runtimes such as VeloC that take advantage of the various storage tiers to provide scalable asynchronous checkpoints. We combine VeloC with the Kokkos performance portability framework to enable a performance portable resilience runtime. 

This project will improve checkpoint restart scalability and performance by leveraging information about the memory access patterns of an application at runtime. Memory access patterns describe how the application updates its data over time. We use the information to reduce checkpoint sizes, increase checkpoint frequency, and ultimately alleviate pressure on the I/O system. One example is sparse update patterns where the application updates very little data between checkpoints. Checkpointing the entire piece of sparsely updated data is inefficient. A better strategy is to make an incremental checkpoint that only saves the sparse updates. Sparse update patterns occur frequently in graph applications such as graph alignment. The project explores different hash-based techniques for efficiently identifying differences between checkpoints. Objectives include analyzing the checkpoint size and runtime tradeoffs of the different techniques on both CPU and GPU platforms. Graph alignment is only one of the applications considered in this project; other applications and access patterns will be selected among those of interest to the JLESC community.

## Results for 2021/2022
We devised a framework for providing portable efficient checkpoint restart capabilities for Kokkos applications. The portability abstractions of Kokkos are combined with the scalable checkpoint restart runtime VeloC in order to allow Kokkos applications to add resilience capabilities with very little developer effort. We further enhance this by developing memory access pattern aware checkpointing. We can use the Kokkos Resilience intermediary layer to analyze applications and identify common memory access patterns. Using this knowledge the runtime can then guide VeloC to make more efficient checkpoints.

We identified a common memory access pattern and strategy for improving checkpoint restart. Sparse update patterns are common in graph algorithms. Using a graph alignment code developed at UTK as a use case, we used hash based incremental checkpointing techniques to drastically reduce checkpoint size.

We implemented two hash based incremental checkpointing algorithms that operate efficiently on both CPUs and GPUs. One algorithm uses a simple hash list and is used for comparison. Our second algorithm uses Merkle trees to reduce the cost of comparisons between the current and prior states of the data. Analysis shows that both algorithms dramatically reduce checkpoint size and cost relative to the cost of a full checkpoint. 

<!--
{% comment %}
## Results for 2022/2023
We developed an improved incremental checkpoint algorithm using Merkle tree data structures to create a compact representation of the metadata used to map chunks of data to their correct positions in the memory region. 

We identified several tradeoffs and algorithmic decisions that affect the checkpoint size as well as the runtime overhead for both checkpointing and restarting. 
{% endcomment %}
-->

## Visits and meetings
 * Nigel Tan spent the summer of 2022 at ANL working on the project

## Impact and publications
 * Talk: 13th Joint Laboratory for Extreme Scale Computing (JLESC) Workshop, 2021. Short Talk: Towards Access Pattern Aware Checkpointing for Kokkos Applications
 * Talk: SIAM Parallel Processing 22 Conference, 2022. Towards Access Pattern Aware Checkpointing For Kokkos Applications

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
We will continue to improve our incremental checkpoint restart algorithm to better take advantage of available memory access pattern information. Runtime checkpoint performance analysis will be added in order to dynamically guide the checkpoint deduplication process. Other test applications and access patterns will be identified and used to improve checkpoint performance for a variety of applications relevant to the community.

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/YOUR_BIBTEX_FILE_NAME_HERE %}
