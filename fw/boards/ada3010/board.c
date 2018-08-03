#include <board.h>
#include <platform.h>
#include <platform/gpio.h>
#include <platform/spi.h>
#include <platform/uart.h>
#include <driver/atw.h>

gpio_t STATUS_LED = {
	.num	= PIN_PA17,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_DISABLE,
	},
};

gpio_t ATW_CS = {
	.num	= PIN_PA06,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_DISABLE,
	},
};

gpio_t ATW_RST = {
	.num	= PIN_PA08,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_DISABLE,
	},
};

gpio_t ATW_IRQ = {
	.num	= PIN_PA21,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_DISABLE,
	},
};

gpio_t ATW_MOSI = {
	.num	= PIN_PB10,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_ENABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PB10D_SERCOM4_PAD2,
	},
};

gpio_t ATW_MISO = {
	.num	= PIN_PA12,
	.config = {
		.direction		= DIR_IN,
		.drive			= DRIVE_LOW,
		.pull			= PULL_ENABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PA12D_SERCOM4_PAD0,
	},
};

gpio_t ATW_SCK = {
	.num	= PIN_PB11,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_ENABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PB11D_SERCOM4_PAD3,
	},
};

gpio_t ATW_CHIP_EN = {
	.num	= PIN_PA14,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_ENABLE,
		.pmux			= PMUX_DISABLE,
	},
};

gpio_t CONSOLE_TXD = {
	.num	= PIN_PB22,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_DISABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PB22D_SERCOM5_PAD2,
	},
};

gpio_t CONSOLE_RXD = {
	.num	= PIN_PB23,
	.config = {
		.direction		= DIR_IN,
		.drive			= DRIVE_LOW,
		.pull			= PULL_DISABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PB23D_SERCOM5_PAD3,
	},
};

uart_t CONSOLE_UART = {
	.num	= 5,
	.sercom = &SERCOM5->USART,
	.txd	= &CONSOLE_TXD,
	.rxd	= &CONSOLE_RXD,
	.tx_pad = 2,
	.rx_pad	= 3,
};

static atw_t wifi;

void board_init() {
	spi_t spi;

	platform_init();

	gpio_setup(&STATUS_LED);
	gpio_write(&STATUS_LED, LED_ON);

	spi.num		= 4;
	spi.mosi	= &ATW_MOSI;
	spi.miso	= &ATW_MISO;
	spi.sck		= &ATW_SCK;
	spi.nss		= &ATW_CS;
	spi.miso_pad = 0;
	spi.mosi_pad = 2;
	spi.sck_pad	= 3;

	spi_setup(&spi);

	wifi.spi			= &spi;
	wifi.gpio_rst		= &ATW_RST;
	wifi.gpio_irq		= &ATW_IRQ;
	wifi.gpio_chip_en	= &ATW_CHIP_EN;

	atw_setup(&wifi);
}

void console_write(uint8_t *msg, size_t len) {
	uart_write(&CONSOLE_UART, msg, len);
}

void SERCOM4_Handler() {
	spi_interrupt(wifi.spi);
}
