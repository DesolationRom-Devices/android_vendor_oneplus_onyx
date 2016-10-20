# Copyright (C) 2016-2017 The halogenOS Project
# OnePlus OxygenOS Camera
# All credits go to OnePlus for this camera!


# Find where we are
LOCAL_PATH := $(call my-dir)

# Check if the device is oneplus2
ifeq ($(TARGET_DEVICE),onyx)

### LIB

# libfilter-sdk.so
include $(CLEAR_VARS)
LOCAL_MODULE := libfilter-sdk
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := system/lib
LOCAL_SRC_FILES := proprietary/lib/libfilter-sdk.so
include $(BUILD_PREBUILT)

# libopbaselib.so
include $(CLEAR_VARS)
LOCAL_MODULE := libopbaselib
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := system/lib
LOCAL_SRC_FILES := proprietary/lib/libopbaselib.so
include $(BUILD_PREBUILT)

### PRIV-APP

include $(CLEAR_VARS)

LOCAL_MODULE := OnePlusCamera
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := proprietary/priv-app/OnePlusCamera/OnePlusCamera.apk
LOCAL_OVERRIDES_PACKAGES := Snap Camera Camera2
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_SDK_VERSION := 23
TARGET_PLATFORM := android-23
APP_PLATFORM := android-23
LOCAL_ADDITIONAL_DEPENDENCIES := OnePlusCameraLibs

include $(BUILD_PREBUILT)

# OnePlusCamera libs
include $(CLEAR_VARS)

LOCAL_MODULE := OnePlusCameraLibs
LOCAL_OnePlusCamera_PROPR_DIR := $(LOCAL_PATH)/proprietary
LOCAL_MODULE_TAGS := optional
LOCAL_OnePlusCamera_LIB_DEPENDENCIES := \
	libopcamera.so \
	libopcameralib.so

OnePlusCameraRule:
	mkdir -p $(OUT)/system/priv-app/OnePlusCamera/lib/arm
	for lib in $(LOCAL_OnePlusCamera_LIB_DEPENDENCIES); do \
  	  [ -f $(LOCAL_OnePlusCamera_PROPR_DIR)/lib/$$lib ] && \
	    inst_opcam_outarm_lib="$(OUT)/system/priv-app/OnePlusCamera/lib/arm/$$lib"; \
		cp $(LOCAL_OnePlusCamera_PROPR_DIR)/lib/$$lib $inst_opcam_outarm_lib; \
		echo "Install: $$inst_opcam_outarm_lib"; \
	done

$(LOCAL_MODULE): OnePlusCameraRule
OnePlusCameraBundle: | OnePlusCamera OnePlusCameraLibs
all: $(LOCAL_MODULE)
.PHONY: $(LOCAL_MODULE)

### VENDOR

# lib-imscamera.so
include $(CLEAR_VARS)
LOCAL_MODULE := lib-imscamera
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := system/lib
LOCAL_SRC_FILES := proprietary/vendor/lib/lib-imscamera.so
include $(BUILD_PREBUILT)

# libimscamera_jni.so
include $(CLEAR_VARS)
LOCAL_MODULE := libimscamera_jni
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := system/lib
LOCAL_SRC_FILES := proprietary/vendor/lib/libimscamera_jni.so
include $(BUILD_PREBUILT)

# libimsmedia_jni.so
include $(CLEAR_VARS)
LOCAL_MODULE := libimsmedia_jni
LOCAL_MODULE_SUFFIX :=.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_TAGS := optional
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := system/lib
LOCAL_SRC_FILES := proprietary/vendor/lib/libimsmedia_jni.so
include $(BUILD_PREBUILT)

endif