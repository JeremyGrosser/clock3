#include <platform/gpio.h>
#include <platform/spi.h>
#include <platform.h>
#include "atw.h"

#include <nm_bus_wrapper.h>
#include <m2m_wifi.h>
#include <m2m_types.h>
#include <m2m_periph.h>

#include <string.h>

#define NM_BUS_MAX_TRX_SZ 256
tstrNmBusCapabilities egstrNmBusCapabilities = {
	NM_BUS_MAX_TRX_SZ
};

// The nm API methods don't pass a reference, so we have to keep our context
// global and only run one atw at a time. lame.
static atw_t *atw_g = NULL;

void nm_bsp_sleep(uint32_t ms) {
	platform_delay(ms);
}

void nm_bsp_register_isr(tpfNmBspIsr pfIsr) {
	atw_g->irq_handler = (atw_irq_handler_t)pfIsr;
}

void nm_bsp_interrupt_ctrl(uint8_t enable) {
	atw_g->irq_enabled = enable;
}

int8_t nm_bus_init(void *initvalue) {
	// nm_bsp_init
	gpio_setup(atw_g->gpio_rst);
	gpio_setup(atw_g->gpio_chip_en);
	gpio_setup(atw_g->gpio_irq);
	gpio_write(atw_g->gpio_rst, 1);

	// nm_bsp_reset
	gpio_write(atw_g->gpio_chip_en, 1);
	platform_delay(100);
	gpio_write(atw_g->gpio_rst, 0);
	platform_delay(100);
	gpio_write(atw_g->gpio_rst, 1);
	platform_delay(100);

	return 0;
}

int8_t nm_bus_deinit(void) {
	gpio_write(atw_g->gpio_chip_en, 0);
	return 0;
}

int8_t nm_bus_ioctl(uint8_t cmd, void *param) {
	// Send/receive
	tstrNmSpiRw *spi_param;
	uint16_t i;
	uint8_t out;

	if(cmd != NM_BUS_IOCTL_RW) {
		return -1;
	}

	spi_param = (tstrNmSpiRw *)param;

	spi_begin(atw_g->spi);
	for(i = 0; i < spi_param->u16Sz; i++) {
		out = spi_transfer(atw_g->spi, spi_param->pu8InBuf[i]);
		if(spi_param->pu8OutBuf != NULL) {
			spi_param->pu8OutBuf[i] = out;
		}
	}
	spi_end(atw_g->spi);

	return 0;
}

static void atw_callback(uint8_t u8MsgType, void *pvMsg) {
}

int atw_setup(atw_t *atw) {
	tstrWifiInitParam param;
	int err;

	if(atw_g != NULL) {
		return 1;
	}
	atw_g = atw;

	atw->irq_enabled = 0;
	atw->irq_handler = NULL;

	param.pfAppWifiCb = &atw_callback;
	err = m2m_wifi_init(&param);
	if(err != 0) {
		return err;
	}

	return 0;
}

int atw_connect_wpa(atw_t *atw, uint8_t *ssid, size_t ssid_len, uint8_t *psk, size_t psk_len) {
	tuniM2MWifiAuth auth;
	int err;

	if(psk_len > M2M_MAX_PSK_LEN) {
		return -1;
	}
	memcpy(auth.au8PSK, psk, psk_len);
	auth.au8PSK[psk_len] = '\0';

	//err = m2m_wifi_connect((char *)ssid, ssid_len, M2M_WIFI_SEC_WPA_PSK, (void *)&auth, M2M_WIFI_CH_ALL);
	err = m2m_wifi_default_connect();

	return err;
}

void atw_interrupt(atw_t *atw) {
	if(atw->irq_enabled != 0 && atw->irq_handler != NULL) {
		atw->irq_handler();
	}
}

void atw_handle_events(atw_t *atw) {
	m2m_wifi_handle_events(NULL);
}
