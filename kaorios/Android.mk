LOCAL_PATH := $(call my-dir)

# Kaorios-Toolbox priv-app (presigned by Kousei). Framework hooks live in
# framework.jar/services.jar; this is the on-device configurator UI.
include $(CLEAR_VARS)
LOCAL_MODULE := KaoriosToolbox
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_BUILT_MODULE_STEM := package.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SRC_FILES := priv-app/KaoriosToolbox/KaoriosToolbox.apk
LOCAL_MODULE_TARGET_ARCH := arm64
LOCAL_PREBUILT_JNI_LIBS := \
    @lib/arm64-v8a/libandroidx.graphics.path.so \
    @lib/arm64-v8a/libdatastore_shared_counter.so
LOCAL_DEX_PREOPT := false
LOCAL_ENFORCE_USES_LIBRARIES := false
include $(BUILD_PREBUILT)
