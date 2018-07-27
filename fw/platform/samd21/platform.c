#include <platform.h>

void platform_init(void) {
	SystemInit();
	SystemCoreClockUpdate();

	SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;
	PM->SLEEP.reg = (
			PM_SLEEP_IDLE_CPU |
			PM_SLEEP_IDLE_AHB |
			PM_SLEEP_IDLE_APB);
}
