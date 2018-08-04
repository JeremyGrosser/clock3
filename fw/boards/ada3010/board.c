#include <board.h>
#include <platform.h>
#include <platform/gpio.h>
#include <platform/spi.h>
#include <platform/uart.h>
#include <platform/eic.h>
#include <driver/atw.h>

#include <stdio.h>

gpio_t STATUS_LED = {
	.num	= PIN_PA17,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_HIGH,
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
		.direction		= DIR_IN,
		.drive			= DRIVE_LOW,
		.pull			= PULL_DISABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PA21A_EIC_EXTINT5,
	},
};

eiccfg_t ATW_IRQ_EXTI = {
	.num	= 5,
	.sense	= SENSE_RISE,
	.filter	= FILTER_DISABLE,
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
		.pull			= PULL_DISABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PA12D_SERCOM4_PAD0,
	},
};

gpio_t ATW_SCK = {
	.num	= PIN_PB11,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_DISABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PB11D_SERCOM4_PAD3,
	},
};

gpio_t ATW_CHIP_EN = {
	.num	= PIN_PA14,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_HIGH,
		.pull			= PULL_ENABLE,
		.pmux			= PMUX_DISABLE,
	},
};

gpio_t CONSOLE_TXD = {
	.num	= PIN_PA10,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_ENABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PA10C_SERCOM0_PAD2,
	},
};

gpio_t CONSOLE_RXD = {
	.num	= PIN_PA11,
	.config = {
		.direction		= DIR_IN,
		.drive			= DRIVE_LOW,
		.pull			= PULL_ENABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PA11C_SERCOM0_PAD3,
	},
};

uart_t CONSOLE_UART = {
	.num	= 0,
	.sercom = &SERCOM0->USART,
	.txd	= &CONSOLE_TXD,
	.rxd	= &CONSOLE_RXD,
	.tx_pad = 2,
	.rx_pad	= 3,
};

void wifi_interrupt(void) {
	atw_interrupt(&wifi);
}

void board_init() {
	spi_t spi;
	int err;

	platform_init();

	gpio_setup(&STATUS_LED);
	gpio_write(&STATUS_LED, LED_ON);

	err = uart_init(&CONSOLE_UART);
	if(err != 0) {
		while(1);
	}
	printf("\r\n\r\nada3010 board_init\r\n");

	eic_init();
	eic_attach(&ATW_IRQ_EXTI, &wifi_interrupt);

	spi.num		= 4;
	spi.mosi	= &ATW_MOSI;
	spi.miso	= &ATW_MISO;
	spi.sck		= &ATW_SCK;
	spi.nss		= &ATW_CS;
	spi.miso_pad = 0;
	spi.mosi_pad = 2;
	spi.sck_pad	= 3;

	err = spi_setup(&spi);
	if(err != 0) {
		while(1);
	}

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
