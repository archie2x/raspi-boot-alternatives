
.PHONY: deb

ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST))))
VERSION := $(shell dpkg-parsechangelog --show-field Version -l $(ROOT)/packaging/DEBIAN/changelog)

SRCS = \
$(ROOT)/packaging/etc/default/raspi-boot-alternatives \
$(ROOT)/packaging/etc/initramfs/post-update.d/z50-raspi-firmware \
$(ROOT)/packaging/etc/kernel/postinst.d/z50-raspi-firmware \
$(ROOT)/packaging/DEBIAN/changelog \
$(ROOT)/packaging/DEBIAN/preinst \
$(ROOT)/packaging/DEBIAN/copyright \
$(ROOT)/packaging/DEBIAN/postrm \
$(ROOT)/packaging/DEBIAN/control

DEB = raspi-boot-alternatives_$(VERSION)_all.deb

$(DEB): $(SRCS)
	dpkg-deb \
		--build \
		--root-owner-group \
		$(ROOT)/packaging $@

deb: $(DEB)
