#ifndef GPIO_H
#define GPIO_H

typedef struct gpio_s gpio_t;
typedef struct pincfg_s pincfg_t;

void gpio_setup(gpio_t gpio);
int gpio_read(gpio_t gpio);
void gpio_write(gpio_t gpio, int state);

#endif
