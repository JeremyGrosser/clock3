#ifndef BOARD_H
#define BOARD_H

#include <platform.h>
#include <platform/gpio.h>
#include <platform/uart.h>

#define LED_ON	0
#define LED_OFF	1

static gpio_t STATUS_LED = {
	.num	= PIN_PB30,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_DISABLE,
	},
};

static gpio_t CONSOLE_TXD = {
	.num	= PIN_PA22,
	.config = {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PA22C_SERCOM3_PAD0,
	},
};

static gpio_t CONSOLE_RXD = {
	.num	= PIN_PA23,
	.config = {
		.direction	= DIR_IN,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PA23C_SERCOM3_PAD1,
	},
};

static uart_t CONSOLE_UART = {
	.num = 3,
	.sercom = &SERCOM3->USART,
	.txd = &CONSOLE_TXD,
	.rxd = &CONSOLE_RXD,
};

void board_init();
void console_write(uint8_t *msg, size_t len);

#endif
