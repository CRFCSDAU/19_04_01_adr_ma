---
title: ''
author: ''
date: ''
output: 
  html_document:
    df_print: paged
    keep_md: true
  word_document:
    reference_docx: style.1.docx
---




# Queries

The reviewers also had some requests regarding further analyses they would like included (see below for details), and some questions that I need to seek your clarification on:

**1.	"what software and version was used to conduct themeta-analysis?" - I presume this was R but am aware I never actually asked.**

2.	"is it not customary to conduct analyses to take out one study at a time to identify if any one study was highly influential? please provide this information" - was this the case with the prior analysis, and if so what impact / if any was there? If not, can we do this?

**3.	"it would be helpful to see a funnel plot and eggers test to examine publication bias" - I am unsure how to run/conduct same, could you assist here (please let me know if you require further information).**

**4.	"It would be most helpful to see forest plots for severity and preventability using random effects model"**

**5.	Questioning regarding impact  of hospital setting on ADR proportions**

I have attached a new Excel file for your attention. Each tab contains the data for each analysis.

**1.	Overall pooled ADR proportions for all included studies**

**2.	Subgroup analysis for studies where all participants were >65years - forest plot for this group and query any statistical significance between this group and overall pooled proportion (analysis #1).**

**3.	Subgroup analysis for grouped ADR definitions - forest plot for each grouping and query and staistical significance between each group and overall pooled proportion(analysis #1).**

**4.	Subgroup analysis for grouped ADR causality tools - forest plot for each grouping and query and staistical significance between each group and overall pooled proportion (analysis #1).**

**5.	Subgroup analysis grouped by overlapping ADR methodology - forest plot for each grouping and query and staistical significance between each group and overall pooled proportion (analysis #1).**

**6.	New subgroup analysis -  grouped by ADR identification method - forest plot for each grouping and query any statistical significance between each group and overall pooled proportion (analysis #1).**

**7.	New subgroup analysis - pooled proportions for ADR preventability based on studies reporting preventability**

**8.	New subgroup analysis - pooled proportions for ADR severity based on studies reporting severity** 

**9.	New subgroup analysis - based on reviewer comment querying impact on risk of bias - forest plot for high quality studies and query any statistical significance between each group and overall pooled proportion (analysis #1).**

**10.	New subgroup analysis - based on reviewer comment querying impact of NOS domain "demonstration that outcome of interest was not present at start of study" - forest plots for groupings that did and did not demonstarte this and query any statistical significance between each grouping and overall pooled proportion (analysis #1).**

**11.	New subgroup analysis - based on reviewer comment querying impact of ward setting on ADR proportions - forest plots for each ward grouping and query any statistical significance between each grouping and overall pooled proportion (analysis #1).** 



# ADRs

## Overall model



*1. "what software and version was used to conduct themeta-analysis?" - I presume this was R but am aware I never actually asked.*

All analysis were conducted using the R Language for Statistical Programming (REF1).  

REF1: R Core Team (2020). R: A language and environment for statistical computing. R Foundation for Statistical Computing, Vienna, Austria. URL https://www.R-project.org/.

Meta-analysis models and plots were produced using the metafor package (REF2).

REF2: Viechtbauer, W. (2010). Conducting meta-analyses in R with the metafor package. Journal of Statistical Software, 36(3), 1-48. URL: https://www.jstatsoft.org/v36/i03/

For meta-analysis models we used a generalized linear mixed effects model for logit transformed proportions (i.e. metafor::rms.glmm(measure = "PLO")). 

*1.	Overall pooled ADR proportions for all included studies except Liao*

Binomial-normal random effects model (coefficients on the log-odds scale). 

```
## 
## Random-Effects Model (k = 26; tau^2 estimator: ML)
## 
## tau^2 (estimated amount of total heterogeneity): 0.8585
## tau (square root of estimated tau^2 value):      0.9266
## I^2 (total heterogeneity / total variability):   98.4160%
## H^2 (total variability / sampling variability):  63.1312
## 
## Tests for Heterogeneity:
## Wld(df = 25) = 1277.8768, p-val < .0001
## LRT(df = 25) = 1498.3058, p-val < .0001
## 
## Model Results:
## 
## estimate      se     zval    pval    ci.lb    ci.ub 
##  -1.6592  0.1861  -8.9138  <.0001  -2.0241  -1.2944  *** 
## 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

Results on the probability scale. This is the mean ADR proportion, the 95% CI of that estimate, and a 95% prediction interval (the very wide interval)


```
## 
##    pred  ci.lb  ci.ub  cr.lb  cr.ub 
##  0.1599 0.1167 0.2151 0.0290 0.5481
```


Figure 1. 

![](update_files/figure-html/fig_1-1.png)<!-- -->



Binomial-normal random effects model, with Liao (coefficients on the log-odds scale). 

```
## 
## Random-Effects Model (k = 27; tau^2 estimator: ML)
## 
## tau^2 (estimated amount of total heterogeneity): 1.2838
## tau (square root of estimated tau^2 value):      1.1331
## I^2 (total heterogeneity / total variability):   99.1469%
## H^2 (total variability / sampling variability):  117.2263
## 
## Tests for Heterogeneity:
## Wld(df = 26) = 6854.9243, p-val < .0001
## LRT(df = 26) = 7904.2253, p-val < .0001
## 
## Model Results:
## 
## estimate      se     zval    pval    ci.lb    ci.ub 
##  -1.7965  0.2216  -8.1053  <.0001  -2.2310  -1.3621  *** 
## 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```
## 
##    pred  ci.lb  ci.ub  cr.lb  cr.ub 
##  0.1423 0.0970 0.2039 0.0170 0.6145
```

![](update_files/figure-html/fig_2-1.png)<!-- -->




Binomial-normal fixed effects model, with Liao (coefficients on the log-odds scale). 

```
## 
## Fixed-Effects Model (k = 27)
## 
## Tests for Heterogeneity:
## Wld(df = 26) = 6854.9243, p-val < .0001
## LRT(df = 26) = 7904.2253, p-val < .0001
## 
## Model Results:
## 
## estimate      se       zval    pval    ci.lb    ci.ub 
##  -3.6856  0.0180  -204.2772  <.0001  -3.7210  -3.6503  *** 
## 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```
## 
##    pred  ci.lb  ci.ub 
##  0.0245 0.0236 0.0253
```

## Funnel plot

*3.	"it would be helpful to see a funnel plot and eggers test to examine publication bias" - I am unsure how to run/conduct same, could you assist here (please let me know if you require further information).*

### Without Liao
![](update_files/figure-html/unnamed-chunk-5-1.png)<!-- -->

### With Liao

![](update_files/figure-html/unnamed-chunk-6-1.png)<!-- -->

## Influence

![](update_files/figure-html/unnamed-chunk-7-1.png)<!-- -->
4 = Cheong (2018)
12 = Giardina (2018)
23 = Onder (2010)


```
## 
##    estimate    zval  pval ci.lb ci.ub        Q    Qp  tau2     I2     H2 
## 1     0.167  -8.438 0.000 0.121 0.225 1273.542 0.000 0.870 98.492 66.309 
## 2     0.158  -8.708 0.000 0.114 0.215 1228.850 0.000 0.879 98.457 64.821 
## 3     0.160  -8.566 0.000 0.115 0.218 1275.527 0.000 0.896 98.534 68.194 
## 4     0.150 -10.596 0.000 0.113 0.196 1066.445 0.000 0.627 97.887 47.335 
## 5     0.159  -8.594 0.000 0.114 0.217 1190.604 0.000 0.893 98.367 61.234 
## 6     0.164  -8.374 0.000 0.118 0.223 1272.939 0.000 0.898 98.499 66.627 
## 7     0.161  -8.452 0.000 0.116 0.220 1259.183 0.000 0.906 98.325 59.702 
## 8     0.164  -8.407 0.000 0.118 0.223 1277.368 0.000 0.899 98.536 68.311 
## 9     0.169  -8.516 0.000 0.124 0.227 1262.344 0.000 0.831 98.420 63.273 
## 10    0.168  -8.455 0.000 0.122 0.226 1264.054 0.000 0.852 98.454 64.682 
## 11    0.165  -8.389 0.000 0.120 0.224 1272.956 0.000 0.886 98.510 67.111 
## 12    0.173  -8.813 0.000 0.129 0.229  941.909 0.000 0.742 98.126 53.372 
## 13    0.157  -8.796 0.000 0.114 0.213 1252.662 0.000 0.867 98.472 65.466 
## 14    0.171  -8.686 0.000 0.126 0.227 1266.920 0.000 0.793 98.352 60.671 
## 15    0.158  -8.727 0.000 0.114 0.214 1211.473 0.000 0.876 98.439 64.058 
## 16    0.162  -8.409 0.000 0.117 0.221 1277.795 0.000 0.906 98.504 66.863 
## 17    0.160  -8.517 0.000 0.115 0.218 1254.712 0.000 0.901 98.454 64.692 
## 18    0.161  -8.463 0.000 0.116 0.219 1271.864 0.000 0.905 98.490 66.208 
## 19    0.160  -8.541 0.000 0.115 0.218 1268.650 0.000 0.899 98.515 67.322 
## 20    0.155  -9.055 0.000 0.113 0.210 1246.010 0.000 0.831 98.414 63.044 
## 21    0.160  -8.506 0.000 0.115 0.218 1267.109 0.000 0.902 98.497 66.549 
## 22    0.159  -8.625 0.000 0.114 0.216 1225.292 0.000 0.889 98.443 64.206 
## 23    0.168  -8.421 0.000 0.122 0.226  885.258 0.000 0.858 98.119 53.160 
## 24    0.160  -8.501 0.000 0.115 0.219 1267.775 0.000 0.903 98.498 66.570 
## 25    0.165  -8.373 0.000 0.119 0.224 1271.008 0.000 0.895 98.497 66.535 
## 26    0.164  -8.373 0.000 0.118 0.223 1270.401 0.000 0.901 98.439 64.045
```


## Moderators

### Age

*2. Subgroup analysis for studies where all participants were >65years - forest plot for this group and query any statistical significance between this group and overall pooled proportion (analysis #1).*

Studies that only recruited those aged 65+ vs those that recruited other ages too. 
<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["ADR_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"All ages","2":"14","3":"0.14","4":"0.09","5":"0.21","6":"0.02","7":"0.5","8":"NA","_row":"All ages"},{"1":"65+ only","2":"12","3":"0.19","4":"0.12","5":"0.28","6":"0.04","7":"0.6","8":"0.299","_row":"65+ only"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>



![](update_files/figure-html/forest_sub_age-1.png)<!-- -->



### ADR definition

*3.	Subgroup analysis for grouped ADR definitions - forest plot for each grouping and query and staistical significance between each group and overall pooled proportion(analysis #1).*

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["ADR_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"WHO","2":"15","3":"0.14","4":"0.09","5":"0.20","6":"0.03","7":"0.49","8":"NA","_row":"WHO"},{"1":"Not documented","2":"3","3":"0.23","4":"0.10","5":"0.45","6":"0.04","7":"0.69","8":"NA","_row":"Not documented"},{"1":"Local policy","2":"1","3":"0.30","4":"0.07","5":"0.71","6":"0.03","7":"0.83","8":"NA","_row":"Local policy"},{"1":"Edwards and Aronson","2":"4","3":"0.17","4":"0.08","5":"0.33","6":"0.03","7":"0.59","8":"NA","_row":"Edwards and Aronson"},{"1":"Bates","2":"1","3":"0.12","4":"0.02","5":"0.46","6":"0.01","7":"0.63","8":"NA","_row":"Bates"},{"1":"Author defined","2":"2","3":"0.19","4":"0.06","5":"0.46","6":"0.03","7":"0.67","8":"0.806","_row":"Author defined"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>



![](update_files/figure-html/forest_sub_adr-1.png)<!-- -->

### Causality

*4.	Subgroup analysis for grouped ADR causality tools - forest plot for each grouping and query and staistical significance between each group and overall pooled proportion (analysis #1).*

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["ADR_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"WHO-UMC","2":"6","3":"0.22","4":"0.12","5":"0.37","6":"0.04","7":"0.66","8":"NA","_row":"WHO-UMC"},{"1":"Not documented","2":"3","3":"0.15","4":"0.06","5":"0.33","6":"0.02","7":"0.57","8":"NA","_row":"Not documented"},{"1":"Naranjo","2":"15","3":"0.14","4":"0.09","5":"0.21","6":"0.03","7":"0.51","8":"NA","_row":"Naranjo"},{"1":"Kramer","2":"1","3":"0.19","4":"0.04","5":"0.58","6":"0.02","7":"0.74","8":"NA","_row":"Kramer"},{"1":"Hallas","2":"1","3":"0.12","4":"0.02","5":"0.45","6":"0.01","7":"0.63","8":"0.78","_row":"Hallas"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>


![](update_files/figure-html/forest_sub_causality-1.png)<!-- -->


### Overlapping methods

*5.	Subgroup analysis grouped by overlapping ADR methodology - forest plot for each grouping and query and staistical significance between each group and overall pooled proportion (analysis #1).*

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["ADR_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"WHO & WHO-UMC","2":"5","3":"0.22","4":"0.10","5":"0.40","6":"0.03","7":"0.70","8":"NA","_row":"WHO & WHO-UMC"},{"1":"WHO & Naranjo","2":"8","3":"0.10","4":"0.05","5":"0.18","6":"0.01","7":"0.47","8":"NA","_row":"WHO & Naranjo"},{"1":"Edwards Aronson & Naranjo","2":"2","3":"0.17","4":"0.05","5":"0.45","6":"0.02","7":"0.69","8":"NA","_row":"Edwards Aronson & Naranjo"},{"1":"Not documented & Naranjo","2":"2","3":"0.21","4":"0.06","5":"0.52","6":"0.02","7":"0.75","8":"0.383","_row":"Not documented & Naranjo"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>


![](update_files/figure-html/forest_sub_overlapping-1.png)<!-- -->


### ADR identified by

*6.	New subgroup analysis -  grouped by ADR identification method - forest plot for each grouping and query any statistical significance between each group and overall pooled proportion (analysis #1).*

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["ADR_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"Pharmacist","2":"10","3":"0.15","4":"0.09","5":"0.23","6":"0.03","7":"0.50","8":"NA","_row":"Pharmacist"},{"1":"Physican","2":"7","3":"0.16","4":"0.09","5":"0.26","6":"0.03","7":"0.54","8":"NA","_row":"Physican"},{"1":"Not documented","2":"5","3":"0.26","4":"0.14","5":"0.44","6":"0.05","7":"0.70","8":"NA","_row":"Not documented"},{"1":"Multi-disciplinary","2":"4","3":"0.11","4":"0.05","5":"0.23","6":"0.02","7":"0.45","8":"0.31","_row":"Multi-disciplinary"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>



![](update_files/figure-html/forest_sub_id_method-1.png)<!-- -->


### Quality (RoB)

*9.	New subgroup analysis - based on reviewer comment querying impact on risk of bias - forest plot for high quality studies and query any statistical significance between each group and overall pooled proportion (analysis #1).*

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["ADR_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"Low","2":"15","3":"0.11","4":"0.08","5":"0.16","6":"0.02","7":"0.40","8":"NA","_row":"Low"},{"1":"High","2":"9","3":"0.26","4":"0.17","5":"0.38","6":"0.06","7":"0.66","8":"0.003","_row":"High"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>





![](update_files/figure-html/unnamed-chunk-15-1.png)<!-- -->


### Incident

*10.	New subgroup analysis - based on reviewer comment querying impact of NOS domain "demonstration that outcome of interest was not present at start of study" - forest plots for groupings that did and did not demonstarte this and query any statistical significance between each grouping and overall pooled proportion (analysis #1).* 

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["ADR_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"Not clearly incident","2":"11","3":"0.22","4":"0.14","5":"0.32","6":"0.04","7":"0.63","8":"NA","_row":"Not clearly incident"},{"1":"Clearly incident","2":"13","3":"0.12","4":"0.08","5":"0.18","6":"0.02","7":"0.45","8":"0.052","_row":"Clearly incident"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>




![](update_files/figure-html/forest_sub_incident-1.png)<!-- -->

### Setting

*11.	New subgroup analysis - based on reviewer comment querying impact of ward setting on ADR proportions - forest plots for each ward grouping and query any statistical significance between each grouping and overall pooled proportion (analysis #1).*

*5.	Questioning regarding impact  of hospital setting on ADR proportions*


<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["ADR_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"Cardiology","2":"2","3":"0.31","4":"0.13","5":"0.57","6":"0.07","7":"0.74","8":"NA","_row":"Cardiology"},{"1":"Dermatology","2":"3","3":"0.06","4":"0.03","5":"0.15","6":"0.01","7":"0.28","8":"NA","_row":"Dermatology"},{"1":"Geriatric","2":"5","3":"0.25","4":"0.15","5":"0.39","6":"0.06","7":"0.63","8":"NA","_row":"Geriatric"},{"1":"GIM","2":"4","3":"0.20","4":"0.10","5":"0.35","6":"0.05","7":"0.57","8":"NA","_row":"GIM"},{"1":"ICU","2":"1","3":"0.07","4":"0.01","5":"0.28","6":"0.01","7":"0.41","8":"NA","_row":"ICU"},{"1":"Mixed","2":"8","3":"0.15","4":"0.09","5":"0.23","6":"0.04","7":"0.46","8":"NA","_row":"Mixed"},{"1":"Not described","2":"3","3":"0.12","4":"0.05","5":"0.24","6":"0.02","7":"0.42","8":"0.051","_row":"Not described"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>




![](update_files/figure-html/forest_sub_setting-1.png)<!-- -->

### Meta-regression with incident, quality, and setting. 


```
## 
## Mixed-Effects Model (k = 24; tau^2 estimator: ML)
## 
## tau^2 (estimated amount of residual heterogeneity):     0.4951
## tau (square root of estimated tau^2 value):             0.7036
## I^2 (residual heterogeneity / unaccounted variability): 96.6429%
## H^2 (unaccounted variability / sampling variability):   29.7878
## 
## Tests for Residual Heterogeneity:
## Wld(df = 15) = 631.2378, p-val < .0001
## LRT(df = 15) = 768.1940, p-val < .0001
## 
## Test of Moderators (coefficients 2:9):
## QM(df = 8) = 18.9709, p-val = 0.0150
## 
## Model Results:
## 
##                           estimate      se     zval    pval    ci.lb    ci.ub 
## intrcpt                    -1.5648  0.6433  -2.4324  0.0150  -2.8257  -0.3039 
## settingDermatology         -1.1907  0.8222  -1.4481  0.1476  -2.8023   0.4209 
## settingGeriatric            0.0429  0.6327   0.0678  0.9460  -1.1973   1.2830 
## settingGIM                 -0.0960  0.6909  -0.1390  0.8895  -1.4501   1.2580 
## settingICU                 -1.0406  1.0340  -1.0063  0.3143  -3.0672   0.9861 
## settingMixed               -0.3216  0.7242  -0.4441  0.6569  -1.7409   1.0977 
## settingNot described       -0.2977  0.8585  -0.3468  0.7287  -1.9803   1.3848 
## qualityHigh                 0.7664  0.3785   2.0249  0.0429   0.0246   1.5083 
## incidentClearly incident   -0.1801  0.4157  -0.4331  0.6649  -0.9949   0.6348 
##  
## intrcpt                   * 
## settingDermatology 
## settingGeriatric 
## settingGIM 
## settingICU 
## settingMixed 
## settingNot described 
## qualityHigh               * 
## incidentClearly incident 
## 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

# Severity

*4.	"It would be most helpful to see forest plots for severity and preventability using random effects model"*

*8.	New subgroup analysis - pooled proportions for ADR severity based on studies reporting severity *

# Overall model




Binomial-normal random effects model (coefficients on the log-odds scale). 

```
## 
## Random-Effects Model (k = 13; tau^2 estimator: ML)
## 
## tau^2 (estimated amount of total heterogeneity): 0.6846
## tau (square root of estimated tau^2 value):      0.8274
## I^2 (total heterogeneity / total variability):   94.8465%
## H^2 (total variability / sampling variability):  19.4044
## 
## Tests for Heterogeneity:
## Wld(df = 12) = 219.5195, p-val < .0001
## LRT(df = 12) = 258.2922, p-val < .0001
## 
## Model Results:
## 
## estimate      se    zval    pval   ci.lb   ci.ub 
##   0.5613  0.2446  2.2946  0.0218  0.0819  1.0407  * 
## 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```
## 
##    pred  ci.lb  ci.ub  cr.lb  cr.ub 
##  0.6367 0.5205 0.7390 0.2442 0.9048
```

![](update_files/figure-html/fig_3-1.png)<!-- -->


## Moderators

### Age


```
## 
## Mixed-Effects Model (k = 13; tau^2 estimator: ML)
## 
## tau^2 (estimated amount of residual heterogeneity):     0.6222
## tau (square root of estimated tau^2 value):             0.7888
## I^2 (residual heterogeneity / unaccounted variability): 93.7735%
## H^2 (unaccounted variability / sampling variability):   16.0604
## 
## Tests for Residual Heterogeneity:
## Wld(df = 11) = 147.0018, p-val < .0001
## LRT(df = 11) = 172.0117, p-val < .0001
## 
## Test of Moderators (coefficient 2):
## QM(df = 1) = 1.0727, p-val = 0.3003
## 
## Model Results:
## 
##          estimate      se     zval    pval    ci.lb   ci.ub 
## intrcpt    1.4079  0.8527   1.6511  0.0987  -0.2633  3.0792  . 
## mods      -0.5120  0.4943  -1.0357  0.3003  -1.4808  0.4569    
## 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["Severity_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"All ages","2":"5","3":"0.71","4":"0.53","5":"0.84","6":"0.30","7":"0.93","8":"NA","_row":"All ages"},{"1":"65+ only","2":"8","3":"0.59","4":"0.45","5":"0.72","6":"0.22","7":"0.88","8":"0.3","_row":"65+ only"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

### Tool


```
## 
## Mixed-Effects Model (k = 13; tau^2 estimator: ML)
## 
## tau^2 (estimated amount of residual heterogeneity):     0.6717
## tau (square root of estimated tau^2 value):             0.8196
## I^2 (residual heterogeneity / unaccounted variability): 94.1938%
## H^2 (unaccounted variability / sampling variability):   17.2230
## 
## Tests for Residual Heterogeneity:
## Wld(df = 11) = 216.7034, p-val < .0001
## LRT(df = 11) = 251.3082, p-val < .0001
## 
## Test of Moderators (coefficient 2):
## QM(df = 1) = 0.4541, p-val = 0.5004
## 
## Model Results:
## 
##          estimate      se    zval    pval    ci.lb   ci.ub 
## intrcpt    0.2670  0.4982  0.5360  0.5920  -0.7095  1.2435    
## mods       0.1020  0.1514  0.6739  0.5004  -0.1947  0.3987    
## 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["Severity_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"Author defined","2":"4","3":"0.59","4":"0.41","5":"0.75","6":"0.20","7":"0.89","8":"NA","_row":"Author defined"},{"1":"Hallas","2":"1","3":"0.62","4":"0.48","5":"0.73","6":"0.23","7":"0.90","8":"NA","_row":"Hallas"},{"1":"Hartwig Scale","2":"4","3":"0.64","4":"0.52","5":"0.74","6":"0.25","7":"0.90","8":"NA","_row":"Hartwig Scale"},{"1":"Hurwitz","2":"1","3":"0.66","4":"0.52","5":"0.78","6":"0.26","7":"0.92","8":"NA","_row":"Hurwitz"},{"1":"Not described","2":"2","3":"0.69","4":"0.50","5":"0.83","6":"0.27","7":"0.93","8":"NA","_row":"Not described"},{"1":"Self described clinical judgement","2":"1","3":"0.71","4":"0.46","5":"0.87","6":"0.26","7":"0.94","8":"0.5","_row":"Self described clinical judgement"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>

# Preventability

*4.	"It would be most helpful to see forest plots for severity and preventability using random effects model"*

*7.	New subgroup analysis - pooled proportions for ADR preventability based on studies reporting preventability*

# Overall model




Binomial-normal random effects model (coefficients on the log-odds scale). 

```
## 
## Random-Effects Model (k = 4; tau^2 estimator: ML)
## 
## tau^2 (estimated amount of total heterogeneity): 1.4012
## tau (square root of estimated tau^2 value):      1.1837
## I^2 (total heterogeneity / total variability):   95.5560%
## H^2 (total variability / sampling variability):  22.5022
## 
## Tests for Heterogeneity:
## Wld(df = 3) = 32.1567, p-val < .0001
## LRT(df = 3) = 70.2180, p-val < .0001
## 
## Model Results:
## 
## estimate      se    zval    pval    ci.lb   ci.ub 
##   0.9302  0.6258  1.4865  0.1372  -0.2963  2.1567    
## 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```
## 
##    pred  ci.lb  ci.ub  cr.lb  cr.ub 
##  0.7171 0.4265 0.8963 0.1552 0.9722
```

![](update_files/figure-html/fig_4-1.png)<!-- -->


## Moderators

### Age


```
## 
## Mixed-Effects Model (k = 4; tau^2 estimator: ML)
## 
## tau^2 (estimated amount of residual heterogeneity):     1.1392
## tau (square root of estimated tau^2 value):             1.0673
## I^2 (residual heterogeneity / unaccounted variability): 86.6907%
## H^2 (unaccounted variability / sampling variability):   7.5135
## 
## Tests for Residual Heterogeneity:
## Wld(df = 2) = 30.9321, p-val < .0001
## LRT(df = 2) = 52.4000, p-val < .0001
## 
## Test of Moderators (coefficient 2):
## QM(df = 1) = 0.8855, p-val = 0.3467
## 
## Model Results:
## 
##          estimate      se     zval    pval    ci.lb   ci.ub 
## intrcpt   -0.7003  1.8099  -0.3869  0.6988  -4.2476  2.8471    
## mods       1.0715  1.1387   0.9410  0.3467  -1.1603  3.3033    
## 
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["cat"],"name":[1],"type":["chr"],"align":["left"]},{"label":["n_studies"],"name":[2],"type":["S3: table"],"align":["right"]},{"label":["Preventability_proportion"],"name":[3],"type":["dbl"],"align":["right"]},{"label":["ci.lb"],"name":[4],"type":["dbl"],"align":["right"]},{"label":["ci.ub"],"name":[5],"type":["dbl"],"align":["right"]},{"label":["cr.lb"],"name":[6],"type":["dbl"],"align":["right"]},{"label":["cr.ub"],"name":[7],"type":["dbl"],"align":["right"]},{"label":["moderator_p"],"name":[8],"type":["dbl"],"align":["right"]}],"data":[{"1":"All ages","2":"2","3":"0.59","4":"0.23","5":"0.88","6":"0.09","7":"0.95","8":"NA","_row":"All ages"},{"1":"65+ only","2":"2","3":"0.81","4":"0.47","5":"0.95","6":"0.24","7":"0.98","8":"0.347","_row":"65+ only"}],"options":{"columns":{"min":{},"max":[10]},"rows":{"min":[10],"max":[10]},"pages":{}}}
  </script>
</div>







# Appendices

## Codebook
<!--html_preserve--><div class="container st-container">
<h3>Data Frame Summary</h3>
<h4>data</h4>
<strong>Dimensions</strong>: 26 x 22
  <br/><strong>Duplicates</strong>: 0
<br/>
<table class="table table-striped table-bordered st-table st-table-striped st-table-bordered st-multiline ">
  <thead>
    <tr>
      <th align="center" class="st-protect-top-border"><strong>No</strong></th>
      <th align="center" class="st-protect-top-border"><strong>Variable</strong></th>
      <th align="center" class="st-protect-top-border"><strong>Stats / Values</strong></th>
      <th align="center" class="st-protect-top-border"><strong>Freqs (% of Valid)</strong></th>
      <th align="center" class="st-protect-top-border"><strong>Graph</strong></th>
      <th align="center" class="st-protect-top-border"><strong>Valid</strong></th>
      <th align="center" class="st-protect-top-border"><strong>Missing</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1</td>
      <td align="left">author
[character]</td>
      <td align="left">1. Ganeva
2. O'Connor
3. Ayub
4. Bowman
5. Calderon-Ospina
6. Cheong
7. Conforti
8. Corsonello
9. Davies
10. Fernandez-Regueiro
[ 13 others ]</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">3</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">11.5%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">2</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.7%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">13</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">50.0%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAFcAAAESBAMAAAB6BFQ0AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAKFJREFUaN7t1MENwjAQRcGUgDuA0EHovzeQACHlgL3Cwl6Yf55DspLfsuTc+lx5s8MDny/3bTAM98KhN1haNhmu/93+dBsMwx1x6A2Wln2lG6dmfLsGDMN9cegNVuGEWGRgeCzOGBndgOGxWDdgGBaZT755kjvD8C9h3YBh+B+6EcIiA8NjccbI6AYMj8UZuxHCa8uOr9PVB8NwBIfeYLZdAcsJZ0AQoQG7AAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">2</td>
      <td align="left">year
[numeric]</td>
      <td align="left">Mean (sd) : 2009.1 (11.8)
min < med < max:
1965 < 2011.5 < 2020
IQR (CV) : 6.8 (0)</td>
      <td align="left" style="vertical-align:middle">15 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAG9JREFUaN7t2LENgDAMRcGsACOEDWD/3ejgFyCkJAWge6WLa9xYLkUtTc3VqBtbtqMVBoPBYDAYDAaDwWAw2IexOT4G/dgJbDAYDAaDwWCwH2B5LdZuLIAVNhrLVYVws8EHLEeBLdcA7N1YHVJRSzsOuORUgDFsqQAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMOSWjIEAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDCVyzQ9AAAAAElFTkSuQmCC"></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">3</td>
      <td align="left">total_n_65
[numeric]</td>
      <td align="left">Mean (sd) : 775.1 (1369.9)
min < med < max:
48 < 371 < 6419
IQR (CV) : 348 (1.8)</td>
      <td align="left" style="vertical-align:middle">24 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAGhJREFUaN7t2bENgCAQQFFW0A3EDXD/3WwUCinIYWN8v4TwcsV1pKRIubYt8S5sP+5gMBgMBoPBYDAYDAaDwWAwGAwGg8FgX8JmPo0e2MyMMNgM1ha5I6ztdgirZ6WH1QflX1h+paRIJ9LggULkaAl4AAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">4</td>
      <td align="left">adr_n_65
[numeric]</td>
      <td align="left">Mean (sd) : 95.3 (103.8)
min < med < max:
3 < 75 < 439
IQR (CV) : 92.5 (1.1)</td>
      <td align="left" style="vertical-align:middle">24 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAGRJREFUaN7t2LENgDAMRcGswAiEDcj+u9FQEAmQ+Q3Nvc7NyZI7t6akPrUuWSe2jWswGAwGg8FgMBgMBoPBYDAY7BlLX3O3WLonDAaDwWAw2M9YL1fApmkfLxMsxuoXK1xT3zoA1o/3mMio8GMAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDDkloyBAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAwlcs0PQAAAABJRU5ErkJggg=="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">5</td>
      <td align="left">no_adr_n_65
[numeric]</td>
      <td align="left">Mean (sd) : 679.8 (1289.9)
min < med < max:
37 < 276 < 5980
IQR (CV) : 319.5 (1.9)</td>
      <td align="left" style="vertical-align:middle">25 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAGdJREFUaN7t2bENgDAMAEGvABsQNiD770aDwA1S5FBQ3FeRJV+VzhGq1FJLuQvb+90Bg8FgMBgMBoPBYDAYDAaDwWAwGAwGg8GGsXS226ax59lhU9j6ck/N43EsjfPvyZu/x9onhSqdesWQYpimObkAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDDkloyBAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAwlcs0PQAAAABJRU5ErkJggg=="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">6</td>
      <td align="left">pct_adr_65
[numeric]</td>
      <td align="left">Mean (sd) : 19.4 (14.3)
min < med < max:
2.5 < 18.6 < 69.3
IQR (CV) : 14.8 (0.7)</td>
      <td align="left" style="vertical-align:middle">26 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAHFJREFUaN7t2LENgCAQQFFWgA3EDXT/3azkmotRQmLzfnW5hBcaGkrRTDWpj7b6rgdsP+9gMNhfWE+axuJgNsFgMBgMBoPBYDAYDAaDwWD/Y/ENtgAb0wGDwZZhySttsfuIjVXcscUOBoOtxvqSima6AHjZgJkXKidfAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">7</td>
      <td align="left">all
[numeric]</td>
      <td align="left">1 distinct value</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 0 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px;border:0;" align="left">:</td><td style="padding:0 4px 0 6px;margin:0;border:0" align="right">26</td><td style="padding:0;border:0" align="left">(</td><td style="padding:0 2px;margin:0;border:0" align="right">100.0%</td><td style="padding:0 4px 0 0;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAKIAAAAgCAQAAAA7g2tDAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QA/4ePzL8AAAAHdElNRQfkBgEQHiJr+ry6AAAAiUlEQVRo3u3ZMQrCMABAUSO9oKMndOwRdax1kvZD0b43JQRC+JAsGc8Le12PPsA/EDEgYmB6nzw8kF+7j2U8rZduR5/tR8yrmescEDEgYkDEgIgBEQMiBkQMiBgQMSBiQMSAiAERAyIGRAyIGBAxIGJAxICIgY/fvnnbLic3fDXv5zoHRAyIGHgBq0kF8n47YVkAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDDkloyBAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAwlcs0PQAAAABJRU5ErkJggg=="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">8</td>
      <td align="left">old_vs_new
[factor]</td>
      <td align="left">1. Previous review
2. Updated review</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">25</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">96.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJwAAAA4BAMAAAD6G4yGAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAEpJREFUWMPt1bERABAQBVEtKAEd0H9vLhAL2IjdAl5wczM/JbupQi2uDaQuJycnJ/cuB09PhvqRiysWkItHkZOTk5OT23Lw9NhZE1pHtYoDB+i2AAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">9</td>
      <td align="left">all_ages_vs_65_only
[factor]</td>
      <td align="left">1. All ages
2. 65+ only</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">14</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">53.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">12</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">46.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAF0AAAA4BAMAAABtZukZAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAD9JREFUSMdjYBj6QIlIoABVr2xMHBhVP6p+VP3gU09qfhckEggMUvVEeBVFPeHwNBpVP6p+VP0gVU9qfh/KAAASAlKKtIXKiQAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMOSWjIEAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDCVyzQ9AAAAAElFTkSuQmCC"></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">10</td>
      <td align="left">adr_def
[factor]</td>
      <td align="left">1. WHO
2. Not documented
3. Local policy
4. Edwards and Aronson
5. Bates
6. Author defined</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">15</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">57.7%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">3</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">11.5%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">4</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">15.4%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">2</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.7%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAGMAAACYBAMAAAACQEp8AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAJFJREFUWMPt18ENgCAQRFFKkA5EO9D+e5ODGuKFYRMR8M+ZlwDJsotzY2XRM59k3eVAIJBWiaH2vZ6pKrl3qpPrxjYIBPIrYngu8is/IvEUoZDEG4NAIL0TQ+2Ly7sg6YgqkmROzvULCATSKjHUvtdT/R0LhaTZlgSBQF4lI0196jfcP5qF8NmHQCANE0Ptj5IDFyVsTdj+NhIAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDDkloyBAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAwlcs0PQAAAABJRU5ErkJggg=="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">11</td>
      <td align="left">causality
[factor]</td>
      <td align="left">1. WHO-UMC
2. Not documented
3. Naranjo
4. Kramer
5. Hallas</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">6</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">23.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">3</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">11.5%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">15</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">57.7%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAGMAAACABAMAAADtxcqKAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAHhJREFUWMPt1rERgCAMhWFGgA0ENtD9d7NRC+6iMQVK+F+dr4C7PAjBV0qbnKTEg9StCQQCGY8Ydj/p05dcZ9CT88ZWCAQyFTHUxfPkR6Tos0iPhRwIBOKIGOriz9WXX5J69zOGQCBuiaEulOP9CdUHgcxJDLvvJTsFMiv54yjyHAAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMOSWjIEAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDCVyzQ9AAAAAElFTkSuQmCC"></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">12</td>
      <td align="left">overlap_methods
[factor]</td>
      <td align="left">1. WHO & WHO-UMC
2. WHO & Naranjo
3. Edwards Aronson & Naranjo
4. Not documented & Naranjo</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">5</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">29.4%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">8</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">47.1%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">2</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">11.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">2</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">11.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAFMAAABoBAMAAAB/IdFdAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAGJJREFUWMPt1EEKwCAMRFGPYG5g7Q3a+9/NTQULoUO6UeH/9VsFMintVXU7bCg/9Ly9oFCoSwO/ZbplaNWVz2O9gkKhnQZ+a/oO/JkMTfuxLigUqmngt0y3DGUyoNDpk7FLDYFFqiKx7/9JAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">17
(65.38%)</td>
      <td align="center">9
(34.62%)</td>
    </tr>
    <tr>
      <td align="center">13</td>
      <td align="left">adr_id_method
[factor]</td>
      <td align="left">1. Pharmacist
2. Physican
3. Not documented
4. Multi-disciplinary</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">10</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">38.5%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">7</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">26.9%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">5</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">19.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">4</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">15.4%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAEYAAABoBAMAAAC+ppvxAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAFxJREFUSMft07ERACAIA0BXYARlA9x/NxsbPeDoSJHUX5C7MAZeVpZrdMcxGhogU9mzZGkw3qnzM153GhpEU9kz+A+65u1uNDSwprJnydL8g5HRsDgNDZap7BkpB89zfyeiTu3FAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">14</td>
      <td align="left">quality
[factor]</td>
      <td align="left">1. Low
2. High</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">15</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">62.5%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">9</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">37.5%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAGoAAAA4BAMAAADnSXBYAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAD9JREFUSMdjYBi+QIk0ANWlbEwKMBrVNaprVNeoLjJLG0HSwJDRhc/rijh14Qv5UV2jukZ1jerCpou80mY4AgC822XaL3zmRgAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMOSWjIEAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDCVyzQ9AAAAAElFTkSuQmCC"></td>
      <td align="center">24
(92.31%)</td>
      <td align="center">2
(7.69%)</td>
    </tr>
    <tr>
      <td align="center">15</td>
      <td align="left">incident
[factor]</td>
      <td align="left">1. Not clearly incident
2. Clearly incident</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">11</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">45.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">13</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">54.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAF4AAAA4BAMAAACGUVIaAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAEFJREFUSMdjYBj6QIkgUBQEA6h6ZWNCYFT9qPpR9YNVPan5XZBYMEjVE/YvFBAdnhBgNKp+VP2o+kGnntT8PpQBAGj/Uro4JOe+AAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">24
(92.31%)</td>
      <td align="center">2
(7.69%)</td>
    </tr>
    <tr>
      <td align="center">16</td>
      <td align="left">setting
[factor]</td>
      <td align="left">1. Cardiology
2. Dermatology
3. Geriatric
4. GIM
5. ICU
6. Mixed
7. Not described</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">2</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">7.7%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">3</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">11.5%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">5</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">19.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">4</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">15.4%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">8</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">30.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">3</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">11.5%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAADsAAACwBAMAAABDfAubAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAJBJREFUWMPt19ENgCAQA1BG8DZQ3ED3301CNFE4aYh4aNL+vg9L0vvQub7xMZJm2HleQxYyuQGDrYmeNuyPFJrn5cnkegZbEz22Z3AtmD4seR6ZXM9ga2Y7V3hWapPJbzCY4rOdAw6fnAocmpPJbRhsTfRYnYGWMT/gc8jkegZbs9n57QHHfPCXifw3BlvrlQ16RdMob5triQAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMOSWjIEAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDCVyzQ9AAAAAElFTkSuQmCC"></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">17</td>
      <td align="left">id
[integer]</td>
      <td align="left">Mean (sd) : 13.8 (8)
min < med < max:
1 < 13.5 < 27
IQR (CV) : 13.5 (0.6)</td>
      <td align="left" style="vertical-align:middle">26 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAG5JREFUaN7t2cEJgDAQRcG0oB2oHZj+e/Mi5h8ExSAIzjstS5hrCClFT5qvG1pjrKfY79hSj9Y21lwnFkdgMBgM9k0s74NurJ7PMBgMBoPBYDAY7H9YvjW6sTwCg8FgMBgMBoPBXsZufDDfqOhJG5379/oCTo8OAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">18</td>
      <td align="left">study
[character]</td>
      <td align="left">1. Ayub (2010)
2. Bowman (1996)
3. Calderon-Ospina (2010)
4. Cheong (2018)
5. Conforti (2012)
6. Corsonello (2009)
7. Davies (2009)
8. Fernandez-Regueiro (2011)
9. Ganeva (2007)
10. Ganeva (2013)
[ 16 others ]</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">3.8%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">16</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">61.5%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAGkAAAESBAMAAAAMPua/AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAJJJREFUaN7t1LERhEAQA0FCgAyeIwTyz+0dqnDZPQvR8tuRMcuSuzHGvj3eeqnjPCmK+qzqdeO5eJdSUYqiqiq1onpIUVRVpfawp1SUoqiqSq2oHlIUVVV6OP8hRVFfVio6/yFFURlKD+c/pCgqQ6X2sKdUlKKoqkqtqB5SFFVVqT3sqVHa736+MIqislSvG4n7A9SmCQ+zAimcAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">19</td>
      <td align="left">yi
[numeric]</td>
      <td align="left">Mean (sd) : 0.2 (0.1)
min < med < max:
0 < 0.2 < 0.7
IQR (CV) : 0.1 (0.7)</td>
      <td align="left" style="vertical-align:middle">26 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAHFJREFUaN7t2LENgCAQQFFWgA3EDXT/3azkmotRQmLzfnW5hBcaGkrRTDWpj7b6rgdsP+9gMNhfWE+axuJgNsFgMBgMBoPBYDAYDAaDwWD/Y/ENtgAb0wGDwZZhySttsfuIjVXcscUOBoOtxvqSima6AHjZgJkXKidfAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAw5JaMgQAAACV0RVh0ZGF0ZTptb2RpZnkAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMJXLND0AAAAASUVORK5CYII="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">20</td>
      <td align="left">vi
[numeric]</td>
      <td align="left">Mean (sd) : 0 (0)
min < med < max:
0 < 0 < 0
IQR (CV) : 0 (1.4)</td>
      <td align="left" style="vertical-align:middle">26 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAG9JREFUaN7t2asNwCAUQFFWKBuUbkD3360GcCSEj2hyrkLAcTwBIWimVLuvhQr2vCUYDAaDwWAwGAwGg8FgMBgMBoPB/oa1F/MdWF1kGAy2DRv/1YrtPnex8TES69YMO4jF7gyewdoR2AEsbSlopg8QhZF2cb602QAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMC0wNi0wMVQxNTozMDozNCswMTowMOSWjIEAAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDCVyzQ9AAAAAElFTkSuQmCC"></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">21</td>
      <td align="left">ci.lb
[numeric]</td>
      <td align="left">Mean (sd) : 0.2 (0.1)
min < med < max:
0 < 0.1 < 0.6
IQR (CV) : 0.2 (0.8)</td>
      <td align="left" style="vertical-align:middle">26 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAGpJREFUaN7t18sJgDAQQMFtQTswdqD99+ZF40EQ8kER552XYS8LSYRqSrlpqG/H5vUIBvsc1nILF6xlRxgMBoPBYLCXsPL30A1WviMMBoPBYDAYDAaDwWA/wMbz+90By2MLDPYglroUqmkDNUMwTaGndu4AAAAldEVYdGRhdGU6Y3JlYXRlADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDDkloyBAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAwlcs0PQAAAABJRU5ErkJggg=="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">22</td>
      <td align="left">ci.ub
[numeric]</td>
      <td align="left">Mean (sd) : 0.2 (0.2)
min < med < max:
0 < 0.2 < 0.8
IQR (CV) : 0.2 (0.7)</td>
      <td align="left" style="vertical-align:middle">26 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH5AYBEB4ia/q8ugAAAHxJREFUaN7t2bEJxDAMQFGvkGwQ3Qbx/rtd44jDEDBBgSver4wMrxMu3JqetM3tMTq29W6xPoLBYDAYDHaLXW9vVGCfYZwwGOwfsNzvCuwyOgwGew/Lra3AcgCDwWAwGAwGg8F+BjF3DCK/qGId6/MhsbyBwWDVWJTU9KQvJx5ODCE/YYQAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjAtMDYtMDFUMTU6MzA6MzQrMDE6MDDkloyBAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIwLTA2LTAxVDE1OjMwOjM0KzAxOjAwlcs0PQAAAABJRU5ErkJggg=="></td>
      <td align="center">26
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
  </tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.9.6 (<a href='https://www.r-project.org/'>R</a> version 3.6.3)<br/>2020-06-01</p>
</div><!--/html_preserve-->

## System info

```
## 
## System: Windows 10 x64 build 18363
## Nodename: DESKTOP-JKQ7LTN, User: Darren
## Total Memory: 16168 MB
## 
## R version 3.6.3 (2020-02-29) 
## x86_64-w64-mingw32/x64 (64-bit) 
## 
## Loaded Packages: 
##  flextable (0.5.10), viridis (0.5.1), viridisLite (0.3.0), metafor (2.4-0), Matrix (1.2-18), forcats (0.5.0), stringr (1.4.0), dplyr (0.8.5), purrr (0.3.4), readr (1.3.1), tidyr (1.1.0), tibble (3.0.1), ggplot2 (3.3.0), tidyverse (1.3.0)
```

