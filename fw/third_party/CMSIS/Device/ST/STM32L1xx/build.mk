LOCAL_DIR := $(GET_LOCAL_DIR)

CFLAGS += -I$(LOCAL_DIR)/Include

SRCS += $(LOCAL_DIR)/Source/Templates/gcc/startup_stm32l152xe.s
