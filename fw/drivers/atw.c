#include <dev/atw.h>

void atw_setup(atw_t *atw) {
	gpio_setup(atw->gpio_chip_en);
	gpio_write(atw->gpio_chip_en, 0);

	gpio_setup(atw->gpio_rst);
	gpio_write(atw->gpio_rst, 0);

	gpio_setup(atw->gpio_irq);

	spi_setup(atw->spi);
}
