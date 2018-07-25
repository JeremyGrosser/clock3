#include <board.h>

#include <string.h>
#include <stdio.h>

void board_init() {
	platform_init();
	uart_init(&CONSOLE_UART);

	printf("board_init\r\n");

	gpio_setup(&STATUS_LED);
	gpio_write(&STATUS_LED, LED_ON);
}

void console_write(uint8_t *msg, size_t len) {
	uart_write(&CONSOLE_UART, msg, len);
}
