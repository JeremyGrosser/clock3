#include <platform/spi.h>
#include <platform/gpio.h>
#include <platform.h>

static uint8_t spi_baud(uint32_t baud) {
	float result;
	result = (((float)SystemCoreClock / (2.0 * (float)baud)) - 1.0);
	return (uint8_t)result;
}

void spi_setup(spi_t *spi) {
	gpio_setup(spi->mosi);
	gpio_setup(spi->miso);
	gpio_setup(spi->sck);
	gpio_setup(spi->nss);

	// Disable and reset
	spi->sercom->CTRLA.reg = SERCOM_SPI_CTRLA_SWRST;
	while(spi->sercom->SYNCBUSY.reg);

	// MODE0: CPOL=0 CPHA=0
	// MSB first DORD=0
	// No addressing FORM=0
	spi->sercom->CTRLA.reg = (
			SERCOM_SPI_CTRLA_MODE_SPI_MASTER |
			SERCOM_SPI_CTRLA_DOPO(spi->mosi_pad) |
			SERCOM_SPI_CTRLA_DIPO(spi->miso_pad) |
			~SERCOM_SPI_CTRLA_DORD |
			~SERCOM_SPI_CTRLA_CPOL |
			~SERCOM_SPI_CTRLA_CPHA |
			SERCOM_SPI_CTRLA_FORM(0));

	// 8-bits per character CHSIZE=8
	spi->sercom->CTRLB.reg = (
			SERCOM_SPI_CTRLB_CHSIZE(8) |
			SERCOM_SPI_CTRLB_RXEN);
	while(spi->sercom->SYNCBUSY.bit.CTRLB);

	// Note: Selected baud must be <= (SystemCoreClock / 2)
	spi->sercom->BAUD.bit.BAUD = spi_baud(SystemCoreClock / 2);

	// Enable
	spi->sercom->CTRLA.bit.ENABLE = 1;
	while(spi->sercom->SYNCBUSY.bit.ENABLE);
}

void spi_begin(spi_t *spi) {
	gpio_write(spi->nss, 0);
}

uint32_t spi_transfer(spi_t *spi, uint32_t data) {
	spi->sercom->DATA.bit.DATA = data;
	while(!spi->sercom->INTFLAG.bit.RXC);
	return spi->sercom->DATA.bit.DATA;
}

void spi_end(spi_t *spi) {
	gpio_write(spi->nss, 1);
}
