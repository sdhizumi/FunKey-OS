################################################################################
#
# picoarch-cores
#
################################################################################

PICOARCH_CORES_VERSION = build-231226
PICOARCH_CORES_SITE = "https://github.com/sdhizumi/picoarch/releases/download/$(PICOARCH_CORES_VERSION)/"
PICOARCH_CORES_SOURCE = cores-funkey-s.tar.gz
PICOARCH_CORES_LICENSE = Each

PICOARCH_CORES_INSTALL =

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_BEETLE_PCE_FAST),y)
PICOARCH_CORES_INSTALL += beetle-pce-fast_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_BLUEMSX),y)
PICOARCH_CORES_INSTALL += bluemsx_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_DOSBOX_PURE),y)
PICOARCH_CORES_INSTALL += dosbox-pure_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_FAKE_08),y)
PICOARCH_CORES_INSTALL += fake-08_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_FBALPHA2012),y)
PICOARCH_CORES_INSTALL += fbalpha2012_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_FCEUMM),y)
PICOARCH_CORES_INSTALL += fceumm_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_FMSX),y)
PICOARCH_CORES_INSTALL += fmsx_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_GAMBATTE),y)
PICOARCH_CORES_INSTALL += gambatte_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_GME),y)
PICOARCH_CORES_INSTALL += gme_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_GPSP),y)
PICOARCH_CORES_INSTALL += gpsp_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_MAME2000),y)
PICOARCH_CORES_INSTALL += mame2000_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_MEDNAFEN_NGP),y)
PICOARCH_CORES_INSTALL += mednafen_ngp_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_MEDNAFEN_WSWAN),y)
PICOARCH_CORES_INSTALL += mednafen_wswan_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_PCSX_REARMED),y)
PICOARCH_CORES_INSTALL += pcsx_rearmed_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_PICODRIVE),y)
PICOARCH_CORES_INSTALL += picodrive_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_POKEMINI),y)
PICOARCH_CORES_INSTALL += pokemini_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_QUICKNES),y)
PICOARCH_CORES_INSTALL += quicknes_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_SMSPLUS_GX),y)
PICOARCH_CORES_INSTALL += smsplus-gx_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_SNES9X2002),y)
PICOARCH_CORES_INSTALL += snes9x2002_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_SNES9X2005),y)
PICOARCH_CORES_INSTALL += snes9x2005_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_SNES9X2005_PLUS),y)
PICOARCH_CORES_INSTALL += snes9x2005_plus_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_SNES9X2010),y)
PICOARCH_CORES_INSTALL += snes9x2010_libretro.so
endif

ifeq ($(BR2_PACKAGE_PICOARCH_CORES_STELLA2014),y)
PICOARCH_CORES_INSTALL += stella2014_libretro.so
endif

define PICOARCH_CORES_INSTALL_MNT_CMDS
	mkdir -p $(TARGET_DIR)/usr/local/share/OPKs/Libretro/cores
	for i in $(PICOARCH_CORES_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/local/share/OPKs/Libretro/cores/ || exit 1 ; \
	done
endef

define PICOARCH_CORES_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	for i in $(PICOARCH_CORES_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/$$i \
			$(TARGET_DIR)/usr/lib/libretro/ || exit 1 ; \
	done
	$(PICOARCH_CORES_INSTALL_MNT_CMDS)
endef

$(eval $(generic-package))
