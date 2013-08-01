LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

include $(LOCAL_PATH)/../config.mak

OBJS :=
OBJS-yes :=
include $(LOCAL_PATH)/Makefile

include $(LOCAL_PATH)/../common.mk

LOCAL_MODULE := lib$(NAME)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_CFLAGS := $(COMMON_CFLAGS)

LOCAL_SRC_FILES := $(FFFILES) \
	$(ARCH)/asm.S \
	$(ARCH)/float_dsp_neon.S \
	$(ARCH)/float_dsp_vfp.S \
	$(ARCH)/cpu.c \
	$(ARCH)/float_dsp_init_arm.c \
	$(ARCH)/float_dsp_init_neon.c \
	$(ARCH)/float_dsp_init_vfp.c \
	$(ARCH)/float_dsp_vfp.S


LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := $(foreach,NAME,$(FFLIBS),lib$(NAME))

include $(BUILD_STATIC_LIBRARY)
