TOPDIR=.

CPUS ?= 12
MAKEFLAGS += -j$(CPUS)

BOARD ?= stm32l152re
TARGET = clock3-$(BOARD)

CFLAGS := -O0 -g -Wall -Werror -Wno-unused-variable -std=c11 -flto -fdata-sections -ffunction-sections
#CFLAGS := -O0 -g -Wall -Werror -std=c11

SRCS := $(wildcard src/*.c)

all: $(TARGET).elf $(TARGET).hex $(TARGET).bin $(TARGET).lst

debug:
	arm-none-eabi-gdb --command=.gdbinit $(TARGET).elf

include make/macros.mk
include boards/$(BOARD)/build.mk
include make/toolchain.mk
