################################################################################
#
# picoarch_gambatte
#
################################################################################

PICOARCH_GAMBATTE_VERSION = v1.0-funkey-s
PICOARCH_GAMBATTE_SITE_METHOD = git
PICOARCH_GAMBATTE_SITE = https://github.com/DrUm78/picoarch.git
PICOARCH_GAMBATTE_LICENSE = MAME
PICOARCH_GAMBATTE_LICENSE_FILES = LICENSE

PICOARCH_GAMBATTE_DEPENDENCIES = sdl sdl_image sdl_ttf

PICOARCH_GAMBATTE_SDL_CFLAGS += $(shell $(STAGING_DIR)/usr/bin/sdl-config --cflags)
PICOARCH_GAMBATTE_SDL_LIBS   += $(shell $(STAGING_DIR)/usr/bin/sdl-config --libs)

PICOARCH_GAMBATTE_CFLAGS += $(PICOARCH_GAMBATTE_SDL_CFLAGS)
PICOARCH_GAMBATTE_CFLAGS += -I$(@D) -I$(@D)/libretro-common/include
PICOARCH_GAMBATTE_CFLAGS += -DFUNKEY_S -Ofast -DNDEBUG  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
PICOARCH_GAMBATTE_CFLAGS += -Wall -fdata-sections -ffunction-sections -flto

PICOARCH_GAMBATTE_LIBS += $(PICOARCH_GAMBATTE_SDL_LIBS)
PICOARCH_GAMBATTE_LIBS += -lc -ldl -lgcc -lm -lSDL -lasound -lpng -lz -Wl,--gc-sections -flto -fPIC -lSDL_image -lSDL_ttf 

define PICOARCH_GAMBATTE_BUILD_CMDS
	(cd $(@D); \
	make platform=funkey-s picoarch-gambatte.opk \
	CROSS_COMPILE=$(TARGET_CROSS) \
	CFLAGS='$(PICOARCH_GAMBATTE_CFLAGS)' \
	LDFLAGS='$(PICOARCH_GAMBATTE_LIBS)' \
	SDL_INCLUDES='$(PICOARCH_GAMBATTE_SDL_CFLAGS)' \
	SDL_LIBS='$(PICOARCH_GAMBATTE_SDL_LIBS)' \
	)
endef

PICOARCH_GAMBATTE_GIT_SUBMODULES = YES

define PICOARCH_GAMBATTE_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/local/share/OPKs/Emulators
	$(INSTALL) -m 0755 $(@D)/picoarch-gambatte.opk $(TARGET_DIR)/usr/local/share/OPKs/Emulators
endef

$(eval $(generic-package))
