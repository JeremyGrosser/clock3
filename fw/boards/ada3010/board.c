#include <board.h>
#include <platform.h>
#include <platform/gpio.h>
#include <platform/spi.h>
#include <dev/atw.h>

void board_init() {
	spi_t spi;
	atw_t wifi;

	platform_init();

	gpio_setup(&STATUS_LED);
	gpio_write(&STATUS_LED, LED_ON);

	spi.sercom	= &SERCOM4->SPI;
	spi.mosi	= &ATW_MOSI;
	spi.miso	= &ATW_MISO;
	spi.sck		= &ATW_SCK;
	spi.nss		= &ATW_CS;

	wifi.spi			= &spi;
	wifi.gpio_rst		= &ATW_RST;
	wifi.gpio_irq		= &ATW_IRQ;
	wifi.gpio_chip_en	= &ATW_CHIP_EN;

	atw_setup(&wifi);
}
