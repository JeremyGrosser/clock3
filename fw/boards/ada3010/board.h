#ifndef BOARD_H
#define BOARD_H

#include <platform.h>
#include <platform/gpio.h>

#define LED_ON	1
#define LED_OFF	0

static gpio_t STATUS_LED = {
	.num	= PIN_PB11,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_DISABLE,
	},
};

static gpio_t ATW_CS = {
	.num	= PIN_PA06,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_DISABLE,
	},
};

static gpio_t ATW_RST = {
	.num	= PIN_PA08,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_DISABLE,
	},
};

static gpio_t ATW_IRQ = {
	.num	= PIN_PA08,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_DISABLE,
	},
};

static gpio_t ATW_MOSI = {
	.num	= PIN_PB10,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_DISABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PB10D_SERCOM4_PAD2,
	},
};

static gpio_t ATW_MISO = {
	.num	= PIN_PA12,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_DISABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PA12D_SERCOM4_PAD0,
	},
};

static gpio_t ATW_SCK = {
	.num	= PIN_PB11,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_DISABLE,
		.pmux			= PMUX_ENABLE,
		.pmux_function	= MUX_PB11D_SERCOM4_PAD3,
	},
};

static gpio_t ATW_CHIP_EN = {
	.num	= PIN_PA14,
	.config = {
		.direction		= DIR_OUT,
		.drive			= DRIVE_LOW,
		.pull			= PULL_DISABLE,
		.pmux			= PMUX_DISABLE,
	},
};

void board_init();

#endif
