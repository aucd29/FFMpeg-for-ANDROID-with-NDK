LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libffmpeg
LOCAL_CFLAGS=-D__STDC_CONSTANT_MACROS
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../ffmpeg/ \
                    $(LOCAL_PATH)/../ffmpeg/libavcodec \
					$(LOCAL_PATH)/../ffmpeg/libavfilter \
                    $(LOCAL_PATH)/../ffmpeg/libavformat \
                    $(LOCAL_PATH)/../ffmpeg/libswscale \
					$(LOCAL_PATH)/../ffmpeg/libavutil

LOCAL_STATIC_LIBRARIES := libavfilter libavformat libavcodec libswscale libavutil cpufeatures
LOCAL_LDLIBS := -lz -ljnigraphics -llog

LOCAL_ARM_MODE := arm

include $(BUILD_SHARED_LIBRARY)

$(call import-module,android/cpufeatures)
