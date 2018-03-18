# Makefile.am for R-packages
# ==========================

# 1. Useful things
# ----------------

SUFFIXES = .sh .r

# 2. Scripts to be installed
# --------------------------

bin_SCRIPTS = R-packages-install R-packages-update R-oracle-install

# 3. Data Files
# -------------

pkgdata_DATA = ROracle_1.3-2.tar.gz

# 4. Files to be cleaned
# ----------------------

CLEANFILES = $(bin_SCRIPTS)

# 5. Files to be distributed
# --------------------------

EXTRA_DIST = R-packages-install.R R-packages-update.R R-oracle-install.R.in ROracle_1.3-2.tar.gz

# 6. Substitution
# ---------------

do_subst = sed -e 's,[@]pkgdatadir[@],$(pkgdatadir),g'

# 6. Build install scripts
# ------------------------

R-packages-install:
	cp R-packages-install.R $@
	chmod a+x $@

R-oracle-install:
	$(do_subst) R-oracle-install.R.in > $@
	chmod a+x $@

# 7. Build update script
# ----------------------

R-packages-update:
	cp R-packages-update.R $@
	chmod a+x $@

# 8. Old stuff
# ------------

#install-packages:
#	$(RSCRIPT) R-packages-install.R
#	$(RSCRIPT) R-oracle-install.R
