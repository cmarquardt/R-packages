#! /usr/bin/env Rscript

# Updating and installing R packages
# ==================================
#
# C. Marquardt, Darmstadt
#
# 02 February 2014
#
# Note: ROracle, if installed with Oracle Instant clients,
#       requires the following:
#
#          export OCI_LIB=$ORACLE_HOME
#          unset ORACLE_HOME
#
#            ...build the package ...
#
#          export ORACLE_HOME=OCI_LIB
#          unset OCI_LIB
#
#       on the shell prior to building. The code below
#       does the same manipulation of environment variables, 
#       assuming that ORACLE_HOME is pointing to the
#       installation place of an Oracle Instant client.
#
#       On Homebrew, some packages (in particular: jpeg) 
#       require additional compiler options which are cab
#       be passed into the R build system by setting the
#       corresponding environment variables like PKG_CPPFLAGS
#       (generic for R) or JPEG_LIBS (for jpeg).

# 1. Environment variables (for the ROracle compilation)
# ------------------------------------------------------

# 1.1 ROracle
# -----------
# Note: The following lines are disabled as I don't have Oracle or it's C API installed.

#oracle_home <- Sys.getenv("ORACLE_HOME")
#Sys.setenv(OCI_LIB = oracle_home)
#Sys.unsetenv("ORACLE_HOME")

# 1.2 jpeg
# --------

prefix <- system("brew --prefix", intern = TRUE)

Sys.setenv(PKG_CPPFLAGS = paste("-I", prefix, "/include", sep = ""))
Sys.setenv(JPEG_LIBS = paste("-L", prefix, "/lib", sep = ""))

# 2. Install packages from CRAN
# -----------------------------

# Note 1: Dependencies are not necessarily complete.
# Note 2: The following packages are 'parked' as I currently have not installed
#         the required database backends or C APIs: RMySQL, ROracle

packages <- c("Hmisc",         # Basic things
              "ctv",
              "plyr",
              "dplyr",
              "tidyr",
              "readr",
              "stringr",
              "lubridate",
              "magrittr",
              "mvtnorm",
              "akima",         # Polynomial fitting & smoothing
              "KernSmooth",
              "locfit",
              "locpol",
              "lpridge",
              "mice",          # Multiple imputation
              "robustbase",    # Robust statistics
              "robust",
              "rrcov",
              "rrcovNA",
              "rrcovHD",
              "mvoutlier",
              "xts",           # Time series
              "zoo",
              "astsa",
              "Rwave",         # Time-Frequency Analysis
              "SynchWave",
              "EMD",
              "ggplot2",       # Plotting
              "ggvis",
              "shiny",
              "maps",          # Maps
              "mapdata",
              "mapproj",
              "ggmap",
              "devtools",      # Development tools
              "packrat",
              "getopt",
              "optparse",
              "argparse",
              "Rccp",
              "RcppCNPy",
              "RUnit",         # Test tools
              "testthat",
              "ncdf4",         # Data formats
              "DBI",           # Data bases
              "RSQLite",
              "knitr",         # Documentation
              "formatR", 
              "markdown",
              "bookdown",
              "rticles",
              "rmarkdown", 
              "roxygen2",
              "futile.logger",
              "repr",          # IRKernel for Jupyter Notebooks
              "IRdisplay",
              "evaluate", 
              "crayon", 
              "pbdZMQ",
              "uuid",
              "digest",
              "colorspace",    # Dependencies
              "tensorA", 
              "energy", 
              "car", 
              "RColorBrewer",
              "dichromat", 
              "munsell", 
              "labeling", 
              "spam", 
              "bitops", 
              "robCompositions", 
              "sgeostat", 
              "fit.models", 
              "pcaPP", 
              "norm", 
              "pls", 
              "spls", 
              "digest", 
              "gtable", 
              "reshape2", 
              "scales", 
              "proto", 
              "fields", 
              "evaluate", 
              "brew", 
              "httr", 
              "RCurl", 
              "memoise", 
              "whisker",
              "assertthat",
              "lazyeval",
              "lambda.r",
              "futile.options",
              "BH", 
              "yaml",
              "highlight",
              "htmltools", 
              "caTools",
              "iterators",
              "foreach",        # Parallel processing
              "doParallel",
              "doRNG"
)

install.packages(packages, repos = "http://cran.rstudio.com/")

# Once more: IRKernel for Jupyter Notebooks

devtools::options(download.file.method = "libcurl")
devtools::install_github("IRkernel/IRkernel")


# 3. Reset environment variables
# ------------------------------

# Note: As before, the following lines are commented out as there is no Oracle C-API

#Sys.setenv(ORACLE_HOME = oracle_home)
#Sys.unsetenv("OCI_LIB")

Sys.unsetenv("JPEG_LIBS")
Sys.unsetenv("PKG_CPPFLAGS")
