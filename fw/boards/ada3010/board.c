#include <board.h>
#include <platform.h>
#include <platform/gpio.h>
#include <platform/spi.h>
#include <platform/rtc.h>
#include <platform/i2c.h>
//#include <platform/uart.h>
//#include <driver/atw/atw.h>

#include <stdio.h>

void wifi_interrupt(void) {
	atw_interrupt(&wifi);
}

gpio_t STATUS_LED = {
	.num	= PIN_PA17,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_HIGH,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_DISABLE,
	},
};

gpio_t BUTTON0 = {
	.num	= PIN_PA02,
	.config	= {
		.direction	= DIR_IN,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PA02A_EIC_EXTINT2,
	},
	.interrupt = {
		.num	= 2,
		.sense	= SENSE_RISE,
		.filter	= FILTER_ENABLE,
		.function = &button0_interrupt,
	},
};

gpio_t BUTTON1 = {
	.num	= PIN_PB08,
	.config	= {
		.direction	= DIR_IN,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PB08A_EIC_EXTINT8,
	},
	.interrupt = {
		.num	= 8,
		.sense	= SENSE_RISE,
		.filter	= FILTER_ENABLE,
		.function = &button1_interrupt,
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
		.pull			= PULL_ENABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PA21A_EIC_EXTINT5,
	},
	.interrupt = {
		.num	= 5,
		.sense	= SENSE_RISE,
		.filter	= FILTER_DISABLE,
		.function = &wifi_interrupt,
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

/*
gpio_t CONSOLE_TXD = {
	.num	= PIN_PA10,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_HIGH,
		.pull			= PULL_ENABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PA10C_SERCOM0_PAD2,
	},
};

gpio_t CONSOLE_RXD = {
	.num	= PIN_PA11,
	.config = {
		.direction		= DIR_IN,
		.drive			= DRIVE_HIGH,
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
*/

gpio_t I2C_SDA = {
	.num	= PIN_PA22,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PA22C_SERCOM3_PAD0,
	},
};

gpio_t I2C_SCL = {
	.num	= PIN_PA23,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_ENABLE,
		.pmux_function = MUX_PA23C_SERCOM3_PAD1,
	},
};

i2c_t DISPLAY_I2C = {
	.num = 3,
	.scl = &I2C_SCL,
	.sda = &I2C_SDA,
};

int board_init() {
	spi_t spi;
	int err;

	platform_init();

	gpio_setup(&STATUS_LED);
	gpio_write(&STATUS_LED, LED_ON);

	/*
	err = uart_init(&CONSOLE_UART);
	if(err != 0) {
		return err;
	}
	*/
	printf("\033[2J\033[0;0H");
	printf("\r\n\r\nada3010 board_init\r\n");

	rtc_init();
	i2c_init(&DISPLAY_I2C);

	gpio_setup(&BUTTON0);
	gpio_setup(&BUTTON1);
	gpio_write(&BUTTON0, 0);
	gpio_write(&BUTTON1, 0);

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
		return err;
	}

	gpio_setup(&ATW_CHIP_EN);
	gpio_write(&ATW_CHIP_EN, 0);

	wifi.spi			= &spi;
	wifi.gpio_rst		= &ATW_RST;
	wifi.gpio_irq		= &ATW_IRQ;
	wifi.gpio_chip_en	= &ATW_CHIP_EN;

	/*
	err = atw_setup(&wifi);
	if(err != 0) {
		return err;
	}
	*/

	return 0;
}

void console_write(uint8_t *msg, size_t len) {
	//uart_write(&CONSOLE_UART, msg, len);
}

int console_read(uint8_t *msg, size_t maxlen) {
	//return uart_read(&CONSOLE_UART, msg, maxlen);
	return -1;
}

void SERCOM4_Handler() {
	spi_interrupt(wifi.spi);
}
