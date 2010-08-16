# Copyright (C) 2010 The NitDroid Project
# Copyright (C) 2008,2009,2010 Nokia Corporation
#
# Contact: Alexey Roslyakov <alexey.roslyakov@newsycat.com>
#
# Licensed under LGPL. See file COPYING.
#

#
# libcmtspeechdata
#

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	cmtspeech_msgs.c \
	cmtspeech_backend_common.c \
	sal_debug.c \
	cmtspeech_nokiamodem.c \
##

LOCAL_C_INCLUDES := \
	$(KERNEL_HEADERS) \
##

LOCAL_MODULE:=libcmtspeechdata
LOCAL_PRELINK_MODULE:=false

include $(BUILD_SHARED_LIBRARY)
