#ifndef BOARD_H
#define BOARD_H

#include <platform.h>
#include <platform/gpio.h>

static gpio_t STATUS_LED = {
	.num	= PIN_PB30,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_ENABLE,
		.pmux		= PMUX_DISABLE,
	},
};

#define LED_ON	0
#define LED_OFF	1

void board_init();

#endif
