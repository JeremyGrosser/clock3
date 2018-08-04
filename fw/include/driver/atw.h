/*
 * ATWINC1500 Driver
 */
#ifndef ATW_H
#define ATW_H
#include <platform/gpio.h>
#include <platform/spi.h>

typedef void *(*atw_irq_handler_t)(void);

struct atw_s {
	spi_t *spi;
	gpio_t *gpio_rst;
	gpio_t *gpio_irq;
	gpio_t *gpio_chip_en;

	atw_irq_handler_t irq_handler;
	int irq_enabled;
};
typedef struct atw_s atw_t;

int atw_setup(atw_t *atw);
void atw_systick(atw_t *atw);
void atw_interrupt(atw_t *atw);
int atw_connect_wpa(atw_t *atw, uint8_t *ssid, size_t ssid_len, uint8_t *psk, size_t psk_len);

#endif
