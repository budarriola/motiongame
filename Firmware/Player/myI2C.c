#include "myI2C.h"

#include "boards.h"


/**
 * @brief TWI initialization.
 */
void twi_init (void) {
    ret_code_t err_code;

    const nrf_drv_twi_config_t twi_config = {
        .scl                = ACCEL_SCL_PIN,
        .sda                = ACCEL_SDA_PIN,
        .frequency          = NRF_DRV_TWI_FREQ_400K,
        .interrupt_priority = APP_IRQ_PRIORITY_HIGH,
        .clear_bus_init     = false
    };

    err_code = nrf_drv_twi_init(&m_twi, &twi_config, NULL, NULL);
    APP_ERROR_CHECK(err_code);

    nrf_drv_twi_enable(&m_twi);
}