#ifndef RTC_H
#define RTC_H
#include <stdint.h>

struct datetime_s {
	uint32_t day;
	uint32_t month;
	uint32_t year;
	uint32_t hour;
	uint32_t minute;
	uint32_t second;
};

typedef struct datetime_s datetime_t;

void rtc_init(void);
datetime_t rtc_read(void);

#endif
