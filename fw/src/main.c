#include <platform/gpio.h>
#include <board.h>

#include <stdint.h>

int main(void) {
	board_init();

	// rtc alarm interrupt every minute
	// update clock display registers
	// write new display values over I2C
	//
	// if hour==0 and minute==0
	// 	wake wifi module
	//	update rtc time from NTP or HTTPS
	return 0;
}
