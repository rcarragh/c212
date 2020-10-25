---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# c212: Methods for Detecting Safety Signals in Clinical Trials Using Body-Systems (System Organ Classes) 

<!-- badges: start -->
<!-- badges: end -->

The goal of c212 is to provide a self-contained set of methods, which use groupings of adverse events, to aid clinical trial safety investigators, statisticians and researchers, in the early detection of adverse events.

## Installation

You can install the released version of c212 from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("c212")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("rcarragh/c212")
```

## Example

This is a basic example which shows how to apply the Double False Discovery Rate to a set of multiple hypotheses:


```r
library(c212)
data(c212.FDR.data)
c212.err.cntrl(c212.FDR.data, method="DFDR", alpha = 0.05)
#>           B j         AE        p
#> 1 Bdy-sys_3 1   Adv-Ev_6 0.000000
#> 2 Bdy-sys_3 2   Adv-Ev_7 0.000011
#> 3 Bdy-sys_3 3   Adv-Ev_8 0.000021
#> 4 Bdy-sys_3 5 Adv-Ev_910 0.000039
#> 5 Bdy-sys_3 6 Adv-Ev_911 0.000079
#> 6 Bdy-sys_3 7 Adv-Ev_912 0.003554
#> 7 Bdy-sys_3 4   Adv-Ev_9 0.010411
```

This is an example of how to apply the Berry and Berry model:


```r
library(c212)
data(c212.trial.data)
mod.BB <- c212.BB(c212.trial.data, burnin = 100, iter = 200)
#> Global Simulation Parameters:
#> 	Simulation Type: 1
#> 	w_alpha (width): 1.000000
#> 	m alpha (control): 6.000000
#> 	w_beta (width): 1.000000
#> 	m beta (control): 6.000000
#> 	w_gamma (width): 1.000000
#> 	m gamma (control): 6.000000
#> 	sigma_MH_alpha: 3.000000
#> 	sigma_MH_beta: 3.000000
#> 	sigma_MH_gamma: 0.200000
#> 	sigma_MH_theta: 0.200000
#> 	default weight: 0.500000
#> MCMC chain fitting complete.
#> [1] "MCMC fitting complete."
```
