#ifndef BOARD_H
#define BOARD_H

#include <platform.h>
#include <platform/gpio.h>
#include <platform/uart.h>
#include <platform/rtc.h>

#define LED_ON	0
#define LED_OFF	1

extern gpio_t STATUS_LED;
extern gpio_t CONSOLE_TXD;
extern gpio_t CONSOLE_RXD;
extern uart_t CONSOLE_UART;

void board_init();
void console_write(uint8_t *msg, size_t len);

#endif
