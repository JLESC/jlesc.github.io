---
layout: page_project
title: Energy Efficiency and Load Balancing
date: 2016-02-17
updated:
navbar: Research
subnavbar: Projects
footer: true
project_url:
status: running
topics:
  - prog_lang
keywords:
  -
head: keller_tesser_r
members:
  - padoin_e
  - navaux_p
  - mendes_c
  - kale_s
  - mehaut_j
---

## Research topic and goals

The power consumption of High Performance Computing (HPC) systems is an increasing concern
as large-scale systems grow in size and, consequently, consume more energy.
In response to this challenge, we propose new energy-aware load balancers that aim at reducing the
energy consumption of parallel platforms running imbalanced scientific applications without degrading
their performance.
Our research explores dynamic load balancing, low power manycore platforms and DVFS techniques in
order to reduce power consumption.

## Results for 2015/2016

### Load Balancing

In this work we propose the improvement of the performance and scalability of parallel seismic
wave models through dynamic load balancing.
These models suffer from load imbalance for two reasons.
First, they add a specific numerical condition at the borders of the domain, in order to
absorb the outgoing energy.
The decomposition of the domain into a grid of subdomains, which are distributed among tasks, creates
load differences between the tasks that simulate the borders and those responsible for the central subdomains.
Second, the propagation of waves in the simulated area changes the workload on the subdomains on different time-steps.
Therefore causing dynamic load imbalance.
In order to evaluate the use of dynamic load balancing, we ported a seismic wave simulator to Adaptive MPI,
to benefit from its load balancing framework. Our experimental results
show that dynamic load balancers can adapt to load variations during the application’s execution
and improve performance by 36%.
This work was presented in the PDP 2014 conference {% cite KellerTesserEtAl2014 --file jlesc.bib %}.
An extended version will be published in the International Journal of High Performance Computing and Applications
{% cite KellerTesserEtAl2014a --file jlesc.bib %}
Laercio Pilla described most of the load balancers in his PhD {% cite Pilla2014 --file external/eandb_project.bib %}.

### Power consumption

Power consumption is one of the main challenges to achieve Exascale performance.
Current research trends aim at overcoming power consumption constraints using low-power processors.
Although new processors feature sensors that enable precise power measurements, they provide
different interfaces to collect data, making it difficult to correlate performance with energy consumption.
To overcome this issue, we developed a platform-independent tool that collects power
and energy data from homogeneous and heterogeneous systems.
Using this tool, it provides a detailed comparison between a low-power processor (ARM big.LITTLE) and a high performance
processor (Intel Sandy Bridge-EP) using all applications from the NAS parallel benchmarks and
a real-world soil irrigation simulator.
The results show that the average power demand of Intel Sandy Bridge-EP is within 12.6X to 152.4X higher than ARM big.
LITTLE, whereas its average energy consumption is within 1.6X to 7.1x superior.
Overall, ARM big.LITTLE presented a better performance/energy trade-off when it takes less than 9.2X the execution
time of Intel Sandy Bridge-EP to solve the same problem.
This work was published in {% cite PadoinEtAl2015 --file external/eandb_project.bib %} and {% cite FrancesquiniEtAl2015 --file external/eandb_project.bib %}.  
Large-scale simulation of seismic wave propagation is an active research topic.
Its high demand for processing power makes it a good match for High Performance Computing (HPC).
Although we have observed a steady increase on the processing capabilities of HPC platforms, their energy
efficiency is still lacking behind.
In this work, we analyze the use of a low-power manycore processor, the MPPA-256, for seismic wave propagation simulations.
First we look at its peculiar characteristics such as limited amount of on-chip memory and describe the intricate solution we
brought forth to deal with this processor’s idiosyn- crasies.
Next, we compare the performance and energy efficiency of seismic wave propagation on MPPA-256 to other common- place
platforms such as general-purpose processors and a GPU.
Finally, we wrap up with the conclusion that, even if MPPA-256 presents an increased software development complexity,
it can indeed be used as an energy efficient alternative to current HPC platforms, resulting in up to 71% and 81% less energy
than a GPU and a general-purpose processor, respectively.  
This work was presented at the SBAC PAD conference in Paris {% cite CastroEtAl2014 --file external/eandb_project.bib %}.

### Load Balancing and Power Saving

In this work, we focus on reducing the energy consumption of imbalanced applications through a
combination of load balancing and Dynamic Voltage and Frequency Scaling (DVFS).
Our strategy employs an Energy Daemon Tool to gather power information and a load balancing module
that benefits from the load balancing framework available in the CHARM++ runtime system.
We propose two variants of our energy-aware load balancer (ENERGYLB) to save energy on imbalanced
workloads without considerably impacting the overall system performance.
The first one, called Fine- Grained EnergyLB (FG-ENERGYLB), is suitable for plat- forms composed of few
tens of cores that allow per-core DVFS.
The second one, called Coarse-Grained EnergyLB (CGENERGLB) is suitable for current HPC platforms composed of several
multi-core processors that feature per-chip DVFS.  
This work was presented at the HiPC conference {% cite PadoinEtAl2014 --file external/eandb_project.bib %}.

## Visits and meetings

* Edson Padoin, November 2014, JLESC Workshop, Chicago
* Jean-Francois Mehaut, November Z014, JLESC Workshop, Chicago
* Brice Videau, June 2015, JLESC Workshop, Barcelona
* Jean-Francois Mehaut, June 2015, JLESC Workshop, Barcelona

## Impact and publications


{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person keller_tesser_r %}    | 6 PM |
| {% person padoin_e %} | 4 PM |
| {% person navaux_p %}   | 1 PM   |
| {% person mendes_c %} | 0.5 PM |
| {% person kale_s %}   | 0.25 PM   |
| {% person mehaut_j %}   | 1 PM   |


## Future plans

* Using simulations (SimGrid, BigSim, Dimemas) for the design and analysis of load balancers
    (Rafael Tesser, Philippe Navaux, Arnaud Legrand, Celso Mendes)
* Load Balancing and heterogenous platforms/processors (Victor Martinez, Fabrice Dupros/BRGM,
    Philippe Navaux, Jean-Francois Mehaut)

## References

{% bibliography --file external/eandb_project.bib %}
