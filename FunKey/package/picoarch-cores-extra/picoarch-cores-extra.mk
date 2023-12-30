################################################################################
#
# picoarch-cores-extra
#
################################################################################

PICOARCH_CORES_EXTRA_VERSION = build-231226
PICOARCH_CORES_EXTRA_SITE = "https://github.com/sdhizumi/picoarch/releases/download/$(PICOARCH_CORES_EXTRA_VERSION)/"
PICOARCH_CORES_EXTRA_SOURCE = cores-funkey-s.tar.gz
PICOARCH_CORES_EXTRA_LICENSE = Each

PICOARCH_CORES_EXTRA_INSTALL =

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_EXTRA_MAME2003_PLUS),y)
PICOARCH_CORES_EXTRA_INSTALL += mame2003_plus_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_EXTRA_PRBOOM),y)
PICOARCH_CORES_EXTRA_INSTALL += prboom_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_EXTRA_SCUMMVM),y)
PICOARCH_CORES_EXTRA_INSTALL += scummvm_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_EXTRA_TYRQUAKE),y)
PICOARCH_CORES_EXTRA_INSTALL += tyrquake_libretro.so
endif

define PICOARCH_CORES_EXTRA_INSTALL_MNT_CMDS
	mkdir -p $(TARGET_DIR)/usr/local/share/OPKs/Libretro/cores
	for i in $(PICOARCH_CORES_EXTRA_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/local/share/OPKs/Libretro/cores/ || exit 1 ; \
	done
endef

define PICOARCH_CORES_EXTRA_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	for i in $(PICOARCH_CORES_EXTRA_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/lib/libretro/ || exit 1 ; \
	done
	$(PICOARCH_CORES_EXTRA_INSTALL_MNT_CMDS)
endef

$(eval $(generic-package))
