## Loading packages.
library(sscr)
library(ascr)

## Setting parameter values.
D <- 1
det.pars <- list(lambda0 = 0.5, sigma = 100)
cov.pars <- list(sigma.u = 1.2, rho = 150)

## Setting up detector locations.
n.rows <- 4
traps <- cbind(rep(100*(1:n.rows), n.rows),
               rep(100*(1:n.rows), each = n.rows))
traps <- rbind(cbind(traps[, 1] - 10, traps[, 2]),
               cbind(traps[, 1] + 10, traps[, 2]))
mask <- create.mask(traps = traps, buffer = 500)

## Simulating data.
capt <- sim.sscr(traps = traps, mask = mask, resp = "pois", cov.structure = "sq_exponential",
                 D = D, det.pars = det.pars, cov.pars = cov.pars, keep.acs = FALSE)
    
## Model (1).
fit.simple <- try(fit.sscr(capt = capt, traps = traps, mask = mask, resp = "pois",
                           cov.structure = "none", hess = TRUE, trace = TRUE),
                  silent = TRUE)

## Model (2).
fit.indep <- try(fit.sscr(capt = capt, traps = traps, mask = mask, resp = "pois",
                          cov.structure = "independent", 
                          start = c(D = D, lambda0 = det.pars$lambda0, sigma = det.pars$sigma,
                                    sigma.u = cov.pars$sigma.u),
                          hess = TRUE, trace = TRUE),
                 silent = TRUE)

## Model (3).
fit.individual <- try(fit.sscr(capt = capt, traps = traps, mask = mask, resp = "pois",
                               cov.structure = "individual", 
                               start = c(D = D, lambda0 = det.pars$lambda0, sigma = det.pars$sigma,
                                         sigma.u = cov.pars$sigma.u),
                               hess = TRUE, trace = TRUE),
                      silent = TRUE)

## Model (4).
fit.sqexp <- try(fit.sscr(capt = capt, traps = traps, mask = mask, resp = "pois",
                          cov.structure = "sq_exponential",
                          start = c(D = D, lambda0 = det.pars$lambda0, sigma = det.pars$sigma,
                                    sigma.u = cov.pars$sigma.u, rho = cov.pars$rho),
                          hess = TRUE, trace = TRUE),
                 silent = TRUE)

## Model (5).
fit.exp <- try(fit.sscr(capt = capt, traps = traps, mask = mask, resp = "pois",
                        cov.structure = "exponential",
                        start = c(D = D, lambda0 = det.pars$lambda0, sigma = det.pars$sigma,
                                  sigma.u = cov.pars$sigma.u, rho = cov.pars$rho),
                        hess = TRUE, trace = TRUE),
               silent = TRUE)

## Estimates stored in the component $ests of each model object.


