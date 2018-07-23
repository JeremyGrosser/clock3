#ifndef STM32L152RE_BOARD_H
#define STM32L152RE_BOARD_H

#include <stm32l1xx.h>
#include <cmsis_gcc.h>
#include <stm32l1xx_hal.h>

#define GPIO_PORT_LED2	GPIOA
#define GPIO_PIN_LED2	GPIO_PIN_5

#define GPIO_PORT_I2C1		GPIOB
#define GPIO_PIN_I2C1_SCL	GPIO_PIN_8
#define GPIO_PIN_I2C1_SDA	GPIO_PIN_9

#define GPIO_PORT_OLED_RESET	GPIOA
#define GPIO_PIN_OLED_RESET		GPIO_PIN_15

#endif
