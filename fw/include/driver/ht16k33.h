#ifndef HT16K33_H
#define HT16K33_H
#include <platform/i2c.h>
#include <stdint.h>

#define HT16K33_REG_SYS			0x20
#define HT16K33_SYS_DISABLE		0
#define HT16K33_SYS_ENABLE		1

#define HT16K33_REG_ROWINT		0xA0
#define HT16K33_ROWINT_ROW		0
#define HT16K33_ROWINT_INT		1
#define HT16K33_ROWINT_ACT		2

#define HT16K33_REG_DISPLAY		0x80
#define HT16K33_DISPLAY_ON		1
#define HT16K33_BLINK_Pos		1
#define HT16K33_BLINK_Msk		6
#define HT16K33_BLINK_SLOW		(3 << HT16K33_BLINK_Pos)
#define HT16K33_BLINK_MEDIUM	(2 << HT16K33_BLINK_Pos)
#define HT16K33_BLINK_FAST		(1 << HT16K33_BLINK_Pos)
#define HT16K33_BLINK_OFF		0

struct ht16k33_s {
	i2c_t *i2c;
	uint8_t i2c_addr;
};
typedef struct ht16k33_s ht16k33_t;

int ht16k33_setup(ht16k33_t *dev);

#endif
