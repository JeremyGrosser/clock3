#include <platform/rtc.h>
#include <platform/gpio.h>
#include <platform.h>
#include "gclk.h"

#include <stdio.h>

static datetime_t rtc_now = {0};
static uint32_t rtc_alarm = 0;

void rtc_init(void) {
	RtcMode2 *hw = &RTC->MODE2;

	/*
	gpio_t clkpin = {
		.num		= PIN_PA17,
		.config		= {
			.direction	= DIR_OUT,
			.drive		= DRIVE_LOW,
			.pull		= PULL_ENABLE,
			.pmux		= PMUX_ENABLE,
			.pmux_function = MUX_PA17H_GCLK_IO3,
		},
	};
	gpio_setup(&clkpin);
	*/

	SYSCTRL->INTENSET.reg |= SYSCTRL_INTENSET_XOSC32KRDY;
	SYSCTRL->XOSC32K.reg = (
			SYSCTRL_XOSC32K_ENABLE |
			SYSCTRL_XOSC32K_XTALEN |
			SYSCTRL_XOSC32K_EN32K |
			SYSCTRL_XOSC32K_RUNSTDBY |
			SYSCTRL_XOSC32K_AAMPEN);
	while(!SYSCTRL->PCLKSR.bit.XOSC32KRDY);

	GCLK->GENCTRL.reg = (
			GCLK_GENCTRL_ID(GCLK_GEN_RTC) |
			GCLK_GENCTRL_SRC_XOSC32K |
			GCLK_GENCTRL_GENEN);
	
	GCLK->GENDIV.reg = (
			GCLK_GENDIV_ID(GCLK_GEN_RTC) |
			GCLK_GENDIV_DIV(32));

	GCLK->CLKCTRL.reg = (
			GCLK_CLKCTRL_ID_RTC |
			GCLK_CLKCTRL_GEN(GCLK_GEN_RTC) |
			GCLK_CLKCTRL_CLKEN);
	while(GCLK->STATUS.bit.SYNCBUSY);

	/*
	 * XXX: THIS WORKS
	GCLK->GENCTRL.reg = (
			GCLK_GENCTRL_ID(GCLK_GEN_RTC) |
			GCLK_GENCTRL_SRC_OSCULP32K |
			GCLK_GENCTRL_GENEN);
	
	GCLK->GENDIV.reg = (
			GCLK_GENDIV_ID(GCLK_GEN_RTC) |
			GCLK_GENDIV_DIV(32));

	GCLK->CLKCTRL.reg = (
			GCLK_CLKCTRL_ID_RTC |
			GCLK_CLKCTRL_GEN(GCLK_GEN_RTC) |
			GCLK_CLKCTRL_CLKEN);
	while(GCLK->STATUS.bit.SYNCBUSY);
	*/

	PM->APBAMASK.reg |= PM_APBAMASK_RTC;

	// Disable
	hw->CTRL.reg = 0;
	while(hw->STATUS.bit.SYNCBUSY);

	// Reset
	hw->CTRL.reg = RTC_MODE2_CTRL_SWRST;
	while(hw->STATUS.bit.SYNCBUSY);

	// Keep running while debugging
	hw->DBGCTRL.reg = RTC_DBGCTRL_DBGRUN;

	hw->READREQ.reg = 0;

	// Enable ALARM0 interrupt
	hw->INTENSET.reg = RTC_MODE2_INTENSET_ALARM0;
	hw->INTFLAG.reg = 0xFF;
	NVIC_EnableIRQ(RTC_IRQn);

	// Configure
	hw->CTRL.reg = (
			RTC_MODE2_CTRL_ENABLE |
			RTC_MODE2_CTRL_MODE_CLOCK |
			RTC_MODE2_CTRL_PRESCALER_DIV1024);
	while(hw->STATUS.bit.SYNCBUSY);

	// ALARM0 interrupt fires when SECOND is 0
	hw->Mode2Alarm[0].ALARM.reg = 0;
	hw->Mode2Alarm[0].MASK.reg = RTC_MODE2_MASK_SEL_SS;
	while(hw->STATUS.bit.SYNCBUSY);
}

datetime_t rtc_read(void) {
	return rtc_now;
}

void RTC_Handler(void) {
	RtcMode2 *hw = &RTC->MODE2;

	hw->READREQ.reg = RTC_READREQ_RREQ;
	while(hw->STATUS.bit.SYNCBUSY);

	rtc_now.day = hw->CLOCK.bit.DAY;
	rtc_now.month = hw->CLOCK.bit.MONTH;
	rtc_now.year = hw->CLOCK.bit.YEAR;
	rtc_now.hour = hw->CLOCK.bit.HOUR;
	rtc_now.minute = hw->CLOCK.bit.MINUTE;
	rtc_now.second = hw->CLOCK.bit.SECOND;

	hw->INTFLAG.reg = 0xFF;
}
