# spatial-correlation-scr

This repository contains code and data to accompany the following paper:

* Stevenson, B. C., Fewster, R. M., and Sharma, K. (in submission) Spatial correlation structures for detections of individuals in spatial capture-recapture models.

Instructions on how to run the code follow.

## OVERVIEW

Code to fit models to the snow leopard data is in the file sl-analysis.r. The data are included in the file sl.RData, and are loaded by the R script prior to model fitting.

Code to run a single iteration of our simulation study is in the file sim.r. We submitted this file as a batch job on a server so that iterations ran in parallel.

Note that fitting these models may require more RAM than what is available on a standard desktop or laptop computer, so high-performance computing resources might be necessary.

The following requirements are necessary prior to running the code.

## REQUIREMENTS

The `sscr` R package is required for both the snow leopard analysis and the simulation study. The following R packages are dependencies and must be installed (e.g., from CRAN) prior to installing `sscr`:

* `COMPoissonReg`
* `Rcpp`
* `mvtnorm`
* `numDeriv`
* `spatstat`
* `stat`
* `TMB`

The following additional packages are suggested to ensure full functionality of the package:

* `minqa`
* `testthat`

The sscr package is available on GitHub (https://github.com/b-steve/sscr). Alternatively, the source version of this package is included in this directory. Suitable tools are required to build R packages from source (e.g., Rtools is required for Windows users). The following code will install the package, as long as your R working directory contains the sscr_1.0.1.tar.gz file:

```r
install.packages("sscr_1.0.1.tar.gz", repos = NULL)
```

Immediately after installing the package, run the following two lines of code to compile the TMB executables, otherwise the `fit.sscr()` function will return an error. This is only required once per installation.

```r
library(sscr)
compile.sscr()
```

The ascr R packages is required for the simulation study. The package is available on GitHub (https://github.com/b-steve/ascr), where installation instructions for all platforms can be found.


