---
title: 'c212: An R Package for the Detection of Safety Signals in Clinical Trials Using Body-Systems (System Organ Classes)'
tags:
  - Adverse event
  - Safety
  - Pharmacovigilance
  - Clinical trials
  - False Discovery Rate
  - Body-systems
  - System organ classes
  - Bayesian hierarchy
  - Multiple comparisons.
authors:
  - name: Raymond Carragher
    orcid: 0000-0002-0120-625X
    affiliation: "1, 2, 4"
  - name: Chris Robertson
    affiliation: "2, 3"
affiliations:
  - name: Strathclyde Institute of Pharmacy and Biomedical Sciences, University of Strathclyde, Glasgow, UK
    index: 1
  - name: Department of Mathematics and Statistics, University of Strathclyde, Glasgow, UK
    index: 2
  - name: Health Protection Scotland, NHS National Services Scotland, Glasgow, UK
    index: 3
  - name: Health Data Research (UK), University of Strathclyde, Glasgow, UK
    index: 4
bibliography: paper.bib
date: \today
---

# Summary
Safety in clinical trials may be characterised by the incidence or occurrence of adverse events. The statistical analysis of this data is 
complicated by the large number of adverse events recorded, with low event rates, small effect sizes and low power all contributing to the 
difficulty in determining a robust safety profile for a treatment during the trial process. 

In addition to end of trial analyses, a number of interim analyses may take place at different time points during the trial lifecycle. These 
offer the additional statistical challenge of testing accumulating data, with possibly differing recruitment rates on trial arms contributing 
to a lack of balance in the data.

A number of methods, which use groupings of adverse events by body-system or System Organ Class, have been recently proposed to address these 
issues. These methods, which include both error controlling procedures for multiple hypothesis 
testing [@BH1995; @HZZ2010; @MA2012; @Y2008; @M2006],
and Bayesian modelling approaches [@BB2004; @XMC2011; @phdthesis], are implemented in the `R` package `c212` (Table \ref{table:1}). 


# Statement of Need 
The detection of safety issues in the post-marketing phase of a treatment's life cycle, as opposed to the trial phase, can have a serious effect 
on the health of patients and also a financial impact both for the companies developing the treatments, and the regulatory bodies responsible for 
overseeing them. 

| Method                                                | Description                           |
| ----------------------------------------------------- | ------------------------------------- |
| Benjamini-Hochberg procedure[@BH1995]                 | Control of False Discovery Rate       |
| Group Benjamini-Hochberg procedure[@HZZ2010]          | Control of False Discovery Rate       |
| Double false discovery rate[@MA2012]                  | Control of False Discovery Rate       |
| Subset BH-procedure[@Y2008]                           | Control of False Discovery Rate       |
| Bonferroni correction[@M2006]                         | Control of Familywise Error Rate      |
| Berry and Berry model[@BB2004]                        | Bayesian model for end of trial data  |
| Berry and Berry model without point-mass[@XMC2011]    | Bayesian model for end of trial data  |
| Interim analysis model[@phdthesis]                    | Bayesian model for interim trial data |
| Interim analysis model without point-mass[@phdthesis] | Bayesian model for interim trial data |
: Methods in the c212 package. \label{table:1}

The `R` package `c212` provides a self-contained set of methods for clinical trial safety investigators, statisticians and researchers, to aid in
the early detection of adverse events. It is designed to be easy to use with a simple data input format and interface. 

The primary use case for the software is in the statistical analysis of adverse event incidence and occurrence data during clinical trials. 
A second goal of the package is to provide reference implementations of the methods in Table \ref{table:1} for use by researchers, both in the 
area of safety in clinical trials, as well those developing or testing methods for 
handling error rates when testing multiple hypotheses.
Beyond safety in clinical trials, the package will be useful to any project which deals with multiple hypothesis testing, or projects where two 
groups of comparative data may be modelled by hierarchical Bayesian binomial or Poisson models, with recent extensions of the Bayesian models to 
observational data being developed.[@RC2020]


The `c212` package is currently being used both for clinical trial safety analysis[@FKL2016; @Munsaka2018; @WWM2018] and as a research tool in the
investigation and development of new safety methods.[@Tan2020; @Tan2019]


# Overview

The Bayesian models, under assumptions of conditional independence, are fitted using a Gibbs sampling Markov Chain Monte-Carlo (MCMC) 
method.[@RCR1999] 
The posterior distributions of the model parameters are used to assess which adverse events may have increased rates on the treatment arm. 
In the case of the Berry and Berry model, which is binomial, the `theta` model parameter, representing the increase in the log-odds of an event 
occurring on the treatment arm, is used for this purpose.[@BB2004]
For the interim analysis models, which are Poisson based, the increase in the log rate of an event on the treatment arm is used for
adverse event assessment. As in the Berry and Berry model this is represented by the parameter `theta`.[@phdthesis] 
Functions for generating summary statistics and highest probability intervals are provided using the services of the `coda` package.[@coda2006] 
The main convergence diagnostics available directly within the package are the Gelman-Rubin and Geweke statistics,[@GCSR2004] again from the 
`coda` package. Access to the raw samples is available for further processing should that be required.
The error controlling procedures included in the package follow exactly the method definitions in the papers which introduced 
them.[@BH1995; @HZZ2010; @MA2012; @Y2008; @M2006]
The following sections contain examples which cover the main uses of the software. The data sets and functions used are fully documented in the 
package.[@cran]

## Multiple Hypothesis Testing

The data set `c212.FDR.data` contains the results from a set of multiple hypothesis tests for adverse events grouped by 
body-system. The Group Benjamini-Hochberg procedure is applied to the data with control of the False Discovery Rate set at the 5% level.
The `c212.err.cntrl` function, which provides the interface to the error controlling methods, returns the set of p-values/hypotheses deemed 
significant.

```r
library(c212)
data(c212.FDR.data, package="c212")
head(c212.FDR.data, 2)
B j AE p
1 Bdy-sys_5 7 Adv-Ev_24 1.000000
2 Bdy-sys_6 9 Adv-Ev_34 0.358949

p.sig <- c212.err.cntrl(c212.FDR.data, method = "GBH", alpha = 0.05)
print(p.sig)
          B j         AE        p p_weighted
1 Bdy-sys_3 6 Adv-Ev_911 0.000079   0.000000
2 Bdy-sys_3 3   Adv-Ev_8 0.000021   0.000000
3 Bdy-sys_3 1   Adv-Ev_6 0.000000   0.000000
4 Bdy-sys_3 5 Adv-Ev_910 0.000039   0.000000
5 Bdy-sys_3 2   Adv-Ev_7 0.000011   0.000000
6 Bdy-sys_3 4   Adv-Ev_9 0.010411   0.000000
7 Bdy-sys_3 7 Adv-Ev_912 0.003554   0.000000
8 Bdy-sys_2 1   Adv-Ev_2 0.005333   0.005333
9 Bdy-sys_2 2   Adv-Ev_3 0.016013   0.016013
```


## Berry and Berry End of Trial Analysis

The data set `c212.trial.data` contains sample end of trial adverse event incidence counts.
The data is modelled using the Berry and Berry model as follows:

```r
library(c212)
data(c212.trial.data, package="c212")
head(c212.trial.data, 2)
B j AE Group Count Total
1 Bdy-sys_2 1 Adv-Ev_2 1 20 450
2 Bdy-sys_2 4 Adv-Ev_5 2 21 450

mod.BB <- c212.BB(c212.trial.data)
```

`mod.BB` contains the raw samples generated from the model fitting procedure. To perform a convergence check:

```r
conv.BB = c212.convergence.diag(mod.BB)
c212.print.convergence.summary(conv.BB)
```

In order to assess which adverse events may be associated with treatment the function `c212.ptheta` is used. This calculates the posterior 
probability of an increase in log-odds of an event occurring on the treatment arm. 
A threshold may be used to view the adverse events which exceed some defined level, for example: 0.90:

```r
theta.pos_BB <- c212.ptheta(mode.BB)

theta_pos.BB[theta_pos.BB$ptheta > 0.9,]
B AE ptheta
2 Bdy-sys_2 Adv-Ev_2 0.9410417
6 Bdy-sys_3 Adv-Ev_6 1.0000000
7 Bdy-sys_3 Adv-Ev_7 1.0000000
8 Bdy-sys_3 Adv-Ev_8 1.0000000
9 Bdy-sys_3 Adv-Ev_9 0.9873500
10 Bdy-sys_3 Adv-Ev_910 0.9999333
11 Bdy-sys_3 Adv-Ev_911 0.9999917
12 Bdy-sys_3 Adv-Ev_912 0.9964917
```

The high posterior probabilities may indicate a possible association with treatment for these adverse events.

## Interim Analysis
Apart from the function used to fit the model, the procedure for fitting and accessing interim analysis data is exactly the same as for the 
Berry and berry model. 

```r
library(c212)
data(c212.trial.interval.data1)
head(c212.trial.interval.data1, 2)
Interval I_index         B       AE Group Count Exposure
0.0-180.0       0 Bdy-sys_1 Adv-Ev_1     1    87 160133.7
0.0-180.0       0 Bdy-sys_1 Adv-Ev_1     2   103 163224.6
mod.BB.interim <- c212.BB.interim(c212.trial.interval.data1)
```

# Software Details and Availibility

The `c212` package was initially released to CRAN in 2017 and has been through a number of release cycles.[@cran]
Before each release a full set of unit and functional tests are performed on the package development system, including memory checks with 
valgrind[@valgrind] and Google address sanitizer.[@asan]
The package documentation also contains tests and examples based on data included in the package.

The `c212` package is most easily downloaded and installed directly from CRAN[@cran] or, alternatively, 
from the corresponding GitHub repository.[@github]

The authors are interested in extending the software to include new methods, particularly in the area of safety analysis, and would welcome 
collaborations in this area. Any support issues or questions can be addressed directly to the corresponding author, through the associated CRAN 
maintainer email address, or through the Github repository.

# Acknowledgements

This work was funded by the Engineering and Physical Sciences Research Council (EPSRC) UK (award reference 1521741) and Frontier 
Science (Scotland) Ltd.

# References
