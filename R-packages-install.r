#! /usr/bin/env Rscript

# Updating and installing R packages
# ==================================
#
# C. Marquardt, Darmstadt
#
# 29 May 2017
#
# Note: ROracle is temporarily installed in a seperate script. However,
#       ROracle, if installed with Oracle Instant clients,
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
# Note: The following lines require to have Oracle's Instant Client to be installed.
# Note 2: The proper install of the ROracle package downloaded from CRAN in the
#         current version (v1.3-1) doesn't work as there's an issue with the
#         distributed tarball (see https://community.oracle.com/thread/4014048
#         for details); for the time being, see R-oracle-install.r

#oracle_home <- Sys.getenv("ORACLE_HOME")
#Sys.setenv(OCI_LIB = oracle_home)
#Sys.unsetenv("ORACLE_HOME")

# 1.2 Header and library paths
# ----------------------------

prefix <- system("brew --prefix", intern = TRUE)

Sys.setenv(PKG_CPPFLAGS = paste("-I", prefix, "/include", sep = ""))
Sys.setenv(PKG_LIBS = paste("-L", prefix, "/lib", sep = ""))

Sys.setenv(CPPFLAGS = paste("-I", prefix, "/include", sep = ""))
Sys.setenv(LDFLAGS = paste("-L", prefix, "/lib", sep = ""))

#Sys.setenv(JPEG_LIBS = paste("-L", prefix, "/lib", sep = ""))

# 2. Install packages from CRAN
# -----------------------------

# Note 1: Dependencies are not necessarily complete.
# Note 2: The official release of h5 is currently depending on an outdated HDF5
#         release (before 1.10.1); build issues have however been fixed in the
#         GitHub repository of the package. For the time being, it is therefore
#         installed via GitHub.
# Note 2: The following packages are 'parked' as I currently have not installed
#         the required database backends or C APIs: RMySQL, ROracle

# Note: RStudio's tidyverse contains the following core packages:
#
#          ggplot2,   for data visualisation.
#          dplyr,     for data manipulation.
#          tidyr,     for data tidying.
#          readr,     for data import.
#          purrr,     for functional programming.
#          tibble,    for tibbles, a modern re-imagining of data frames.
#
#       Working with specific types of vectors:
#
#          hms,       for times.
#          stringr,   for strings.
#          lubridate, for date/times.
#          forcats,   for factors.
#
#       Importing other types of data:
#
#          feather,   for sharing with Python and other languages.
#          haven,     for SPSS, SAS and Stata files.
#          httr,      for web apis.
#          jsonlite   for JSON.
#          readxl,    for .xls and .xlsx files.
#          rvest,     for web scraping.
#          xml2,      for XML.
#
#       Modelling
#
#          modelr,    for modelling within a pipeline
#          broom,     for turning models into tidy data
#
#       And also these:
#          magrittr,   for using pipelines in R,
#          reprex,     for rendering bits of R code for sharing, e.g., on GitHub or StackOverflow,
#          rstudioapi, for talking to RStudio,
#          crayon,     for bringning color to the terminal
#          boxes,      for drawing boxes in the terminal (with crayon).

packages <- c("Hmisc",         # Basic things
              "ctv",
              "futile.logger",
              "plyr",
              "mvtnorm",
              "tidyverse",     # Tidyverse
              "shiny",         # Web
              "shinydashboard",
              "DT",
              "htmlwidgets",
              "leaflet",
              "akima",         # Polynomial fitting & smoothing
              "KernSmooth",
              "locfit",
              "locpol",
              "lpridge",
              "mice",          # Multiple imputation
              "robustbase",    # Robust statistics
              "robust",
              "robustreg",
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
              "ggvis",         # Plotting
              "shiny",
              "ggthemes",
              "hrbrthemes",
              "sp",            # Spatial
              "sf",
              "raster",
              "maptools",
              "spacetime",
              "lwgeom",
              "rgdal",
              "rosm",
              "maps",          # Maps
              "mapdata",
              "mapproj",
              "ggmap",
              "ggspatial",
              "rasterVis",
              "devtools",      # Development tools
              "packrat",
              "getopt",
              "optparse",
              "argparse",
              "Rcpp",
              "RcppCNPy",
              "RUnit",         # Test tools
              "testthat",
              "h5",            # Data formats
              "ncdf4",
              "rmatio",
              "udunits2",      # Units
              "units",
              "DBI",           # Data bases
              "RSQLite",
              "bookdown",      # Documentation
              "knitr",
              "formatR",
              "markdown",
              "rmarkdown",
              "rticles",
              "roxygen2",
              "repr",          # IRKernel for Jupyter Notebooks
              "IRdisplay",
              "evaluate",
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
              "xfun",
              "tinytex",
              "foreach",        # Parallel processing
              "doParallel",
              "doRNG"
)

install.packages(packages, repos = "http://cran.rstudio.com/")

# h5 workaround: With hdf 1.10.1, the HDF C++ API changed. This was later fixed
# in the CRAN version, but for a while h5 had to be installed from its GitHub
# repo.
#
#devtools::install_github("mannau/h5")

# Once more: IRKernel for Jupyter Notebooks

devtools::install_github("IRkernel/IRkernel", force = TRUE)

# 3. Reset environment variables
# ------------------------------

# Note: As before, the following lines are for ROracle

#Sys.setenv(ORACLE_HOME = oracle_home)
#Sys.unsetenv("OCI_LIB")

#Sys.unsetenv("JPEG_LIBS")

Sys.unsetenv("LDFLAGS")
Sys.unsetenv("CPPFLAGS")

Sys.unsetenv("PKG_LIBS")
Sys.unsetenv("PKG_CPPFLAGS")
