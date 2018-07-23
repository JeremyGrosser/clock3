LOCAL_DIR := $(GET_LOCAL_DIR)

PLATFORM := arm-none-eabi
CC := $(PLATFORM)-gcc
LD := $(CC)
OBJCOPY := $(PLATFORM)-objcopy
OBJDUMP := $(PLATFORM)-objdump

CMSIS := $(TOPDIR)/third_party/CMSIS

CFLAGS += -march=armv7-m \
		  -DSTM32L152xE \
		  -I$(LOCAL_DIR)

SRCS += $(LOCAL_DIR)/system.c

LDSCRIPT ?= $(CMSIS)/Device/ST/STM32L1xx/Source/Templates/gcc/linker/STM32L152XE_FLASH.ld

include $(CMSIS)/build.mk
include $(CMSIS)/Device/ST/STM32L1xx/build.mk
include $(TOPDIR)/third_party/STM32L1xx_HAL_Driver/build.mk
