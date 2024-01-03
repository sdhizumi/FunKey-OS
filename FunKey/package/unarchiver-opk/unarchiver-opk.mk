################################################################################
#
# unarchiver-opk
#
################################################################################

UNARCHIVER_OPK_VERSION = v1.0-funkey-s
UNARCHIVER_OPK_SITE_METHOD = local
UNARCHIVER_OPK_SITE = $(UNARCHIVER_OPK_PKGDIR)opk

UNARCHIVER_OPK_INSTALL = unarchiver_opk-funkey-s

define UNARCHIVER_OPK_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/share/OPKs/Applications
	$(HOST_DIR)/usr/bin/mksquashfs $(UNARCHIVER_OPK_PKGDIR)opk/unarchiver_funkey-s \
	$(TARGET_DIR)/usr/local/share/OPKs/Applications/unarchiver-funkey-s.opk -all-root -noappend -no-exports -no-xattrs || exit 1
endef

$(eval $(generic-package))