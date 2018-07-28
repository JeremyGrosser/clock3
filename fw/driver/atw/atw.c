#include <platform/gpio.h>
#include <platform/spi.h>
#include <dev/atw.h>

typedef void (*atw_isr_function)(void);

static atw_isr_function isr = NULL;

void atw_setup(atw_t *atw) {
	tstrWifiInitParam param = {0}
	int err;

	// nm_bsp_init
	gpio_setup(atw->gpio_rst);
	gpio_setup(atw->gpio_chip_en);
	gpio_setup(atw->gpio_irq);

	gpio_write(atw->gpio_chip_en, 0);
	gpio_write(atw->gpio_rst, 0);

	// 1ms SysTick?
	//SysTickConfig(SystemCoreClock / 1000);

	// TODO: call atw_interrupt every time gpio_irq 0->1
	
	err = m2m_wifi_init(&param);
}

void atw_interrupt(atw_t *atw) {
	if(isr != NULL) {
		isr();
	}
}

void nm_bsp_register_isr(atw_isr_function new_isr) {
	isr = new_isr;
}
