#ifndef BOARD_H
#define BOARD_H

#include <platform.h>
#include <platform/gpio.h>
#include <platform/uart.h>
#include <platform/i2c.h>
#include <platform/rtc.h>

#define LED_ON	0
#define LED_OFF	1

#define DISPLAY_ADDR	0xE0

extern gpio_t STATUS_LED;
extern gpio_t CONSOLE_TXD;
extern gpio_t CONSOLE_RXD;
extern uart_t CONSOLE_UART;
extern i2c_t DISPLAY_I2C;

int board_init();
void console_write(uint8_t *msg, size_t len);

#endif
