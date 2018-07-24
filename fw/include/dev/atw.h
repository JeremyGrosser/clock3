/*
 * ATWINC1500 Driver
 */
#ifndef ATW_H
#define ATW_H
#include <platform/gpio.h>
#include <platform/spi.h>

struct atw_s {
	spi_t *spi;
	gpio_t *gpio_rst;
	gpio_t *gpio_irq;
	gpio_t *gpio_chip_en;
};
typedef struct atw_s atw_t;

void atw_setup(atw_t *atw);

#endif
