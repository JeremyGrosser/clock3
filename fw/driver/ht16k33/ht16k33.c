#include <platform/i2c.h>
#include <platform.h>

#include <driver/ht16k33.h>

#include <string.h>

static int ht16k33_writereg(ht16k33_t *dev, uint8_t reg, uint8_t value) {
	uint8_t data = (reg | value);
	return i2c_write(dev->i2c, dev->i2c_addr, &data, 1);
}

int ht16k33_setup(ht16k33_t *dev) {
	int err;
	int i;
	uint8_t data[17];

	// Enable system oscillator
	err = ht16k33_writereg(dev, HT16K33_REG_SYS, HT16K33_SYS_ENABLE);
	if(err != 0) {
		return err;
	}

	// Enable the display
	err = ht16k33_writereg(dev, HT16K33_REG_DISPLAY, HT16K33_DISPLAY_ON);
	if(err != 0) {
		return err;
	}

	i = 0;
	while(1) {
		if((get_ticks() % 100) != 0) {
			continue;
		}
		i = (i + 1) % 6;
		memset(data, (1 << i), 17);
		data[0] = 0x00;
		err = i2c_write(dev->i2c, dev->i2c_addr, data, 17);
		if(err != 0) {
			return err;
		}
	}

	return 0;
}
