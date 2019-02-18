#include <stdint.h>
#include <string.h>
#include "nordic_common.h"
#include "nrf.h"
#include "app_error.h"
#include "ble.h"
#include "ble_err.h"
#include "ble_hci.h"
#include "ble_srv_common.h"
#include "ble_advdata.h"
#include "ble_conn_params.h"
#include "nrf_sdh.h"
#include "nrf_sdh_ble.h"
#include "boards.h"
#include "app_timer.h"
#include "app_button.h"
#include "motion_player_service.h"
#include "nrf_ble_gatt.h"
#include "nrf_ble_qwr.h"
#include "nrf_pwr_mgmt.h"

#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"

#include "myAccel.h"
#include "app_util_platform.h"


#include "myBle.h"
#include "myLed.h"
#include "power.h"
#include "myI2C.h"









/**@brief Function for the Timer initialization.
 *
 * @details Initializes the timer module.
 */
static void timers_init(void)
{
    // Initialize timer module, making it use the scheduler
    ret_code_t err_code = app_timer_init();
    APP_ERROR_CHECK(err_code);
}





/**@brief Function for initializing power management.
 */
static void power_management_init(void)
{
    ret_code_t err_code;
    err_code = nrf_pwr_mgmt_init();
    APP_ERROR_CHECK(err_code);
}


/**@brief Function for handling the idle state (main loop).
 *
 * @details If there is no pending log operation, then sleep until next the next event occurs.
 */
static void idle_state_handle(void)
{
    if (NRF_LOG_PROCESS() == false)
    {
        nrf_pwr_mgmt_run();
    }
}


/**@brief Function for application main entry.
 */
int main(void)
{

    static volatile ret_code_t err_code;
    uint8_t tempData[25];
    uint8_t address=0;
    // Initialize.
    UicrInit();
    timers_init();
    power_management_init();
    ble_stack_init();
    gap_params_init();
    gatt_init();
    services_init();
    advertising_init();
    conn_params_init();
    twi_init();
    
    if(initAccel(accelmode_SimpleReading)==myaccelstate_Success){
        BlinkLED(LED_GREEN);
    }else{
        BlinkLED(LED_RED);
    }
    /*
    for (address=1;address<128;address++){
      //err_code = nrf_drv_twi_rx(&m_twi, ACCELL_I2C_ADDRESS_7B, tempData, 1);
      #warning "the 2 wire is not working, im not sure if it is a hardware problem or a software problem"
      err_code = nrf_drv_twi_rx(&m_twi, address, tempData, 1);
      if (err_code == NRF_SUCCESS)
      {

          BlinkLED(LED_GREEN);
      }else{
          BlinkLED(LED_RED);
      }

    }
    */
    // Start execution.
    NRF_LOG_INFO("Blinky example started.");
    advertising_start();

    // Enter main loop.
    for (;;)
    {
        idle_state_handle();
    }
}


/**
 * @}
 */
