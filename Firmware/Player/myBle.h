#ifndef MYBLE_H
#define MYBLE_H

#ifdef __cplusplus
extern "C" {
#endif



void gatt_init();
void gap_params_init();

void advertising_init();
void ble_stack_init();
void advertising_start();

void conn_params_init();
void services_init();
#ifdef __cplusplus
}
#endif
#endif