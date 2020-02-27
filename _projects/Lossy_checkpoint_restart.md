---
layout: page_project
title: Checkpoint/Restart of/from lossy state
date: 2016-03-25
updated:
navbar: Research
subnavbar: Projects
project_url:
status: running
topics:  
  - resilience
keywords:
head: cappello_f
members:
  - olson_l
  - calhoun_j
  - snir_m
---

## Research topic and goals

State compression is an important technique for reducing the problem posed by the bandwidth plateauing of the HDD-based storage systems. 

The state saved by HPC executions in checkpoints is composed mostly of floating-point data (single or double precision). Two types of compressors have been developed for floating-point data. Lossless compressors keep all the initial information and try to reduce the size occupied by this information. Sophisticated lossless compression techniques may use entropy coding, runlengh encoding, dictionary coding for example {% cite LindstromETAl2006 --file external/Lossy_checkpoint_restart.bib %}, {% cite IbteshamETAl2012 --file external/Lossy_checkpoint_restart.bib %}. 
The compression factor generally observed on scientific datasets with lossless compression is 1.2 to 2 (the compressed data set is 1.2 to 2 times smaller than the original). Lossy compressors deliberately lose information in order to reduce the size of the initial data set further. Lossy compressors reach very variable compression ratios depending on the application and the error bounds set by the users. This could be from less than 10 for difficult-to-compress data sets (lossless compressors would achieve a compression ratio of 1.5 to 2 on some extreme cases) to 100 for easier-to-compress data sets. Lossy compressors can be error bounded or not. Lossy compressors that are not error bounded simply compress the data set as much as they can, with no guarantee on the error on each decompressed data. Their applicability is limited in HPC because users have expectations in terms of accuracy. Error bounded lossy compressors provide different error controls such as absolute error and relative error bounds. Some compressors also provide stratistical bounds. For example, SZ provides PSNR bound (lower). The user has a guarantee of a maximum loss of information quantified by the maximum compression/decompression errors. Users will set the error bound to match their accuracy expectations. Note that all lossy compressors keep all data points of the initial data set (none of the lossy compressors drop data points).

Few studies have been done on checkpointing and restart from lossy compressed states {% cite SasakiETAl2015 --file external/Lossy_checkpoint_restart.bib %}. 
These studies are limited in scope by studying only one application and one type of lossy compressor: NICAM with a lossy compressor based on wavelet and quantization {% cite SasakiETAl2015 --file external/Lossy_checkpoint_restart.bib %} and ChaNGa with fpzip used as a lossy compressor {% cite NiETAl2014 --file external/Lossy_checkpoint_restart.bib %}. 
They already reveal two interesting points. First, checkpoints are composed of different variables that present different sensitivity to lossy compression. The correctness of the execution after restart depends on how each variable is compressed. In the cosmology simulation (ChaNGa), lossy compression of particle positions lead the execution to hang for a high compression level, while this does not happen when compressing other variable at the same level. Second, for the study of NICAM, the authors consider that an error of 1 percent on the final result is acceptable when restarting from lossy checkpoints. The rationale is that this magnitude of error is similar to those of sensor errors and model errors, while the compression factor exceeds 5. 

In contrary to previous research that concentrated on few applications, we focus on simple problems used by many applications and try to understand how they behave. We are exploring diffusion and advection problems. The diffusion problem simulates the heat diffusion on a one-dimensional rod. The advection problem simulates a sine wave advecting to the right with periodic boundaries. 

## Results for 2015/2016

From our observations of restart from lossy checkpoints in dynamic simulations, we have observed that diffusion and advection problems are reacting differently. We are currently characterizing and formalizing this difference. We suspect that lossyness may be increased as the execution progresses: restarting from a lossy checkpoint near the beginning of the execution seems to affect much more the end results compared with restarting from a lossy checkpoint near the end of the execution. Moreover, we note that in a given variable field, some regions of the field are more chaotic than others. Some applications may not tolerate lossy compression on the entire field. But we suspect that they may tolerate lossy compression in the nonchaotic regions of the variable field. 

## Results for 2016/2017

We particularly explored an important problem: how to bound the impact of  restarting from lossy checkpoint and guarantee that this impact does not affect the application result quality. To address this problem, we established a link between the compression error and the numerical error of the application. Applications using numerical methods suffer errors from truncation and discretization. We showed that compressing checkpoint with an error lower than the numerical errors allow to reserve the quality of the application results. We also demonstrated empirically that the error introduced by restarting from lossy checkpoint can be bounded.    

Other researchers will be able to exploit the link we established between the compression error and the numerical errors to design better compression algorithms and numerical methods that tolerate better compression errors.

An important impact of this work on other disciplines that are using numerical simulation is that they can use lossy compression for checkpoint/restart since we established and verified guidance to fix the compression error that guarantee the quality of the numerical results.

Jon Calhoun wrote a Ph. D. manuscript and defended a Ph. D. dissertation presenting this research/results.

## Results for 2017/2018

The paper submitted to IJHPCA on the results of this research has been accepted for publication.

## Results for 2019/2020

Two graduate students of Jon Calhoun (Robert Underwood and Tasmia Reza) spent time at Argonne. The results of their internships produced two publications. Tasmia's paper is published at DRBSD'19. Robert's paper is published at IPDPS'20.

## Visits and meetings

Franck Cappello visits UIUC almost every week. We have a 30 minutes to 1 hour meeting almost each time.
Jon Calhoun did an internship of 11 weeks at ANL.

## Impact and publications

This research continues at Argonne National Laboratory focusing on restart from lossy checkpointing for iterative numerical methods in linear algebra and a paper has been submitted to a top ACM conference.

The results of this project motivated the submission of the [NSF Aletheia project](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1617488&HistoricalAwards=false) that has been awarded and is funded for 3 years.

Funded by the NSF Aletheia project, a Ph. D. student (Wang Chen) at UIUC is exploring how to detect corruption in lossy compressed results (e.g. checkpoints) of numerical simulations.  

See {% cite Calhoun18 --file jlesc.bib %} and {% cite Calhoun17 --file jlesc.bib %}
{% bibliography --cited --file jlesc.bib %}

## Future plans

We still need to make a formal link between the numerical and compression errors.

## References
{% bibliography --file external/Lossy_checkpoint_restart.bib %}
