#include <platform/spi.h>
#include <platform/gpio.h>
#include <platform.h>

void spi_setup(spi_t *spi) {
	gpio_setup(spi->mosi);
	gpio_setup(spi->miso);
	gpio_setup(spi->sck);
	gpio_setup(spi->nss);

	// Enable Master Slave Select
	spi->sercom->CTRLB.bit.MSSEN = 1;
}

int spi_write(spi_t *spi, uint8_t *data, size_t len) {
	return -1;
}

int spi_read(spi_t *spi, uint8_t *data, size_t len) {
	return -1;
}
