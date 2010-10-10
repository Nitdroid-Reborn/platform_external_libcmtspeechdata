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

#
# check - C unittest framework
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	check/check.c         \
	check/check_error.c   \
	check/check_list.c    \
	check/check_log.c     \
	check/check_msg.c     \
	check/check_pack.c    \
	check/check_print.c   \
	check/check_run.c     \
	check/check_str.c
##

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/check
##

LOCAL_MODULE:=libcheck_static

include $(BUILD_STATIC_LIBRARY)

#
# tests
#

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= test_cmtspeech_msgs.c
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/check
LOCAL_STATIC_LIBRARIES:=libcheck_static
LOCAL_SHARED_LIBRARIES:=libcmtspeechdata
LOCAL_MODULE:=test_cmtspeech_msgs
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= test_cmtspeech.c
LOCAL_C_INCLUDES:=$(LOCAL_PATH)/check
LOCAL_STATIC_LIBRARIES:=libcheck_static
LOCAL_SHARED_LIBRARIES:=libcmtspeechdata
LOCAL_MODULE:=test_cmtspeech
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= utils/cmtspeech_ofono_test.c
LOCAL_C_INCLUDES:= $(call include-path-for, dbus)
LOCAL_SHARED_LIBRARIES:=libcmtspeechdata libdbus
LOCAL_MODULE:=cmtspeech_ofono_test
include $(BUILD_EXECUTABLE)
