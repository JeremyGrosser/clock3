#include <board.h>

void board_init() {
	platform_init();

	gpio_setup(&STATUS_LED);
	gpio_write(&STATUS_LED, LED_ON);
}
