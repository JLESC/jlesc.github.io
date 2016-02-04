---
layout: page_project
title: Scalability Enhancements to FMM for Molecular Dynamics Simulations
subtitle:
date: 01/01/2016
update:
navbar: Projects
subnavbar:
footer: true
logo:
project_url:
short_desc:
---
<!---
Questions/requests:

* we need a naming convention for the project_template...

* what is "update" and "subnavbar"?

* why do we need a date? If it's just the date of creation/change, this should
not be changed by the author of this page. also: how do I know what format the
date is required?

* we need meta-data here, in particular the particiants/members of the project

* how do I link to the people in the directory when I write text? The same will
be important for affiliations and references.

* probably remove "short_desc" in favor of other data like members and/or
affiliations
 
-->

### Participants

  * Pavan Balaji (ANL)
  * Ivo Kabadshow (JSC)
  * David Haensel (JSC)

### Research topic and goals
The goal of this joint-lab cooperation covers the topic of parallel programming. We are especially interested in increasing the scalability (strong scaling) of the Fast Multipole Method (FMM) for very large numbers of ranks. FMSolvr is a high-performance FMM library being developed by JSC. However, the current intrinsic parallel scaling limitations stem from process synchronization on large-scale systems. We will investigate weak and delayed synchronization models, tasking approaches and other techniques with MPI-3 and upcoming MPI-4 extensions to alleviate some of these performance bottlenecks.

### Results for 2014/2015
The project was initiated at the JLESC meeting in November 2014. To provide a consistent interface for measuring and tuning parallel code performance some profound changes had to be made to the code. We started implementing an abstract parallelization layer for the FMSolvr library. This includes a threading approach for intra-node communication as well as a parallelization approach for inter-node communication via MPI. The adopted abstraction layer allows easier re- placement/improvement of different synchronization strategies within the code.

Since this is a starting cooperation no project publications are available at the moment.

### Visits and meetings
Since this is a starting cooperation no visits have been initiated. The upcoming JLESC meeting at BSC will be used as a first project meeting.

### Impact and publications
none yet.

### Person-Month efforts in 2014/2015
Since December 2014:

  * Pavan Balaji (ANL): 0.1 PM
  * Ivo Kabadshow, (JSC): 0.1 PM
  * David Haensel, (JSC): 1 PM

The efforts are likely to increase, once the code base includes a near-complete parallelization layer.

### Future plans
Next, we want to setup an automatic testing framework for the FMM. This allows us to investigate the scaling bottlenecks of the method without the need to provide a real-world MD dataset. The framework will generate the corresponding input data as well as the required FMM parameter on the fly. After this step is finished an extensive scaling analysis on different HPC platforms will be performed. The results of this analysis are the foundation of all subsequent tuning efforts.

### References
none yet.
