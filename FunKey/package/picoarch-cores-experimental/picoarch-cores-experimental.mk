################################################################################
#
# picoarch-cores-experimental
#
################################################################################

PICOARCH_CORES_EXPERIMENTAL_VERSION = build-231226
PICOARCH_CORES_EXPERIMENTAL_SITE = "https://github.com/sdhizumi/picoarch/releases/download/$(PICOARCH_CORES_EXPERIMENTAL_VERSION)/"
PICOARCH_CORES_EXPERIMENTAL_SOURCE = cores-funkey-s.tar.gz
PICOARCH_CORES_EXPERIMENTAL_LICENSE = Each

PICOARCH_CORES_EXPERIMENTAL_INSTALL =

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_EXPERIMENTAL_MGBA),y)
PICOARCH_CORES_EXPERIMENTAL_INSTALL += mgba_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_EXPERIMENTAL_VBA_NEXT),y)
PICOARCH_CORES_EXPERIMENTAL_INSTALL += vba_next_libretro.so
endif

define PICOARCH_CORES_EXPERIMENTAL_INSTALL_MNT_CMDS
	mkdir -p $(TARGET_DIR)/usr/local/share/OPKs/Libretro/cores
	for i in $(PICOARCH_CORES_EXPERIMENTAL_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/local/share/OPKs/Libretro/cores/ || exit 1 ; \
	done
endef

define PICOARCH_CORES_EXPERIMENTAL_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	for i in $(PICOARCH_CORES_EXPERIMENTAL_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/lib/libretro/ || exit 1 ; \
	done
	$(PICOARCH_CORES_EXPERIMENTAL_INSTALL_MNT_CMDS)
endef

$(eval $(generic-package))
