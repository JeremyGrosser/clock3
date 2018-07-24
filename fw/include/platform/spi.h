#ifndef SPI_H
#define SPI_H
#include <stdint.h>
#include <stddef.h>

typedef struct spi_s spi_t;

void spi_setup(spi_t *spi);
int spi_send(spi_t *spi, uint8_t *data, size_t len);
int spi_recv(spi_t *spi, uint8_t *data, size_t len);

#endif
