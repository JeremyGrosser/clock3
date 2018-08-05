TOPDIR=.

CPUS ?= 12
MAKEFLAGS += -j$(CPUS)

#BOARD ?= samd21xplained
BOARD ?= ada3010
TARGET = clock3-$(BOARD)

CFLAGS := -O0 -g -Wall -Werror -std=c11 -ffreestanding
#CFLAGS := -Os -g -Wall -Werror -Wno-unused-variable -std=c11 -ffreestanding
#CFLAGS := -O0 -g -Wall -Werror -std=c11

SRCS := $(wildcard src/*.c)

all: $(TARGET).elf $(TARGET).hex $(TARGET).bin $(TARGET).lst

debug:
	arm-none-eabi-gdb --command=.gdbinit $(TARGET).elf

include make/macros.mk
include boards/$(BOARD)/build.mk
include driver/ht16k33/build.mk
include make/toolchain.mk
