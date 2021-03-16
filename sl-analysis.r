## Loading package.
library(sscr)
## Loading data.
load("sl.RData")

## Model (1)
tost.fit.none <- fit.sscr(tost.capt, tost.traps, tost.mask, resp = "pois",
                          start = c(sigma = 7000), trace = TRUE, hess = TRUE)
## Estimates. Density is in individuals per hectare.
tost.fit.none$ests
## Standard errors.
tost.fit.none$se

## Model (2)
tost.fit.indep <- fit.sscr(tost.capt, tost.traps, tost.mask, resp = "pois",
                           start = c(lambda0 = 1, sigma = 7000, sigma.u = 2),
                           cov.structure = "independent", trace = TRUE, hess = TRUE)
## Estimates.
tost.fit.indep$ests
## Standard errors.
tost.fit.indep$se

## Model (3)
tost.fit.indiv <- fit.sscr(tost.capt, tost.traps, tost.mask, resp = "pois",
                           start = c(lambda0 = 1, sigma = 7000, sigma.u = 1),
                           cov.structure = "individual", trace = TRUE, hess = TRUE)
## Estimates.
tost.fit.indiv$ests
## Standard errors.
tost.fit.indiv$se

## Model (4)
tost.fit.sqexp <- fit.sscr(tost.capt, tost.traps, tost.mask, resp = "pois",
                           start = c(lambda0 = 1, sigma = 7000, sigma.u = 2, rho = 10000),
                           cov.structure = "sq_exponential", trace = TRUE, hess = TRUE)
## Estimates.
tost.fit.sqexp$ests
## Standard errors.
tost.fit.sqexp$se

## Model (5)
tost.fit.exp <- fit.sscr(tost.capt, tost.traps, tost.mask, resp = "pois",
                         start = c(lambda0 = 1, sigma = 7000, sigma.u = 2, rho = 10000),
                         cov.structure = "exponential", trace = TRUE, hess = TRUE)
## Estimates.
tost.fit.exp$ests
## Standard errors.
tost.fit.exp$se

## Other information available in the following components of the model objects:
## $ests.link: Natural log of the estimates.
## $se.link: Standard errors the the natural log of the estimates.
## $ll: Maximised log-likelihood.
