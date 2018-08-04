#ifndef BOARD_H
#define BOARD_H

#include <platform/gpio.h>
#include <platform.h>
#include <driver/atw.h>

#include <stddef.h>

#define LED_ON	1
#define LED_OFF	0

gpio_t STATUS_LED;
atw_t wifi;

void board_init();
void console_write(uint8_t *msg, size_t len);

#endif
