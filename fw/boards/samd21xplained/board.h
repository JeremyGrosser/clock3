#ifndef BOARD_H
#define BOARD_H

#include <samd21.h>
#include <system_samd21.h>
#include <cmsis_gcc.h>

#include <dev/gpio.h>


struct pincfg_s {
	enum {
		DIR_IN	= 0,
		DIR_OUT	= 1,
	} direction;
	enum {
		DRIVE_LOW	= 0,
		DRIVE_HIGH	= 1,
	} drive;
	enum {
		PULL_DISABLE	= 0,
		PULL_ENABLE		= 1,
	} pull;
	enum {
		PMUX_DISABLE	= 0,
		PMUX_ENABLE		= 1,
	} pmux;
	enum {
		PMUX_A	= 0,
		PMUX_B	= 1,
		PMUX_C	= 2,
		PMUX_D	= 3,
		PMUX_E	= 4,
		PMUX_F	= 5,
		PMUX_G	= 6,
		PMUX_H	= 7,
	} pmux_function;
};

struct gpio_s {
	uint32_t num;
	pincfg_t config;

	uint32_t port;
	uint32_t pin;
	uint32_t mask;
};

static gpio_t STATUS_LED = {
	.num	= PIN_PB30,
	.config	= {
		.direction	= DIR_OUT,
		.drive		= DRIVE_LOW,
		.pull		= PULL_DISABLE,
		.pmux		= PMUX_DISABLE,
	},
};

void board_init();

#endif
