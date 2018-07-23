#include <stdint.h>
#include <board.h>
#include "ssd1306.h"

void SystemClock_Config(void);
static void Error_Handler(void);

/**
	* @brief  System Clock Configuration
	*         The system Clock is configured as follow :
	*            System Clock source            = PLL (HSI)
	*            SYSCLK(Hz)                     = 32000000
	*            HCLK(Hz)                       = 32000000
	*            AHB Prescaler                  = 1
	*            APB1 Prescaler                 = 1
	*            APB2 Prescaler                 = 1
	*            HSI Frequency(Hz)              = 16000000
	*            PLLMUL                         = 6
	*            PLLDIV                         = 3
	*            Flash Latency(WS)              = 1
	* @retval None
	*/
void SystemClock_Config(void)
{
	RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
	RCC_OscInitTypeDef RCC_OscInitStruct = {0};

	/* Enable HSE Oscillator and Activate PLL with HSE as source */
	RCC_OscInitStruct.OscillatorType      = RCC_OSCILLATORTYPE_HSI;
	RCC_OscInitStruct.HSIState            = RCC_HSI_ON;
	RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
	RCC_OscInitStruct.PLL.PLLState        = RCC_PLL_ON;
	RCC_OscInitStruct.PLL.PLLSource       = RCC_PLLSOURCE_HSI;
	RCC_OscInitStruct.PLL.PLLMUL          = RCC_PLL_MUL6;
	RCC_OscInitStruct.PLL.PLLDIV          = RCC_PLL_DIV3;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
	{
		Error_Handler();
	}

	/* Set Voltage scale1 as MCU will run at 32MHz */
	__HAL_RCC_PWR_CLK_ENABLE();
	__HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

	/* Poll VOSF bit of in PWR_CSR. Wait until it is reset to 0 */
	while (__HAL_PWR_GET_FLAG(PWR_FLAG_VOS) != RESET) {};

	/* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
	clocks dividers */
	RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
	RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
	{
		Error_Handler();
	}

	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();
	__HAL_RCC_I2C1_CLK_ENABLE();
}

static void Error_Handler(void) {
	while(1);
}

void LED_Init(void) {
	GPIO_InitTypeDef gpiocfg = {0};

	// PA5: LED2
	gpiocfg.Pin = GPIO_PIN_LED2;
	gpiocfg.Mode = GPIO_MODE_OUTPUT_PP;
	gpiocfg.Pull = GPIO_PULLUP;
	gpiocfg.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
	HAL_GPIO_Init(GPIO_PORT_LED2, &gpiocfg);
}

void LED_Set(int on) {
	HAL_GPIO_WritePin(GPIO_PORT_LED2, GPIO_PIN_LED2, on);
}

void I2C_Init(void) {
	GPIO_InitTypeDef gpiocfg = {0};
	uint32_t pclk1, freqrange;

	// PB8: I2C1_SCL
	// PB9: I2C1_SDA
	gpiocfg.Pin = (GPIO_PIN_I2C1_SCL | GPIO_PIN_I2C1_SDA);
	gpiocfg.Mode = GPIO_MODE_AF_OD;
	gpiocfg.Pull = GPIO_PULLUP;
	gpiocfg.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
	gpiocfg.Alternate = GPIO_AF4_I2C1;
	HAL_GPIO_Init(GPIO_PORT_I2C1, &gpiocfg);

	// Reset
	I2C1->CR1 = I2C_CR1_SWRST;

	// Come out of reset, ensure peripheral disabled
	I2C1->CR1 = 0;

	// PCLK1 is 2 MHz, no interrupts
	I2C1->CR2 = I2C_CR2_FREQ_1;

	// 100 KHz (10ns rise time based on 2 MHz PCLK1)
	I2C1->TRISE = 2;

	// Standard mode
	I2C1->CCR = 0;

	// 7-bit address, don't care about own address
	I2C1->OAR1 = 0;
	I2C1->OAR2 = 0;

	// Enable the peripheral
	I2C1->CR1 |= I2C_CR1_PE;
}

void I2C_Write(I2C_TypeDef *dev, uint8_t address, uint8_t byte) {
	// Disable acknowledge
	CLEAR_BIT(dev->CR1, I2C_CR1_POS);

	// Generate a start bit
	dev->SR1 = 0;
	dev->CR1 |= I2C_CR1_START;
	while(!(dev->SR1 & I2C_SR1_SB));

	// Send slave address, LSB must be 0 to transmit
	dev->SR1 = 0;
	dev->DR = (address << 1);
	while(!(dev->SR1 & I2C_SR1_ADDR));
	CLEAR_BIT(dev->SR1, I2C_SR1_ADDR);

	// Send byte, wait for byte transfer finished (BTF)
	dev->SR1 = 0;
	dev->DR = byte;
	while(!(dev->SR1 & I2C_SR1_BTF));
	CLEAR_BIT(dev->SR1, I2C_SR1_BTF);

	// Send stop
	dev->CR1 |= I2C_CR1_STOP;
}

int main(void) {
	GPIO_InitTypeDef gpiocfg = {0};

	SystemClock_Config();
	HAL_Init();
	LED_Init();
	LED_Set(1);

	I2C_Init();

	// PA15: OLED Reset
	gpiocfg.Pin = GPIO_PIN_OLED_RESET;
	gpiocfg.Mode = GPIO_MODE_OUTPUT_PP;
	gpiocfg.Pull = GPIO_PULLUP;
	gpiocfg.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
	HAL_GPIO_Init(GPIO_PORT_OLED_RESET, &gpiocfg);

	// Strobe OLED reset
	HAL_GPIO_WritePin(GPIO_PORT_OLED_RESET, GPIO_PIN_OLED_RESET, 1);
	HAL_Delay(1);
	HAL_GPIO_WritePin(GPIO_PORT_OLED_RESET, GPIO_PIN_OLED_RESET, 0);
	HAL_Delay(10);
	HAL_GPIO_WritePin(GPIO_PORT_OLED_RESET, GPIO_PIN_OLED_RESET, 1);

	// OLED setup sequence
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_DISPLAYOFF);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_SETDISPLAYCLOCKDIV);
	I2C_Write(I2C1, SSD1306_ADDRESS, 0x80);
	
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_SETDISPLAYOFFSET);
	I2C_Write(I2C1, SSD1306_ADDRESS, 0);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_SETSTARTLINE | 0x0);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_CHARGEPUMP);
	I2C_Write(I2C1, SSD1306_ADDRESS, 0x10);

	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_MEMORYMODE);
	I2C_Write(I2C1, SSD1306_ADDRESS, 0);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_SEGREMAP | 0x1);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_COMSCANDEC);

	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_SETCOMPINS);
	I2C_Write(I2C1, SSD1306_ADDRESS, 0x02);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_SETCONTRAST);
	I2C_Write(I2C1, SSD1306_ADDRESS, 0x8F);

	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_SETPRECHARGE);
	I2C_Write(I2C1, SSD1306_ADDRESS, 0x22);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_SETVCOMDETECT);
	I2C_Write(I2C1, SSD1306_ADDRESS, 0x40);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_DISPLAYALLON_RESUME);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_NORMALDISPLAY);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_DEACTIVATE_SCROLL);
	I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_DISPLAYON);

	while(1) {
		I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_INVERTDISPLAY);
		LED_Set(1);
		HAL_Delay(250);
		I2C_Write(I2C1, SSD1306_ADDRESS, SSD1306_NORMALDISPLAY);
		LED_Set(0);
		HAL_Delay(250);
	}

	return 0;
}
