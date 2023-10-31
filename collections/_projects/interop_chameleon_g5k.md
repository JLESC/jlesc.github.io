---
layout: post
title: Advancing Chameleon and Grid'5000 testbeds
date: 2017-06-07
updated: 2019-01-01
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - architectures
keywords:
  - Testbeds
  - Experimentation platforms
  - Chameleon
  - Grid'5000
head: keahey_k
members:
  - loup_d
  - lebre_a
  - simonin_m
  - cherrueau_r_a
  - pertin_d
  - riteau_p
  - delamare_s
  - nussbaum_l
  - perez_c
---

## Research topic and goals
The aim of this project is to improve Chameleon (ANL) and
Grid'5000 (Inria) testbeds, in particular with respect to interoperability and interconnection.

Chameleon and Grid'5000 testbeds have proven their relevance to conduct
experiments involving large scale distributed computing systems. However, those
platforms does not share much for experiments design and setup, and it
is difficult for their users to move from one platform to another or to
perform cross-platform deployment.

This project tries to improve this situation by developing bridges between
each platform. First, it will extend existing software used in each testbed to
enable portability of operating system images between them: users
will be able to deploy their Chameleon appliances on Grid'5000 nodes and
vice versa. As a second step, the project will explore existing solutions for
efficient deployment of an Openstack-based Cloud, that would work on both
Chameleon and Grid'5000. A document presenting challenges to address to
overcome the differences between these platforms will also be produced.
We will also test an advanced tool for conducting scientific evaluations of OpenStack.

Overall the project is a step forward better usability for users of both
testbeds, but also for their managers to share experience and best practices.

## Results for 2016/2017

### Image portability between Chamelon and Grid'5000

To enable images portability between Chameleon and Grid'5000 platforms (first project's goal), two tools have been produced:

* [g5k2CC](https://github.com/dloup/g5k2CC): Convert Grid'5000 image to Chameleon
* [CC2G5K](https://github.com/dloup/CC2G5K): Convert Chameleon image to Grid'5000

When a user converts a Grid'5000 image to a Chameleon image, the image format is first converted from Grid'5000 to Chameleon ones. Then the configuration needed to run on Chameleon infrastructure is added (e.g., cloud-init is installed with Chameleon configuration file). This adds virtual machine contextualization ability from Chameleon backend.

### A first step toward the deployment of OpenStack on Chameleon and Grid'5000

The second goal of the project is to study Openstack deployment tool that would work over both Chameleon and Grid'5000.
Chameleon's current solution is based on DevStack. Grid'5000 has two different solutions: [Enos](https://enos.readthedocs.io/en/latest/) which is based on OpenStack's [Kolla](https://wiki.openstack.org/wiki/Kolla) containers and [xp5k-openstack](https://github.com/grid5000/xp5k-openstack) which uses Puppet recipes also provided by OpenStack. As Chameleon solution is longer to deploy, our goal was to try porting a tool used in Grid'5000. Enos team already started porting Enos on Chameleon, so we focused on the other solution, so they can be compared later.

Based on what is done on Grid'5000 with Puppet, we wrote a Heat template to deploy Openstack on Chameleon with a custom number of compute nodes. Once given this template, the Heat orchestrator will install the operating system and software on nodes, bootstrap a puppet server on one of the nodes and Puppet agents on the others to execute Puppet recipes that will install and configure an OpenStack controller and several compute nodes. The overall deployment time is approximately 20 minutes. A [document](https://docs.google.com/spreadsheets/d/1emHefWvhkO7BJwQkvXLgaIKJ64NxCLnbtajoOqrpXBk/edit?usp=sharing) is available to compare the performances of the different solutions showing that Puppet-based method is faster than the DevStack one, but it might also be harder to maintain. A second [document](https://docs.google.com/document/d/1PwgjST8I7xgeer75_0Xk7AQwlmpNGKvoBhEYYn4IhFI/edit?usp=sharing) was written to give more details about how the different solutions work.

The repository that contains the Heat templates to use on Chameleon to run Openstack Liberty using the Puppet approach is available at [https://github.com/dloup/CC_Openstack](https://github.com/dloup/CC_Openstack)

## Results for 2017/2018

### Toward a Holistic Framework for Conducting Scientific Evaluations of OpenStack

OpenStack has become the de-facto solution to operate compute, network and storage resources in public and private clouds. However, developers and scientists are facing challenges when it comes to deploy and benchmark such a complex software stack.
To address this problem, we developed Enos, an integrated framework that relies on container technologies for deploying and evaluating OpenStack on any testbed. Enos allows researchers to easily express different configurations, enabling fine-grained investigations of OpenStack services. Enos collects performance metrics at runtime and stores them for post-mortem analysis and sharing.
The relevance of the [Enos](http://enos.readthedocs.io/en/stable/) approach to reproducible research was illustrated by evaluating different OpenStack scenarios on the Grid'5000 testbed in 2016 as published at CCGRID {% cite CCGRID17Enos --file external/interop_chameleon_g5k.bib %} and also presented at the [OpenStack summit in Barcelona](https://www.openstack.org/summit/barcelona-2016/summit-schedule/events/15977/chasing-1000-nodes-scale).

Building on this success, in 2017, we extended the Enos framework to achieve performance experiments while doing traffic shaping.
Our goal was to offer the opportunity to researchers to evaluate the impact of WAN communications on OpenStack.
Latency is  a critical requirement for Internet Of Things and NFV/SDN applications that favors a more distributed Cloud Computing model deployed at the Edge.
This model does not cope with the traditional vision that has been driving the development of OpenStack. Although some efforts such as multiple regions, federations, ... may allow operators to administrate these new infrastructures, there are no studies that evaluate how OpenStack will behave in such a massively distributed context.
To illustrate the interest of such extensions, we conducted additional experiments over the Grid’5000 and the Chameleon testbed as shown at the [Boston OpenStack summit](https://www.openstack.org/summit/boston-2017/summit-schedule/events/17952/toward-fog-edge-and-nfv-deployments-evaluating-openstack-wanwide). The port of Enos on top of Chameleon consisted in [developing a new provider](http://enos.readthedocs.io/en/stable/provider/index.html) as presented in the Sydney OpenStack summit.

## Results for 2018/2019

Lucas Nussbaum (Université de Lorraine, France) and Kate Keahey (University of Chicago, USA) partnered on the organization of two sessions at the third Global Experimentation for Future Internet [(GEFI 2018)](http://indico.rnp.br/conferenceDisplay.py?confId=260) workshop that was held October 25-26, 2018 in Tokyo, Japan and hosted by the University of Tokyo. The objective of this workshops was to create a forum for the exchange of information and best practices among an international community of developers and operators of testbeds and related research infrastructure, as well as the researchers who make use of these facilities. Historically, these interactions were highly effective in building successful collaborations and coordinating activities among participating research infrastructures and this was thus a good forum to continue, and in some cases, broaden our collaboration.

The sessions focused on current topics in both testbeds: (1) modern networking technologies, a central concern when performing experiments in the distributed systems context, and (2) reproducibility in experimentation (together with Violet Syrotiuk).  The sessions led to the discussion of current topics. Specifically, for networking the discussion focused on programmability and isolation, emulation technologies, as well as emergent use cases such interactions with IoT, and support for Big Data/AI scenarios. For reproducibility, the discussions focused on tools and services, data management practices, and lessons learned.

The workshop produced a report co-authored by the participants {% cite BermanEtAl --file jlesc.bib %} that is currently in the process of preparation for a publication on current topics in testbed design.

## Visits and meetings
David Loup was at Argonne National Laboratory from 3rd March to 20th April 2017 to work on this project.

## Impact and publications
This project has proposed tools for operating system image portability between Chameleon and Grid'5000 and a new (faster) method to deploy an Openstack infrastructure on Chameleon, in particular with the [Enos](https://github.com/BeyondTheClouds/enos) framework.
This makes it easier for users to deploy the same environment on Grid'5000 and Chameleon testbeds, easing experiments involving both platforms.
The joint presentation at Boston OpenStack summit is avaible [online](https://www.openstack.org/summit/boston-2017/summit-schedule/events/17952/toward-fog-edge-and-nfv-deployments-evaluating-openstack-wanwide).

{% bibliography --cited --file jlesc.bib %}

## Future plans

A remaining challenge is the data-plane federation of both testbeds, to enable experiments spanning both testbeds in a
controlled networking environment. We will explore how to achieve that by interconnecting both testbeds to Internet Software Defined eXchange
points (SDX), which would allow us to provide on-demand Level-2 link stitching, to provide per-experiment overlays.

## References
{% bibliography --file external/interop_chameleon_g5k.bib %}
