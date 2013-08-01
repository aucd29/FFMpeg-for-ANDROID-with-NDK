LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

include $(LOCAL_PATH)/../config.mak

OBJS :=
OBJS-yes :=
include $(LOCAL_PATH)/Makefile
include $(LOCAL_PATH)/$(ARCH)/Makefile
include $(LOCAL_PATH)/Makefile2

include $(LOCAL_PATH)/../common.mk

LOCAL_MODULE := lib$(NAME)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/..

LOCAL_CFLAGS := $(COMMON_CFLAGS)

#LOCAL_SHORT_COMMANDS := true

NEON_ADD_C := aacdec.c
FFFILES := $(filter-out $(NEON_ADD_C),$(FFFILES))
NEON_ADD_C := $(NEON_ADD_C:.c=.c.neon)
LOCAL_SRC_FILES := $(FFFILES) $(NEON_ADD_C) \
	$(ARCH)/ac3dsp_armv6.S \
	$(ARCH)/mpegaudiodsp_fixed_armv6.S \
	$(ARCH)/vp8_armv6.S \
	$(ARCH)/vp8dsp_armv6.S \
	$(ARCH)/dsputil_armv6.S \
	$(ARCH)/simple_idct_armv6.S \
	$(ARCH)/hpeldsp_armv6.S \
	\
	$(ARCH)/aacpsdsp_neon.S \
	$(ARCH)/ac3dsp_neon.S \
	$(ARCH)/dcadsp_neon.S \
	$(ARCH)/dsputil_neon.S \
	$(ARCH)/fft_fixed_neon.S \
	$(ARCH)/fft_neon.S \
	$(ARCH)/fmtconvert_neon.S \
	$(ARCH)/h264cmc_neon.S \
	$(ARCH)/h264dsp_neon.S \
	$(ARCH)/h264idct_neon.S \
	$(ARCH)/h264pred_neon.S \
	$(ARCH)/h264qpel_neon.S \
	$(ARCH)/hpeldsp_neon.S \
	$(ARCH)/int_neon.S \
	$(ARCH)/mdct_fixed_neon.S \
	$(ARCH)/mdct_neon.S \
	$(ARCH)/mpegvideo_neon.S \
	$(ARCH)/rdft_neon.S \
	$(ARCH)/rv34dsp_neon.S \
	$(ARCH)/rv40dsp_neon.S \
	$(ARCH)/sbrdsp_neon.S \
	$(ARCH)/simple_idct_neon.S \
	$(ARCH)/synth_filter_neon.S \
	$(ARCH)/vorbisdsp_neon.S \
	$(ARCH)/vp3dsp_neon.S \
	$(ARCH)/vp8dsp_neon.S \
	$(ARCH)/vp56dsp_neon.S \
	$(ARCH)/fmtconvert_vfp.S \
	\
	$(ARCH)/videodsp_armv5te.S \
	$(ARCH)/simple_idct_armv5te.S \
	\
	$(ARCH)/dsputil_init_armv5te.c \
	$(ARCH)/dsputil_init_armv6.c \
	$(ARCH)/dsputil_init_neon.c \
	$(ARCH)/hpeldsp_init_neon.c \
	$(ARCH)/hpeldsp_init_armv6.c \
	$(ARCH)/mpegvideo_armv5te.c \
	$(ARCH)/videodsp_init_armv5te.c \
	$(ARCH)/vp8dsp_init_armv6.c \
	$(ARCH)/vp8dsp_init_neon.c \
	$(ARCH)/mpegvideo_armv5te_s.S

LOCAL_ARM_MODE := arm

LOCAL_STATIC_LIBRARIES := $(foreach,NAME,$(FFLIBS),lib$(NAME)) cpufeatures

include $(BUILD_STATIC_LIBRARY)

$(call import-module,android/cpufeatures)
