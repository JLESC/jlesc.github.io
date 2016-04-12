---
layout: page_project
title: Checkpoint/Restart of/from lossy state
date: 2016-03-25
updated:
navbar: Research
subnavbar: Projects
project_url:
status: starting
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

The state saved by HPC executions in checkpoints is composed mostly of floating-point data (single or double precision). Two types of compressors have been developed for floating-point data. Lossless compressors keep all the initial information and try to reduce the size occupied by this information. Sophisticated lossless compression techniques may use entropy analysis, duplicate string elimination, or bit reduction, for example {% cite LindstromETAl2006 --file external/Lossy_checkpoint_restart.bib %}, {% cite IbteshamETAl2012 --file external/Lossy_checkpoint_restart.bib %}. 
The compression factor generally observed with lossless compression is 1.2 to 4 (the compressed data set is 1.2 to 4 times smaller than the original). Lossy compressors deliberately lose information in order to reduce the size of the initial data set further. Lossy compressors reach very variable compression ratios depending on the application. This could be from 3 to 4 for difficult-to-compress data sets (lossless compressors would achieve a compression ratio of 1.5 to 2 on those data sets) to x100 for easier-to-compress data sets. Lossy compressors can be error bounded or not. Lossy compressors that are not error bounded simply compress the data set as much as they can, with no guarantee on the error on each decompressed data. Their applicability is limited in HPC because users have expectations in terms of accuracy. Error bounded lossy compressors allow users to set a maximum (or relative) compression/decompression error. The maximum error is the maximum of the difference between any initial data in the data set and its decompressed version (from its lossy compressed version). The user has a guarantee of a maximum loss of information quantified by the maximum compression/decompression errors. Users will set the maximum error to match their accuracy expectations. Note that all lossy compressors keep all data points of the initial data set (none of the lossy compressors drop data points).

Few studies have been done on checkpointing and restart from lossy compressed states {% cite SasakiETAl2015 --file external/Lossy_checkpoint_restart.bib %}. 
These studies are limited in scope by studying only one application and one type of lossy compressor: NICAM with a lossy compressor based on wavelet and quantization [Sas15] and ChaNGa with the fpzip lossy compressor {% cite NiETAl2014 --file external/Lossy_checkpoint_restart.bib %}. 
They already reveal two interesting points/First, checkpoints are composed of different variables that present different sensitivity to lossy compression. The correctness of the execution after restart depends on how each variable is compressed. In the cosmology simulation (ChaNGa), lossy compression of particle positions lead the execution to hang for a high compression level, while this does not happen when compressing other variable at the same level. Second, for the study of NICAM, the authors consider that an error of 1 percent on the final result is acceptable when restarting from lossy checkpoints. The rationale is that this magnitude of error is similar to those of sensor errors and model errors, while the compression factor exceeds 5. 

In contrary to previous research that concentrated on few applications, we focus on simple problems used by many applications and try to understand how they behave. We are exploring diffusion and advection problems. The diffusion problem simulates the heat diffusion on a one-dimensional rod. The advection problem simulates a sine wave advecting to the right with periodic boundaries. 

## Results for 2015/2016

From our observations of restart from lossy checkpoints in dynamic simulations, we have observed that diffusion and advection problems are reacting differently. We are currently characterizing and formalizing this difference. We suspect that lossyness may be increased as the execution progresses: restarting from a lossy checkpoint near the beginning of the execution seems to affect much more the end results compared with restarting from a lossy checkpoint near the end of the execution. Moreover, we note that in a given variable field, some regions of the field are more chaotic than others. Some applications may not tolerate lossy compression on the entire field. But we suspect that they may tolerate lossy compression in the nonchaotic regions of the variable field. 

## Visits and meetings

Franck Cappello visits UIUC almost every week. We have a 30 minutes-1hour meeting almost each time.

## Impact and publications

{% bibliography --cited --file jlesc.bib %}


## Person-Month efforts in 2015/2016

{:.person-months-table.table.table-bordered.table-hover.table-sm}
| {% person cappello_f %} | 1 PM |
| {% person olson_l %} | 1 PM |
| {% person calhoun_j %} | 3 PM |

## Future plans

Jon Calhoun will spend the summer at ANL with Franck Cappello for an internship.
A paper is in preparation for a submission in a conference with a deadline in the 1/2 half of 2016.

## References
{% bibliography --file external/Lossy_checkpoint_restart.bib %}
