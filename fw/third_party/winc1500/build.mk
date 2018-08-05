LOCAL_DIR := $(GET_LOCAL_DIR)

CFLAGS += -I$(LOCAL_DIR) \
		  -I$(LOCAL_DIR)/bus_wrapper/include \
		  -I$(LOCAL_DIR)/driver/include

SRCS += $(LOCAL_DIR)/common/source/nm_common.c \
		$(LOCAL_DIR)/spi_flash/source/spi_flash.c \
		$(LOCAL_DIR)/driver/source/nmspi.c \
		$(LOCAL_DIR)/driver/source/nmbus.c \
		$(LOCAL_DIR)/driver/source/nmasic.c \
		$(LOCAL_DIR)/driver/source/nmdrv.c \
		$(LOCAL_DIR)/driver/source/m2m_wifi.c \
		$(LOCAL_DIR)/driver/source/m2m_hif.c \
		$(LOCAL_DIR)/driver/source/m2m_periph.c \
		$(LOCAL_DIR)/socket/source/socket_buffer.c \
		$(LOCAL_DIR)/socket/source/socket.c
