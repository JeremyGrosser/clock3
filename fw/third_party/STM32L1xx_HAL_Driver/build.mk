LOCAL_DIR := $(GET_LOCAL_DIR)

CFLAGS += -I$(LOCAL_DIR)/Inc

SRCS += $(wildcard $(LOCAL_DIR)/Src/*.c)
