LOCAL_DIR := $(GET_LOCAL_DIR)

CFLAGS += -I$(LOCAL_DIR)

SRCS += $(LOCAL_DIR)/atw.c

include $(TOPDIR)/third_party/winc1500/build.mk
