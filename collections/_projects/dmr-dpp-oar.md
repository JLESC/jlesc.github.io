---
layout: post
title: A Comprehensive Software Stack for Dynamic Resources Management.
date: 2024-06-08
updated: 2024-06-10
navbar: Research
subnavbar: Projects
project_url:
status: starting
topics:
  - prog_lang
keywords:
  - Dynamic Resources
  - Malleability
  - Resource Management
  - MPI
head: iserte_s
members:
  - huber_d
  - schreiber_m
  - dutot_p
  - ricard_o
  - pena_a
---

## Research topic and goals

Dynamic Resource Management (DRM) allows for dynamic changes of the resources assigned to a job during its execution. DRM has gained considerable interest over the last years as it could provide many benefits to providers of HPC systems and their users, such as improving energy efficiency and throughput.

However, DRM requires changes and interactions throughout the whole HPC software stack. This project aims to integrate different layers of the HPC software stack, including the OAR job and resource manager system, the Dynamic Processes with PSets (DPP) approach, and the Dynamic Management of Resources (DMR) programming interface.

OAR RJMS introduces the job envelope to support DRM. As resources are requested or freed, a new RJMS job is created and linked to the initial job envelope, replacing any previous job. This creates a sequence of jobs with different associated resources, forming a virtual global dynamic job. 

Dynamic Processes with PSets (DPP) {% cite huber2024design --file external/dmr-dpp-oar.bib %} is a set of design paradigms for generic dynamic resource support in parallel programming models deduced from prior work. The DPP design paradigms are based on a system-application co-design and aim for a flexible and programming model agnostic abstraction. As a proof-of-concept, the DPP paradigms have been realized in a prototype based on Open-MPI, OpenPMIx, and PRRTE.

The Dynamic Management of Resources (DMR) framework {% cite iserte_dmrlib_2021 --file external/dmr-dpp-oar.bib %} is a high-level API that facilitates the adoption of dynamicity in HPC codes. Particularly, DMR can abstract the use of different MPI dynamic solutions into the same syntax. In a nutshell, for instance, in an iterative code, DMR provides a series of operations around the main loop, which makes all the dynamic logic transparent to the user behind the scenes.

Once provided with the DRM framework, several scientific applications and benchmarks will be updated with the dynamic resources paradigm and evaluated regarding coding usability and reconfiguration performance.

This project aims to:
<ul>
<li>Integration of DPP and DMR in OAR.</li>
<li>Provide a friendly programming layer for the DRM software stack.</li>
<li>Create a collection of dynamic applications with a common interface.</li>
<li>Evaluate coding usability and performance of the new dynamic resources management approach compared to the current state-of-the-art.</li>
</ul>

## Results for 2024/2025

- The integration of DMR and DPP has been improved as part of a collaboration between UGA and BSC.
- We plan to work on the common API during this term.

## Visits and meetings

- May - July 2024: Dominiks - research stay at UGA.
- February 2025: Sergio - research stay at UGA.

## Funding

- Sergio Iserte from BSC received the BSC's Severo Ochoa Mobility Grant for his 1 month stay at UGA.
- Martin Schreiber received travel support from Inria to attend JLESC meetings.

## Impact and publications

{% cite tarraf_malleability_2024 --file external/dmr-dpp-oar.bib %}
{% cite dutot_leveraging_2024 --file external/dmr-dpp-oar.bib %}

## Future plans

None yet.

## References

{% bibliography --file external/dmr-dpp-oar.bib %}
