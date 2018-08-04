#include <platform/gpio.h>
#include <board.h>

void gpio_setup(gpio_t *gpio) {
	gpio->port = (gpio->num / 32);
	gpio->pin = (gpio->num % 32);
	gpio->mask = (1 << gpio->pin);

	if(gpio->config.pmux == PMUX_ENABLE) {
		PORT->Group[gpio->port].PINCFG[gpio->pin].bit.PMUXEN = 1;

		if(gpio->pin & 1) {
			PORT->Group[gpio->port].PMUX[(gpio->pin / 2)].bit.PMUXO = gpio->config.pmux_function;
		}else{
			PORT->Group[gpio->port].PMUX[(gpio->pin / 2)].bit.PMUXE = gpio->config.pmux_function;
		}
	}else{
		PORT->Group[gpio->port].PINCFG[gpio->pin].bit.PMUXEN = 0;
	}

	if(gpio->config.direction == DIR_OUT) {
		PORT->Group[gpio->port].DIR.reg |= gpio->mask;
		PORT->Group[gpio->port].PINCFG[gpio->pin].bit.INEN = 0;
	}else{
		PORT->Group[gpio->port].DIR.reg &= ~gpio->mask;
		PORT->Group[gpio->port].PINCFG[gpio->pin].bit.INEN = 1;
	}

	if(gpio->config.pull == PULL_ENABLE) {
		PORT->Group[gpio->port].PINCFG[gpio->pin].bit.PULLEN = 1;
	}else{
		PORT->Group[gpio->port].PINCFG[gpio->pin].bit.PULLEN = 0;
	}

	if(gpio->config.drive == DRIVE_HIGH) {
		PORT->Group[gpio->port].PINCFG[gpio->pin].bit.DRVSTR = 1;
	}else{
		PORT->Group[gpio->port].PINCFG[gpio->pin].bit.DRVSTR = 0;
	}
}

int gpio_read(gpio_t *gpio) {
	if(gpio->config.direction == DIR_IN) {
		return (PORT->Group[gpio->port].IN.reg & gpio->mask) ? 1 : 0;
	}else{
		return (PORT->Group[gpio->port].OUT.reg & gpio->mask) ? 1 : 0;
	}
}

void gpio_write(gpio_t *gpio, int state) {
	if(state == 0) {
		PORT->Group[gpio->port].OUT.reg &= ~gpio->mask;
	}else{
		PORT->Group[gpio->port].OUT.reg |= gpio->mask;
	}
}

void gpio_toggle(gpio_t *gpio) {
	PORT->Group[gpio->port].OUTTGL.reg |= gpio->mask;
}
