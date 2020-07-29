include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = IKnowMoreThanUPrefs

IKnowMoreThanUPrefs_FILES = IKMTURootListController.m
IKnowMoreThanUPrefs_INSTALL_PATH = /Library/PreferenceBundles
IKnowMoreThanUPrefs_FRAMEWORKS = UIKit
IKnowMoreThanUPrefs_PRIVATE_FRAMEWORKS = Preferences
IKnowMoreThanUPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/IKnowMoreThanUPrefs.plist$(ECHO_END)
