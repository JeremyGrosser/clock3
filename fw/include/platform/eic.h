#ifndef EIC_H
#define EIC_H

typedef struct eiccfg_s eiccfg_t;
typedef void (*eic_callback_t)(void);

void eic_init(void);
void eic_attach(eiccfg_t *eic, eic_callback_t func);
void eic_detach(eiccfg_t *eic);

#endif
