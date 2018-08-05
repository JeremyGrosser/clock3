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

#include <driver/ht16k33.h>
#include <driver/atw.h>

static const char *WIFI_SSID = "sierra24";
static const char *WIFI_PSK = "whatevenisapassword";

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
	char buf[128];
	int i, err;

	board_init();

	err = atw_connect_wpa(&wifi, (uint8_t *)WIFI_SSID, strlen(WIFI_SSID), (uint8_t *)WIFI_PSK, strlen(WIFI_PSK));
	if(err != 0) {
		printf("atw_connect_wpa failed\r\n");
	}

	display[0].i2c = &DISPLAY_I2C;
	display[0].i2c_addr = 0x70;

	display[1].i2c = &DISPLAY_I2C;
	display[1].i2c_addr = 0x73;

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

		atw_handle_events(&wifi);

		__WFI();
	}

	return 0;
}
