# Makefile.am for R-packages
# ==========================

# 1. Useful things
# ----------------

SUFFIXES = .sh .r

# 2. Scripts to be installed
# --------------------------

bin_SCRIPTS = R-packages-update

# 3. Files to be cleaned
# ----------------------

CLEANFILES = $(bin_SCRIPTS)

# 4. Files to be distributed
# --------------------------

EXTRA_DIST = R-packages-install.R R-packages-update.R R-oracle-install.R ROracle_1.3-2.tar.gz

# 5. Install R packages
# ---------------------

install-packages:
	$(RSCRIPT) R-packages-install.R
	$(RSCRIPT) R-oracle-install.R

# 6. Build update script
# ----------------------

R-packages-update:
	cp R-packages-update.R $@
	chmod a+x $@
