#include <platform.h>

void platform_init(void) {
	SystemInit();
	SystemCoreClockUpdate();
}
