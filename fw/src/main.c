#include <platform/gpio.h>
#include <platform.h>
#include <board.h>

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include <sys/time.h>
#include <errno.h>

int main(void) {
	struct tm *now;
	struct timeval tv;
	char buf[128];
	int err;

	board_init();

	while(1) {
		err = gettimeofday(&tv, NULL);
		if(err != 0) {
			printf("gettimeofday failed: %s\r\n", strerror(errno));
		}else{
			strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", gmtime(&tv.tv_sec));
			printf("%s\r\n", buf);
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
