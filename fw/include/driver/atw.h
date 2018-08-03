/*
 * ATWINC1500 Driver
 */
#ifndef ATW_H
#define ATW_H
#include <platform/gpio.h>
#include <platform/spi.h>
#include <stdio.h>

#define CONF_WINC_DEBUG		1
#define CONF_WINC_PRINTF	printf

typedef void *(*atw_irq_handler_t)(void);

struct atw_s {
	spi_t *spi;
	gpio_t *gpio_rst;
	gpio_t *gpio_irq;
	gpio_t *gpio_chip_en;

	atw_irq_handler_t irq_handler;
	uint8_t irq_enabled;
};
typedef struct atw_s atw_t;

int atw_setup(atw_t *atw);
void atw_systick(atw_t *atw);
void atw_interrupt(atw_t *atw);

#endif
