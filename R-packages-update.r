#! /usr/bin/env Rscript

# Updating R packages
# ===================
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


# 2. Update existing packages
# ---------------------------

update.packages(ask = FALSE, repos = "http://cran.rstudio.com/")


# 5. Reset environment variables
# ------------------------------

# Note: As before, the following lines are commented out as there is no Oracle C-API

#Sys.setenv(ORACLE_HOME = oracle_home)
#Sys.unsetenv("OCI_LIB")

Sys.unsetenv("JPEG_LIBS")
Sys.unsetenv("PKG_CPPFLAGS")