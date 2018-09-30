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
	.num	= 3,
	.txd	= &CONSOLE_TXD,
	.rxd	= &CONSOLE_RXD,
	.tx_pad = 0,
	.rx_pad = 1,
};

gpio_t I2C_SDA = {
	.num	= PIN_PA08,
	.config = {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PA08C_SERCOM0_PAD0,
	},
};

gpio_t I2C_SCL = {
	.num	= PIN_PA09,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PA09C_SERCOM0_PAD1,
	},
};

i2c_t DISPLAY_I2C = {
	.num	= 0,
	.scl	= &I2C_SCL,
	.sda	= &I2C_SDA,
};

int board_init() {
	platform_init();
	uart_init(&CONSOLE_UART);

	// ANSI clear sequence
	printf("\033[2J\033[0;0H");
	printf("\r\nboard_init\r\n");

	rtc_init();
	i2c_init(&DISPLAY_I2C);

	//gpio_setup(&STATUS_LED);
	//gpio_write(&STATUS_LED, LED_ON);
	
	return 0;
}

void console_write(uint8_t *msg, size_t len) {
	uart_write(&CONSOLE_UART, msg, len);
}
