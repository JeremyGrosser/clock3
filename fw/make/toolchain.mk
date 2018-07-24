BUILDDIR ?= $(TOPDIR)/build/$(TARGET)

LDFLAGS += -Wl,-gc-sections,-Map=$(TARGET).map,--cref
ifneq ($(LDSCRIPT),)
	LDFLAGS := $(LDFLAGS),-T,$(LDSCRIPT)
endif
CFLAGS += -I$(TOPDIR)/include

OBJS := $(SRCS:%.c=%.c.o)
OBJS := $(OBJS:%.s=%.s.o)
OBJS := $(addprefix $(BUILDDIR)/,$(OBJS))

%.elf: $(OBJS)
	@echo "    LD $@"
	@$(LD) $(CFLAGS) $(LDFLAGS) -o $@ $^

%.bin: %.elf
	@echo "   BIN $@"
	@$(OBJCOPY) $< -O binary $@

%.hex: %.elf
	@echo "   HEX $@"
	@$(OBJCOPY) $< -O ihex $@

%.lst: %.elf
	@echo "   LST $@"
	@$(OBJDUMP) -d $< >$@

$(OBJS): $(BUILDDIR)/%.o: %
	@echo "    CC $<"
	@mkdir -p $(shell dirname $@)
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@echo " CLEAN $(TARGET)"
	@rm -rf $(BUILDDIR) $(TARGET).elf $(TARGET).bin $(TARGET).hex $(TARGET).map $(TARGET).lst
