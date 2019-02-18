#ifndef MYI2C_H
#define MYI2C_H

  #ifdef __cplusplus
  extern "C" {
  #endif
  
  #include "nrf_drv_twi.h"

  #define TWI_INSTANCE_ID     0

  /* TWI instance. */
  static const nrf_drv_twi_t m_twi = NRF_DRV_TWI_INSTANCE(TWI_INSTANCE_ID);

  void twi_init (void);




  #ifdef __cplusplus
  }
  #endif

#endif


