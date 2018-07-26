#include <platform/gpio.h>
#include <platform/rtc.h>
#include <platform.h>
#include <board.h>

#include <stdint.h>
#include <stdio.h>
#include <string.h>

int main(void) {
	datetime_t now;

	board_init();

	while(1) {
		now = rtc_read();
		printf("%04lu-%02lu-%02lu %02lu:%02lu:%02lu\r\n",
				now.year, now.month, now.day,
				now.hour, now.minute, now.second);
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
