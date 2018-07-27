#ifndef BOARD_H
#define BOARD_H

#include <platform/gpio.h>
#include <platform.h>

#include <stddef.h>

#define LED_ON	1
#define LED_OFF	0

extern gpio_t STATUS_LED;

void board_init();
void console_write(uint8_t *msg, size_t len);

#endif
