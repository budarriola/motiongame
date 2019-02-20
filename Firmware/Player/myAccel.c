/*
  this file povides the glue for the acceleromiter and the i2c comunication of the mcu
  as well as some general accel setup functions
*/


#include "myAccel.h"
#include "lis3dh_reg.h"
#include "myI2C.h"
#include <stdio.h>   
#include <stdlib.h>
#include <string.h>

static int32_t platform_write(void *handle, uint8_t reg, uint8_t *bufp, uint16_t len);
static int32_t platform_read(void *handle, uint8_t reg, uint8_t *bufp, int16_t len);

lis3dh_ctx_t dev_ctx;
uint8_t firstIntDone=0;


/*
  init the accel
*/
myAccelState initAccel(accelMode mode){
     uint8_t temp0;
     uint16_t xMin,yMin,zMin;
     uint16_t xAvg,yAvg,zAvg;
     uint16_t xMax,yMax,zMax;
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
            /*
                setup for reading a baseline sleep mode
                read for one second
                save the min , max and avrage values of all axies
                set thresholds for inturupt
                start inturupt mode so that the mcu can go to sleep waiting for the adc to start it
            */
            #warning "finish this case"
            /*
            
             *  Enable Block Data Update
                output registers not updated until MSB and LSB reading when set)
             */
            if (lis3dh_block_data_update_set(&dev_ctx, PROPERTY_ENABLE)!=0){
                ret=myaccelstate_Fail;
            }

            /*
             * Set Output Data Rate to 1Hz
             */
            if (lis3dh_data_rate_set(&dev_ctx, LIS3DH_ODR_50Hz)!=0){
                ret=myaccelstate_Fail;
            }

            /*
             * Set full scale to 8g
             */  
            if (lis3dh_full_scale_set(&dev_ctx, LIS3DH_8g)!=0){
                ret=myaccelstate_Fail;
            }

            /*
             * dissable temperature sensor
             */   
            if (lis3dh_aux_adc_set(&dev_ctx, LIS3DH_AUX_DISABLE)!=0){
                ret=myaccelstate_Fail;
            }

            /*
             * Set device in continuous mode with 12 bit resol.
             */   
            if (lis3dh_operating_mode_set(&dev_ctx, LIS3DH_LP_8bit)!=0){
                ret=myaccelstate_Fail;
            }

            break;

        case accelmode_SimpleReading:
            /*
             *  Enable Block Data Update
                output registers not updated until MSB and LSB reading when set)
             */
            if (lis3dh_block_data_update_set(&dev_ctx, PROPERTY_DISABLE)!=0){
                ret=myaccelstate_Fail;
            }

            /*
             * Set Output Data Rate to 1Hz
             */
            if (lis3dh_data_rate_set(&dev_ctx, LIS3DH_ODR_1Hz)!=0){
                ret=myaccelstate_Fail;
            }

            /*
             * Set full scale to 2g
             */  
            if (lis3dh_full_scale_set(&dev_ctx, LIS3DH_2g)!=0){
                ret=myaccelstate_Fail;
            }

            /*
             * dissable temperature sensor
             */   
            if (lis3dh_aux_adc_set(&dev_ctx, LIS3DH_AUX_DISABLE)!=0){
                ret=myaccelstate_Fail;
            }

            /*
             * Set device in continuous mode with 12 bit resol.
             */   
            if (lis3dh_operating_mode_set(&dev_ctx, LIS3DH_NM_10bit)!=0){
                ret=myaccelstate_Fail;
            }
            break;
            
            default :
                ret=myaccelstate_Fail;
                break;

    }





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