LOCAL_DIR := $(GET_LOCAL_DIR)

PLATFORM := arm-none-eabi
CC := $(PLATFORM)-gcc
LD := $(CC)
OBJCOPY := $(PLATFORM)-objcopy
OBJDUMP := $(PLATFORM)-objdump

CMSIS := $(TOPDIR)/third_party/CMSIS

CFLAGS += -march=armv6-m \
		  -D__SAMD21J18A__ \
		  -I$(LOCAL_DIR)

SRCS += $(LOCAL_DIR)/sysclk.c \
		$(LOCAL_DIR)/gpio.c \
		$(LOCAL_DIR)/board.c

LDSCRIPT ?= $(CMSIS)/Device/ATMEL/SAMD21/source/gcc/samd21j18a_flash.ld

include $(CMSIS)/build.mk
include $(CMSIS)/Device/ATMEL/SAMD21/build.mk
