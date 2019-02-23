/*
  this file povides the glue for the acceleromiter and the i2c comunication of the mcu
  as well as some general accel setup functions
*/


#include "myAccel.h"

#include "myI2C.h"
#include <stdio.h>   
#include <stdlib.h>
#include <string.h>

//number of samples required to establish a baseline acceleration identifying a sleep state
#define WaitForWakeup_SAMPLES 50
//noise margin multiplyer
#define WaitForWakeup_NOISE_FACTOR 2

static int32_t platform_write(void *handle, uint8_t reg, uint8_t *bufp, uint16_t len);
static int32_t platform_read(void *handle, uint8_t reg, uint8_t *bufp, int16_t len);

lis3dh_ctx_t dev_ctx;
uint8_t firstIntDone=0;

accelSettings setting_SimpleRead={
  .highPassIrq=LIS3DH_ON_INT1_GEN,
  .highPassOutput=PROPERTY_DISABLE,
  .int1Type.i1_zyxda = PROPERTY_ENABLE,  //inirupt on new data avalable
  .int1Latch=LIS3DH_INT1_LATCHED,
  .fullScale=LIS3DH_4g,
  .int1Threshold=0,
  .int1Duration=0,
  .int1Source=0,
  .resolution=LIS3DH_NM_10bit,
  .sampleRate=LIS3DH_ODR_100Hz,
  .blockDataUpdate=PROPERTY_ENABLE,
};

accelSettings setting_sleep={
  .highPassIrq=LIS3DH_ON_INT1_GEN,
  .highPassOutput=PROPERTY_ENABLE,
  .int1Type.i1_ia1 = PROPERTY_ENABLE, //initrupt on low or high axis events on any axis
  .int1Latch=LIS3DH_INT1_LATCHED,
  .fullScale=LIS3DH_2g,
  .int1Threshold=0x15,
  .int1Duration=0x00,
  .int1Source.zhie = PROPERTY_ENABLE,
  .int1Source.yhie = PROPERTY_ENABLE,
  .int1Source.xhie = PROPERTY_ENABLE,
  .int1Source.aoi = PROPERTY_ENABLE,
  .resolution=LIS3DH_LP_8bit,
  .sampleRate=LIS3DH_ODR_10Hz,
  .blockDataUpdate=PROPERTY_DISABLE,
};

/*
  init the accel
  value is used in accelmode_WaitForWakeup to set the intirupt threshold
*/
myAccelState initAccel(accelMode mode,uint8_t value){
    accelSettings *settings;

     uint8_t temp0;
     lis3dh_ctrl_reg3_t ctrl_reg3;
     //lis3dh_int1_src_t tempIntSrc;
     lis3dh_int1_cfg_t int1_cfg;
     
     myAccelState ret = myaccelstate_Success;
      /*
     *  Initialize mems driver interface
     */
    
    if(!firstIntDone){
        dev_ctx.write_reg = platform_write;
        dev_ctx.read_reg = platform_read;
        dev_ctx.handle = NULL;  
        

         /*
         *  Check device ID
         */
        lis3dh_device_id_get(&dev_ctx, &temp0);
        if (temp0 != LIS3DH_ID)
        {
            return myaccelstate_Fail;
        }

        firstIntDone=1;

    }



    switch(mode){

        case accelmode_WaitForWakeup:
                settings=&setting_sleep;
            break;

        case accelmode_SimpleReading:
                settings=&setting_SimpleRead;
            break;
    }



    // Enable Block Data Update
    lis3dh_block_data_update_set(&dev_ctx, settings->blockDataUpdate);

    // High-pass filter enabled on interrupt activity 1    
    lis3dh_high_pass_int_conf_set(&dev_ctx, settings->highPassIrq);

    
     //Enable HP filter for wake-up event detection
     // Use this setting to remove gravity on data output
    lis3dh_high_pass_on_outputs_set(&dev_ctx, settings->highPassOutput);

    
    // Enable AOI1 on int1 pin
    lis3dh_pin_int1_config_set(&dev_ctx, &settings->int1Type);

    
    // Interrupt 1 pin latched
    lis3dh_int1_pin_notification_mode_set(&dev_ctx, settings->int1Latch);

    
     // Set full scale
    lis3dh_full_scale_set(&dev_ctx, settings->fullScale);

    
    // Set interrupt threshold     
    lis3dh_int1_gen_threshold_set(&dev_ctx, settings->int1Threshold);

    
    // Set no time duration
    lis3dh_int1_gen_duration_set(&dev_ctx, settings->int1Duration);

    
    // Dummy read to force the HP filter to current acceleration value.
    lis3dh_filter_reference_get(&dev_ctx, &temp0);

    
    // Configure wake-up interrupt event
    lis3dh_int1_gen_conf_set(&dev_ctx, &settings->int1Source);

    
    // Set device mode
    lis3dh_operating_mode_set(&dev_ctx, settings->resolution);

    
   // Set Output Data Rate to 10 Hz
    lis3dh_data_rate_set(&dev_ctx, settings->sampleRate);



    return ret;

}


/*
 * @brief  Write generic device register (platform dependent)
 *
 * @param  handle    customizable argument. In this examples is used in
 *                   order to select the correct sensor bus handler.
 * @param  reg       register to write
 * @param  bufp      pointer to data to write in register reg
 * @param  len       number of consecutive register to write
 *
 */
static int32_t platform_write(void *handle, uint8_t reg, uint8_t *bufp, uint16_t len)
{

    /* Write multiple command */
    reg |= 0x80;
    //HAL_I2C_Mem_Write(handle, , reg, I2C_MEMADD_SIZE_8BIT, bufp, len, 1000);

    uint8_t *txData=malloc(sizeof(reg) + len*sizeof(*bufp));
    memcpy(txData,&reg,sizeof(reg));
    memcpy(&txData[sizeof(reg)],bufp,len*sizeof(*bufp));
    if (nrf_drv_twi_tx(&m_twi,((LIS3DH_I2C_ADD_H&0xfe)>>1),txData,sizeof(txData),false)!=NRF_SUCCESS){
        return 1;
    }


  return 0;
}

/*
 * @brief  Read generic device register (platform dependent)
 *
 * @param  handle    customizable argument. In this examples is used in
 *                   order to select the correct sensor bus handler.
 * @param  reg       register to read
 * @param  bufp      pointer to buffer that store the data read
 * @param  len       number of consecutive register to read
 *
 */
static int32_t platform_read(void *handle, uint8_t reg, uint8_t *bufp, int16_t len)
{

    /* Read multiple command */
    reg |= 0x80;
    //HAL_I2C_Mem_Read(handle, LIS3DH_I2C_ADD_L, reg, I2C_MEMADD_SIZE_8BIT, bufp, len, 1000);
    if (nrf_drv_twi_tx(&m_twi,((LIS3DH_I2C_ADD_H&0xfe)>>1),&reg,sizeof(reg),true)!=NRF_SUCCESS){
        return 1;
    }
    if (nrf_drv_twi_rx(&m_twi,((LIS3DH_I2C_ADD_H&0xfe)>>1),bufp,len)!=NRF_SUCCESS){
        return 1;
    }


/*
nrf_drv_twi_tx
nrf_drv_twi_rx

*/
    //if non blocking mode
    //nrf_drv_twi_xfer


  return 0;
}