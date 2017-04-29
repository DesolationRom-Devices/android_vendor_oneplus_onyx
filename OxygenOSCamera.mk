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

# libopcameralib.so

include $(CLEAR_VARS)
LOCAL_MODULE := libopcameralib
LOCAL_SRC_FILES := proprietary/lib/libopcameralib.so
include $(PREBUILT_SHARED_LIBRARY)

# libopcamera.so

include $(CLEAR_VARS)
LOCAL_MODULE := libopcamera
LOCAL_SRC_FILES := proprietary/lib/libopcamera.so
include $(PREBUILT_SHARED_LIBRARY)


### PRIV-APP

# OnePlusCamera.apk
include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := OnePlusCamera
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_SRC_FILES := proprietary/priv-app/OnePlusCamera/OnePlusCamera.apk
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := Snap Camera Camera2 SnapdragonCamera
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
include $(BUILD_PREBUILT)

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