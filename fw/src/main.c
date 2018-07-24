#include <dev/gpio.h>
#include <board.h>

#include <stdint.h>

int main(void) {
	board_init();
	gpio_setup(STATUS_LED);

	while(1) {
		gpio_write(STATUS_LED, !gpio_read(STATUS_LED));
	}

	return 0;
}
