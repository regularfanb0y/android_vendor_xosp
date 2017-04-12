LOCAL_PATH := $(call my-dir)

$(shell ./changelog)

include $(CLEAR_VARS)

LOCAL_MODULE := Changelog
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/system/etc/
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(Changelog)
include $(BUILD_PREBUILT)

LOCAL_MODULE := Current_Version
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/system/etc/
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(Current_Version)
include $(BUILD_PREBUILT)

$(shell rm "$Current_Version")
$(shell rm "$Current_Version")
