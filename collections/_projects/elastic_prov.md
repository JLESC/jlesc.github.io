---
layout: post
title: Elastic provisioning for data streams
date: 2016-05-30
updated: 2016-05-30
navbar: Research
subnavbar: Projects
project_url:
status: suspended
topics:
  - architectures
  - storage
keywords:
  - cloud computing
head: keahey_k
members:
  - antoniu_g
  - pineda_morales_l
  - subramaniam_b
  - costan_a
---

## Research topic and goals

Dynamic data streams produced by sensing and experimental devices as well as social networks, give scientists an unprecedented opportunity to explore a variety of environmental and social phenomena. One of the main challenges is that such streams and their computation requirements are volatile: sensors or social networks may generate data at highly variable rates, or processing time in an application may significantly change from one stage to the next one. Cloud computing is a promising platform allowing us to cope with such volatility because it enables to allocate computational resources on demand, for short periods of time, and at an acceptable cost. At the same time using clouds for this purpose is challenging because an application may yield a very different performance depending on the hosting infrastructure, requiring us to pay special attention to how and where we schedule resources. In our research, we first aim at characterizing the implications of using different instance offers of Chameleon cloud to run similar applications. Then, our goal is to identify key features of applications handling dynamic data streams. Base on such features, we will produce statistical models that allow us to predict an application's computing needs and elastically provision (and de-provision) the required resources.

## Results for 2015/2016

We carried out a set of experiments using an application relying on input from social networks, notably geo-located tweets, to discover correlation between users' work and home locations. In order to assess the impact of running the same application in offerings from different providers, we executed the various stages of our use case application in two flavors of Chameleon cloud instances, namely bare-metal and KVM. Also, we analyzed specific configuration parameters, such as data block size, replication factor and parallel processing, towards statistically modeling the application performance in a given infrastructure. Finally, we looked into the gains brought by accounting for data proximity when scheduling a resource in a multi-site environment. A poster depicting the results of our research was presented at Supercomputing 2015 {% cite PinedaEtAl2015 --file jlesc.bib %}.


## Visits and meetings

{% person pineda_morales_l %} was hosted for a Summer internship at Argonne National Laboratory from May to August 2015.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Future plans

Next steps include experimenting with Phantom auto-scaling service {% cite KeaheyEtAl2012 --file external/elastic_prov.bib %} in the Chameleon cloud to elastically provision resources for our use case application.


## References

{% bibliography --file external/elastic_prov.bib %}
