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

EXTRA_DIST = R-packages-install.r R-packages-update.r R-oracle-install.r ROracle_1.3-2.tar.gz

# 5. Install R packages
# ---------------------

install-packages:
	$(RSCRIPT) R-packages-install.r
	$(RSCRIPT) R-oracle-install.r

# 6. Build update script
# ----------------------

R-packages-update:
	cp R-packages-update.r $@
	chmod a+x $@