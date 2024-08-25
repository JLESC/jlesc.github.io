---
layout: post
title: Towards Continual Learning at Scale
date: 2022-05-07
updated: 2024-01-26
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - architectures
keywords:
  - continual learning
  - rehearsal buffer
  - catastrophic forgetting
head: nicolae_b
members:
  - bouvier_t
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

During the past decade, Deep learning (DL) supported the shift from rule-based systems towards statistical models. Deep Neural Networks (DNNs) revolutionized how we address problems in a wide range of applications by extracting patterns from complex yet labelled datasets. In the same way that more-powerful computers made it possible to design networks with vastly more neurons, ever-growing volumes of data act as a driving force for advancements in this field. Bigger models and larger centralized datasets demand for distributed strategies to leverage multiple compute nodes.

Most existing supervised learning algorithms operate under the assumptions that the data is (1) independent and identically distributed (i.i.d.); and (2) available before the training process. However, these constraints stand in the way of many real-life scenarios where the aforementioned datasets are replaced by high volume, high velocity data streams generated over time by distributed (sometimes geographically) devices. It is unfeasible to keep training the models in an offline fashion from scratch every time new data arrives, as this would lead to prohibitive time and/or resource constraints. Also, typical DNNs suffer from catastrophic forgetting in this context, a phenomenon causing them to reinforce new patterns at the expense of previously acquired knowledge (i.e., a bias towards new samples). Some authors have shown that memory replay methods are effective in mitigating accuracy degradation in such settings. However, their performance is still far from that of oracles with full access to the static dataset. The problem of Continual Learning (CL) remains an open research question.

Existing research typically addresses distributed DL and CL separately. At INRIA, we are interested in how CL methods can take advantage of data parallelization across nodes, which is one of the main techniques to achieve training scalability on HPC systems. The aggregated memory could benefit the accuracy achieved by such algorithms by instantiating distributed replay buffers. The main research goals of this project are the (1) design and implementation of a distributed replay buffer leveraging distributed systems effectively and the (2) study of trade-offs introduced by large-scale CL in terms of training time, accuracy and memory usage.

## Results for 2021/2022

We kicked off this project in December 2021. We are studying techniques based on rehearsal (augment mini-batches with representative samples previously encountered during training) to address the aforementioned challenges. The key novelty is how to adopt rehearsal in the context of data-parallel training, which is one of the main techniques to achieve training scalability on HPC systems. In this sense, the goal is to design and implement a distributed rehearsal buffer that handles the selection of representative samples and the augmentation of mini-batches asynchronously in the background.

Our first series of experiments focuses on evaluating the performance and scalability of our proposal for classification problems. We run extensive experiments on up to 128 GPUs of ANL's ThetaGPU supercomputer to compare our approach with baselines representative of training-from-scratch (the upper bound in terms of accuracy) and incremental training (the lower bound) {% cite bouvierEtAl2024 --file jlesc.bib %}.

## Results for 2023/2024

With a growing diversity of rehearsal techniques, it becomes important to decouple the rehearsal buffer from the learning task, such that it becomes a generic, reusable abstraction that can store additional state information as needed by more advanced rehearsal-based CL algorithms. To this end, we propose a generalization of rehearsal buffers to support both classification and generative learning tasks, as well as more advanced rehearsal strategies (notably Dark Experience Replay, leveraging knowledge distillation). We illustrate this approach with a real-life HPC streaming application from the domain of ptychographic image reconstruction, leveraging data acquired at ANL's Advanced Photon Source (APS) {% cite bouvierEtAl2024b --file jlesc.bib %}.

## Visits and meetings

We schedule regular video meetings between the different members of the project.

{% person bouvier_t %} visited ANL in the context of a 3-month appointment during summer 2022.

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

- Apply rehearsal-based CL to LLM training, by integrating the distributed rehearsal buffer into training runtimes like DeepSpeed.
- Use the distributed rehearsal buffer as a retriever for Retrieval Augmented Generation (RAG).

## References

{% comment %}
=================
=== IMPORTANT ===
=================

Replace 'YOUR_BIBTEX_FILE_NAME_HERE' with the name of the BibTeX file with the external references!
{% endcomment %}

{% bibliography --file external/continual_learning_project.bib %}
