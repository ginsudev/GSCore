ROOTLESS ?= 0

# Build config
ARCHS = arm64 arm64e
THEOS_DEVICE_IP = localhost -p 2222
INSTALL_TARGET_PROCESSES = SpringBoard
PACKAGE_VERSION = 1.0.0

# Rootless / Rootful settings
ifeq ($(ROOTLESS),1)
	GSCore_XCODEFLAGS = SWIFT_ACTIVE_COMPILATION_CONDITIONS="ROOTLESS"
	THEOS_PACKAGE_SCHEME = rootless
	GSCORE_INSTALL_PATH = /var/jb/Library/Frameworks
	# Control
	PKG_ARCHITECTURE = iphoneos-arm64
	PKG_NAME_SUFFIX = (Rootless)
else
	GSCore_XCODEFLAGS = SWIFT_ACTIVE_COMPILATION_CONDITIONS=""
	GSCORE_INSTALL_PATH = /Library/Frameworks
	# Control
	PKG_ARCHITECTURE = iphoneos-arm
endif

BUNDLE_PATH = $(THEOS_STAGING_DIR)$(GSCORE_INSTALL_PATH)/GSCore.framework/Bundle.bundle

include $(THEOS)/makefiles/common.mk

XCODEPROJ_NAME = GSCore
GSCore_XCODEFLAGS += LD_DYLIB_INSTALL_NAME=$(GSCORE_INSTALL_PATH)/GSCore.framework/GSCore
GSCore_XCODEFLAGS += DYLIB_INSTALL_NAME_BASE=$(GSCORE_INSTALL_PATH)/GSCore.framework/GSCore
GSCore_XCODEFLAGS += DWARF_DSYM_FOLDER_PATH=$(THEOS_OBJ_DIR)/dSYMs
GSCore_XCODEFLAGS += CONFIGURATION_BUILD_DIR=$(THEOS_OBJ_DIR)/

include $(THEOS)/makefiles/xcodeproj.mk

override THEOS_PACKAGE_NAME := com.ginsu.gscore-$(PKG_ARCHITECTURE)

before-package::
	# Append values to control file
	$(ECHO_NOTHING)sed -i '' \
		-e 's/\$${PKG_ARCHITECTURE}/$(PKG_ARCHITECTURE)/g' \
		-e 's/\$${VERSION}/$(PACKAGE_VERSION)/g' \
		-e 's/\$${PKG_NAME_SUFFIX}/$(PKG_NAME_SUFFIX)/g' \
		$(THEOS_STAGING_DIR)/DEBIAN/control$(ECHO_END)
	
	# Move to staging dir
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)$(GSCORE_INSTALL_PATH)$(ECHO_END)
	$(ECHO_NOTHING)mv $(THEOS_OBJ_DIR)/GSCore.framework/ $(THEOS_STAGING_DIR)$(GSCORE_INSTALL_PATH)$(ECHO_END)
	
	# Sign
	$(ECHO_NOTHING)ldid -Sentitlements.xml $(THEOS_STAGING_DIR)$(GSCORE_INSTALL_PATH)/GSCore.framework/GSCore$(ECHO_END)

	# Copy to theos/lib
	$(ECHO_NOTHING)rm -rf $(THEOS)/lib/GSCore.framework/$(ECHO_END)
	$(ECHO_NOTHING)cp -r $(THEOS_STAGING_DIR)$(GSCORE_INSTALL_PATH)/GSCore.framework $(THEOS)/lib/$(ECHO_END)
	
before-all::
	$(ECHO_NOTHING)rm -rf $(THEOS_STAGING_DIR)$(GSCORE_INSTALL_PATH)$(ECHO_END)
	$(ECHO_NOTHING)rm -rf $(THEOS_OBJ_DIR)$(ECHO_END)