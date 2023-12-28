################################################################################
#
# opensans
#
################################################################################

OPENSANS_VERSION = bd7e37632246368c60fdcbd374dbf9bad11969b6
OPENSANS_SITE_METHOD = git
OPENSANS_SITE = https://github.com/googlefonts/opensans.git
OPENSANS_LICENSE = OFL
OPENSANS_LICENSE_FILES = OFL.txt

OPENSANS_FONTS_INSTALL = *.ttf

define OPENSANS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/fonts/opensans/
	for i in $(OPENSANS_FONTS_INSTALL) ; do \
		$(INSTALL) -m 0644 $(@D)/fonts/ttf/$$i \
			$(TARGET_DIR)/usr/share/fonts/opensans/ || exit 1 ; \
	done
	$(OPENSANS_FONTCONFIG_CONF_INSTALL_CMDS)
endef

$(eval $(generic-package))
