#! /usr/bin/env Rscript

# Updating R packages
# ===================
#
# C. Marquardt, Darmstadt
#
# 29 May 2017
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
# Note: The following lines require Oracle's Instant Client to be installed.
# Note 2: The proper install of the ROracle package downloaded from CRAN in the
#         current version (v1.3-1) doesn't work as there's an issue with the
#         distributed tarball (see https://community.oracle.com/thread/4014048
#         for etails); for the time being, see R-oracle-install.r

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

# 2. Update existing packages
# ---------------------------

update.packages(ask = FALSE, repos = "http://cran.rstudio.com/")

# 5. Reset environment variables
# ------------------------------

# Note: As before, the following lines are for ROracle

#Sys.setenv(ORACLE_HOME = oracle_home)
#Sys.unsetenv("OCI_LIB")

Sys.unsetenv("LDFLAGS")
Sys.unsetenv("CPPFLAGS")

Sys.unsetenv("PKG_LIBS")
Sys.unsetenv("PKG_CPPFLAGS")
