R-packages
==========

This packages provides a convenient way (for me!) to install and update
packages for the R Statistical Computing environment. It contains a
hardcoded list of R packages that I use; changes in that list will cause
a version bump.

Installation
------------

Installation proceeds as usual with

    ./configure --prefix=<whereever>
    make
    make install

which installs the following scripts:

    R-packages-install
    R-packages-update
    R-oracle-install

Usage
-----

If run from the shell command line, `R-packages-install` and `R-packages-update`
will install or update my standard collection of R packages. Note that the second
script is intended to be used to update all packages in an existing R installation;
it just contains no hard coded list, but just tries to updated everything.

The script `R-oracle-install` installs the `ROracle` interface to Oracle databases;
it uses a patched version of ROracle v1.3 (the reason for the patching is that
the released version has a bug that prohibits installation under Homebrew; see
https://community.oracle.com/thread/4014048 for details).

All scripts use R through the `Rscript` commend and will use the version which is
first on the `PATH`.

Dependencies
------------

These scripts were created for a Mac OS-X environment using Homebrew; the `brew`
command is required to determine the paths to several libraries against R
packages will be build. For the packages listed in `R-packages-install`, the
following packages from Homebrew are required:

 - `r`
 - `netcdf`
 - `jpeg`
 - `gdal2`
 - `nlopt`
 - `udunits2`

That that `gdal2` is currently not available from `homebrew-core`, but by
tapping [`osgeo4mac`](https://github.com/OSGeo/homebrew-osgeo4mac).

In addition, the Oracle Instant Client software must be installed in order for
`R-oracle-install` to work correctly, with the environment variable
`ORACLE_HOME` pointing to the root of the Oracle Instant Client installation.
