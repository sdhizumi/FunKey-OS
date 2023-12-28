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

define OPENSANS_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/fonts/opensans/
	cd $(@D)/fonts/ttf/
	install -m 0644 *.ttf $(TARGET_DIR)/usr/share/fonts/opensans/
endef

$(eval $(generic-package))
