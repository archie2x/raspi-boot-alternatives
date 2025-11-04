
.PHONY: deb

MAKEFILE_DIR := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
VERSION := $(shell dpkg-parsechangelog --show-field Version -l $(MAKEFILE_DIR)/packaging/DEBIAN/changelog)

raspi-boot-alternatives_$(VERSION)_all.deb:
	dpkg-deb \
		--build \
		--root-owner-group \
		$(MAKEFILE_DIR)/packaging $@
