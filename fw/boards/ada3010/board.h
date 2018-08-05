#ifndef BOARD_H
#define BOARD_H

#include <platform/gpio.h>
#include <platform/i2c.h>
#include <platform.h>
#include <driver/atw.h>

#include <stddef.h>

#define LED_ON	1
#define LED_OFF	0

#define DISPLAY_ADDR 0x70

gpio_t STATUS_LED;
atw_t wifi;
i2c_t DISPLAY_I2C;

void board_init();
void console_write(uint8_t *msg, size_t len);

#endif
