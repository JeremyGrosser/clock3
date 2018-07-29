#include <platform/gpio.h>
#include <platform/i2c.h>
#include <platform.h>
#include <board.h>

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include <sys/time.h>
#include <errno.h>

#include <driver/ht16k33.h>

int main(void) {
	ht16k33_t display;
	struct tm *now;
	struct timeval tv;
	char buf[128];
	int i, err;

	board_init();

	display.i2c = &DISPLAY_I2C;
	display.i2c_addr = DISPLAY_ADDR;

	do{
		// Retry setup until morale improves
		err = ht16k33_setup(&display);
	}while(err != 0);

	while(1) {
		err = gettimeofday(&tv, NULL);
		if(err != 0) {
			printf("gettimeofday failed: %s\r\n", strerror(errno));
		}else{
			strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", gmtime(&tv.tv_sec));
			printf("%s\r\n", buf);

			now = rtc_read();
			if(now->tm_hour > 0) {
				ht16k33_set(&display, ht16k33_column[0], ht16k33_digit[now->tm_hour / 10]);
				ht16k33_set(&display, ht16k33_column[1], ht16k33_digit[now->tm_hour % 10]);
			}else{
				ht16k33_set(&display, ht16k33_column[0], ht16k33_digit[0]);
				ht16k33_set(&display, ht16k33_column[1], ht16k33_digit[0]);
			}

			if(now->tm_min > 0) {
				ht16k33_set(&display, ht16k33_column[2], ht16k33_digit[now->tm_min / 10]);
				ht16k33_set(&display, ht16k33_column[3], ht16k33_digit[now->tm_min % 10]);
			}else{
				ht16k33_set(&display, ht16k33_column[2], ht16k33_digit[0]);
				ht16k33_set(&display, ht16k33_column[3], ht16k33_digit[0]);
			}
			ht16k33_set(&display, ht16k33_column[4], ht16k33_colon);
			ht16k33_flush(&display);
		}
		__WFI();
	}

	// rtc alarm interrupt every minute
	// update clock display registers
	// write new display values over I2C
	//
	// if hour==0 and minute==0
	// 	wake wifi module
	//	update rtc time from NTP or HTTPS
	return 0;
}
