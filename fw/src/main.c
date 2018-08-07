#include <platform/gpio.h>
#include <platform/i2c.h>
#include <platform/rtc.h>
#include <platform.h>
#include <board.h>

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include <sys/time.h>
#include <errno.h>

#include <driver/ht16k33/ht16k33.h>
//#include <driver/atw/atw.h>

#define CONSOLE_MAXLEN 128
uint8_t console_buf[CONSOLE_MAXLEN] = {0};
uint8_t *console_ptr = console_buf;
size_t console_avail = CONSOLE_MAXLEN;

void process_command(uint8_t *line, size_t len) {
	printf("command[%d]: %s\r\n", len, line);
}

static void console_loop(void) {
	uint8_t *eol;
	int err;

	err = console_read(console_ptr, console_avail);
	if(err <= 0) {
		return;
	}

	console_ptr += err;
	console_avail -= err;

	eol = (uint8_t *)memchr(console_buf, '\n', CONSOLE_MAXLEN);
	if(eol != NULL) {
		process_command(console_buf, (eol - console_buf));
		memset(console_buf, 0x00, CONSOLE_MAXLEN);
		console_ptr = console_buf;
		console_avail = CONSOLE_MAXLEN;
	}else if(console_avail == 0) {
		printf("console buffer overflow!\r\n\r\n");
		memset(console_buf, 0x00, CONSOLE_MAXLEN);
		console_ptr = console_buf;
		console_avail = CONSOLE_MAXLEN;
	}
}

void display_time(ht16k33_t *display, struct tm *now) {
	if(now->tm_hour > 0) {
		ht16k33_set(display, ht16k33_column[0], ht16k33_digit[now->tm_hour / 10]);
		ht16k33_set(display, ht16k33_column[1], ht16k33_digit[now->tm_hour % 10]);
	}else{
		ht16k33_set(display, ht16k33_column[0], ht16k33_digit[0]);
		ht16k33_set(display, ht16k33_column[1], ht16k33_digit[0]);
	}

	if(now->tm_min > 0) {
		ht16k33_set(display, ht16k33_column[2], ht16k33_digit[now->tm_min / 10]);
		ht16k33_set(display, ht16k33_column[3], ht16k33_digit[now->tm_min % 10]);
	}else{
		ht16k33_set(display, ht16k33_column[2], ht16k33_digit[0]);
		ht16k33_set(display, ht16k33_column[3], ht16k33_digit[0]);
	}
	ht16k33_set(display, ht16k33_column[4], ht16k33_colon);

	ht16k33_flush(display);
}

int main(void) {
	ht16k33_t display[2];
	struct tm *now;
	time_t epoch;
	struct timeval tv;
	int err;

	board_init();

	/*
	err = atw_connect_wpa(&wifi, (uint8_t *)WIFI_SSID, strlen(WIFI_SSID), (uint8_t *)WIFI_PSK, strlen(WIFI_PSK));
	if(err != 0) {
		printf("atw_connect_wpa failed\r\n");
	}
	*/

	display[0].i2c = &DISPLAY_I2C;
	display[0].i2c_addr = 0x70;
	display[0].brightness = 2;

	display[1].i2c = &DISPLAY_I2C;
	display[1].i2c_addr = 0x73;
	display[1].brightness = 2;

	err = ht16k33_setup(&display[0]);
	if(err != 0) {
		printf("display 0 setup failed\r\n");
	}
	err = ht16k33_setup(&display[1]);
	if(err != 0) {
		printf("display 1 setup failed\r\n");
	}

	gpio_write(&STATUS_LED, LED_OFF);

	while(1) {
		err = gettimeofday(&tv, NULL);
		if(err != 0) {
			printf("gettimeofday failed: %s\r\n", strerror(errno));
		}else{
			epoch = tv.tv_sec;
			now = gmtime(&epoch);
			display_time(&display[1], now);

			epoch += (3600 * -8);
			now = gmtime(&epoch);
			display_time(&display[0], now);
		}

		//atw_handle_events(&wifi);
		console_loop();

		__WFI();
	}

	return 0;
}
