THEOS_DEVICE_PORT=2222
THEOS_DEVICE_IP=localhost

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = IKnowMoreThanU

IKnowMoreThanU_FILES = Tweak.xm
IKnowMoreThanU_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += iknowmorethanuprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
