#include <platform/i2c.h>
#include <platform.h>
#include "gclk.h"


void i2c_init(i2c_t *i2c) {
	Sercom *sercom;
	sercom = (Sercom *)(((void *)SERCOM0) + (i2c->num * 0x400UL));
	i2c->sercom = &sercom->I2CM;

	gpio_setup(i2c->scl);
	gpio_setup(i2c->sda);

	// TODO: clock madness

	// Fast clock (1MHz)
	GCLK->GENCTRL.reg = (
			GCLK_GENCTRL_ID(GCLK_GEN_I2C_FAST) |
			GCLK_GENCTRL_SRC_OSC8M |
			GCLK_GENCTRL_GENEN);
	GCLK->GENDIV.reg = (
			GCLK_GENDIV_ID(GCLK_GEN_I2C_FAST) |
			GCLK_GENDIV_DIV(1));
	GCLK->CLKCTRL.reg = (
			GCLK_CLKCTRL_ID(GCLK_CLKCTRL_ID_SERCOM0_CORE_Val + i2c->num) |
			GCLK_CLKCTRL_GEN(GCLK_GEN_I2C_FAST) |
			GCLK_CLKCTRL_CLKEN);

	// Slow clock (32KHz)
	/*
	GCLK->GENCTRL.reg = (
			GCLK_GENCTRL_ID(GCLK_GEN_I2C_SLOW) |
			GCLK_GENCTRL_SRC_OSCULP32K |
			GCLK_GENCTRL_GENEN);
	GCLK->GENDIV.reg = (
			GCLK_GENDIV_ID(GCLK_GEN_I2C_SLOW) |
			GCLK_GENDIV_DIV(1);
	*/

	// Use the same clock as Fast for now
	GCLK->CLKCTRL.reg = (
			GCLK_CLKCTRL_ID(GCLK_CLKCTRL_ID_SERCOMX_SLOW_Val) |
			GCLK_CLKCTRL_GEN(GCLK_GEN_I2C_FAST) |
			GCLK_CLKCTRL_CLKEN);

	PM->APBCMASK.reg |= (1 << (i2c->num + 2));

	i2c->sercom->CTRLA.reg = SERCOM_I2CM_CTRLA_SWRST;
	while(i2c->sercom->SYNCBUSY.bit.SWRST);

	i2c->sercom->CTRLA.reg = SERCOM_I2CM_CTRLA_MODE_I2C_MASTER;

	// Send ACK automatically when DATA is read
	i2c->sercom->CTRLB.reg |= SERCOM_I2CM_CTRLB_SMEN;

	i2c->sercom->BAUD.reg = 15;	// 50khz Thigh and Tlow, with 1M clock total 100khz cycle

	i2c->sercom->CTRLA.bit.ENABLE = 1;
	while(i2c->sercom->SYNCBUSY.bit.ENABLE);
}
