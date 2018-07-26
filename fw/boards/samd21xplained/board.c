#include <board.h>

#include <string.h>
#include <stdio.h>

gpio_t STATUS_LED = {
	.num	= PIN_PB30,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_DISABLE,
	},
};

gpio_t CONSOLE_TXD = {
	.num	= PIN_PA22,
	.config = {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PA22C_SERCOM3_PAD0,
	},
};

gpio_t CONSOLE_RXD = {
	.num	= PIN_PA23,
	.config = {
		.direction	= DIR_IN,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PA23C_SERCOM3_PAD1,
	},
};

uart_t CONSOLE_UART = {
	.num = 3,
	.sercom = &SERCOM3->USART,
	.txd = &CONSOLE_TXD,
	.rxd = &CONSOLE_RXD,
};

void board_init() {
	platform_init();
	uart_init(&CONSOLE_UART);

	printf("board_init\r\n");

	rtc_init();

	//gpio_setup(&STATUS_LED);
	//gpio_write(&STATUS_LED, LED_ON);
}

void console_write(uint8_t *msg, size_t len) {
	uart_write(&CONSOLE_UART, msg, len);
}
