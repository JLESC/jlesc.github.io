---
layout: page_project
title: Toward Interoperability between Chameleon and Grid'5000 experimentation platforms
date: 2017-06-07
updated: 
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:
  - architectures
keywords:
  - Experimentation platforms
  - Chameleon
  - Grid'5000
head: keahey_k
members:
  - loup_d
  - delamare_s
  - perez_c
---

## Research topic and goals
The aim of this project is to develop building blocks toward interoperability between Chameleon (ANL) and
Grid'5000 (Inria) experimentation platforms.

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

Overall the project is a step forward better usability for users of both
testbeds, but also for their managers to share experience and best practices.

## Results for 2016/2017
To enable images portability between Chameleon and Grid'5000 platforms (first project's goal), two tools have been produced:

* [g5k2CC](https://github.com/dloup/g5k2CC): Convert Grid'5000 image to Chameleon
* [CC2G5K](https://github.com/dloup/CC2G5K): Convert Chameleon image to Grid'5000

When a user converts a Grid'5000 image to a Chameleon image, the image format is first converted from Grid'5000 to Chameleon ones. Then the configuration needed to run on Chameleon infrastructure is added (e.g., cloud-init is installed with Chameleon configuration file). This adds virtual machine contextualization ability from Chameleon backend.

The second goal of the project is to study Openstack deployment tool that would work over both Chameleon and Grid'5000.
Chameleon's current solution is based on DevStack. Grid'5000 has two different solutions: [Enos](https://enos.readthedocs.io/en/latest/) which is based on OpenStack's [Kolla](https://wiki.openstack.org/wiki/Kolla) containers and [xp5k-openstack](https://github.com/grid5000/xp5k-openstack) which uses Puppet recipes also provided by OpenStack. As Chameleon solution is longer to deploy, our goal was to try porting a tool used in Grid'5000. Enos team already started porting Enos on Chameleon, so we focused on the other solution, so they can be compared later.

Based on what is done on Grid'5000 with Puppet, we wrote a Heat template to deploy Openstack on Chameleon with a custom number of compute nodes. Once given this template, the Heat orchestrator will install the operating system and software on nodes, bootstrap a puppet server on one of the nodes and Puppet agents on the others to execute Puppet recipes that will install and configure an OpenStack controller and several compute nodes. The overall deployment time is approximately 20 minutes. A [document](https://docs.google.com/spreadsheets/d/1emHefWvhkO7BJwQkvXLgaIKJ64NxCLnbtajoOqrpXBk/edit?usp=sharing) is available to compare the performances of the different solutions showing that Puppet-based method is faster than the DevStack one, but it might also be harder to maintain. A second [document](https://docs.google.com/document/d/1PwgjST8I7xgeer75_0Xk7AQwlmpNGKvoBhEYYn4IhFI/edit?usp=sharing) was written to give more details about how the different solutions work.

The repository that contains the Heat templates to use on Chameleon to run Openstack Liberty using the Puppet approach is available at [https://github.com/dloup/CC_Openstack](https://github.com/dloup/CC_Openstack)


## Visits and meetings
David Loup was at Argonne National Laboratory from 3rd March to 20th April 2017 to work on this project.

## Impact and publications
This project has proposed tools for operating system image portability between Chameleon and Grid'5000 and a new (faster) method to deploy an Openstack infrastructure on Chameleon.
This makes it easier for users to deploy the same environment on Grid'5000 and Chameleon testbeds, easing experiments involving both platforms.

## Future plans
The results of this project should be compared to Enos performance.
Depending on the performance and ease to use of each solution, the official "supported" way to deploy Openstack on Chameleon will be either Devstack, Puppet, or Enos.
It is likely that Chameleon and Grid'5000 will converge to the same solution, reducing maintenance costs for both platforms and easing cross experimentation for their users

## References
{% bibliography --file external/interop_chameleon_g5k.bib %}
