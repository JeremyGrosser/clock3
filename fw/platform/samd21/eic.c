#include <platform.h>
#include <platform/eic.h>
#include "gclk.h"
#include <stddef.h>

static eic_callback_t eic_callbacks[EIC_EXTINT_NUM];

void eic_init(void) {
	int i;

	for(i = 0; i < EIC_EXTINT_NUM; i++) {
		eic_callbacks[i] = NULL;
	}

	GCLK->CLKCTRL.reg = (
			GCLK_CLKCTRL_ID(GCLK_CLKCTRL_ID_EIC) |
			GCLK_CLKCTRL_GEN(GCLK_GEN_EIC) |
			GCLK_CLKCTRL_CLKEN);

	PM->APBAMASK.reg |= PM_APBAMASK_EIC;

	EIC->CTRL.reg = EIC_CTRL_SWRST;
	while(EIC->STATUS.bit.SYNCBUSY);

	EIC->CTRL.reg = EIC_CTRL_ENABLE;
	while(EIC->STATUS.bit.SYNCBUSY);

	NVIC_EnableIRQ(EIC_IRQn);
}

void eic_attach(eiccfg_t *eic, eic_callback_t func) {
	int config_num, config_pos;
	int flag;

	flag = (1 << eic->num);
	config_num = (eic->num / 8);
	config_pos = ((eic->num % 8) * 4);

	eic_callbacks[eic->num] = func;
	EIC->CONFIG[config_num].reg &= ~(0xF << config_pos);
	EIC->CONFIG[config_num].reg |= ((eic->sense | (eic->filter << 3)) << config_pos);
	EIC->INTENSET.reg |= flag;
	EIC->WAKEUP.reg |= flag;
}

void eic_detach(eiccfg_t *eic) {
	eic_callbacks[eic->num] = NULL;
	EIC->INTENCLR.reg |= (1 << eic->num);
}

static void eic_interrupt(uint8_t num) {
	if(eic_callbacks[num] != NULL) {
		eic_callbacks[num]();
	}
}

void EIC_Handler(void) {
	uint32_t flag;
	int i;

	flag = EIC->INTFLAG.reg;
	for(i = 0; i < EIC_EXTINT_NUM; i++) {
		if((flag >> i) & 1) {
			eic_interrupt(i);
		}
	}
	EIC->INTFLAG.reg = 0xFFFFFFFF;
}
