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

//number of samples required to establish a baseline acceleration identifying a sleep state
#define WaitForWakeup_SAMPLES 50
//noise margin multiplyer
#define WaitForWakeup_NOISE_FACTOR 2

static int32_t platform_write(void *handle, uint8_t reg, uint8_t *bufp, uint16_t len);
static int32_t platform_read(void *handle, uint8_t reg, uint8_t *bufp, int16_t len);

lis3dh_ctx_t dev_ctx;
uint8_t firstIntDone=0;


/*
  init the accel
  value is used in accelmode_WaitForWakeup to set the intirupt threshold
*/
myAccelState initAccel(accelMode mode,uint8_t value){
     uint8_t temp0;
     lis3dh_int1_src_t tempIntSrc;
     lis3dh_int1_cfg_t tempCfgSrc;
     
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
            #warning "finish this case it is not generating an inturupt as it should"
            
            
            
            //lis3dh_high_pass_bandwidth_set
            //lis3dh_high_pass_mode_set

            //Latch interrupt request on INT1_SRC register, with INT1_SRC (31h) register cleared by reading INT1_SRC (31h) itself. 
            lis3dh_boot_set(&dev_ctx,0x08);

            /*
             *  Enable Block Data Update
                output registers not updated until MSB and LSB reading when set)
             */
            if (lis3dh_block_data_update_set(&dev_ctx, PROPERTY_ENABLE)!=0){
                return myaccelstate_Fail;
            }

            /*
             * Set Output Data Rate to 10Hz
             */
            if (lis3dh_data_rate_set(&dev_ctx, LIS3DH_ODR_10Hz)!=0){
                return myaccelstate_Fail;
            }

            /*
             * Set full scale to 4g
             */  
            if (lis3dh_full_scale_set(&dev_ctx, LIS3DH_4g)!=0){
                return myaccelstate_Fail;
            }

            /*
             * dissable temperature sensor
             */   
            if (lis3dh_aux_adc_set(&dev_ctx, LIS3DH_AUX_DISABLE)!=0){
                return myaccelstate_Fail;
            }

            /*
             * Set device in continuous mode with 8 bit resol.
             */   
            if (lis3dh_operating_mode_set(&dev_ctx, LIS3DH_LP_8bit)!=0){
                return myaccelstate_Fail;
            }
            

            /*
                1 LSb = 1/ODR
                The D[6:0] bits set the minimum duration of the Interrupt 1 event to be recognized. Duration
                steps and maximum values depend on the ODR chosen.
                Duration time is measured in N/ODR, where N is the content of the duration register.
            */
            lis3dh_int1_gen_duration_set(&dev_ctx,0x01);

            /*
                THS[6:0]
                Interrupt 1 threshold. Default value: 000 0000
                1 LSb = 16 mg @ FS = ±2 g
                1 LSb = 32 mg @ FS = ±4 g
                1 LSb = 62 mg @ FS = ±8 g
                1 LSb = 186 mg @ FS = ±16 g
            */
            lis3dh_int1_gen_threshold_set(&dev_ctx,value);

            //read int1 source to clear it
            lis3dh_int1_gen_source_get(&dev_ctx,&tempIntSrc);

            //set int1 for all axies min or max threshold
            tempCfgSrc.xhie=1;
            tempCfgSrc.xlie=1;
            tempCfgSrc.yhie=1;
            tempCfgSrc.ylie=1;
            tempCfgSrc.zhie=1;
            tempCfgSrc.zlie=1;
            lis3dh_int1_gen_conf_set(&dev_ctx,&tempCfgSrc);

            



            /*
            xAvg=0;
            yAvg=0;
            zAvg=0;

            for (temp0=0; temp0<WaitForWakeup_SAMPLES; temp0++){
                if (lis3dh_temp_data_ready_get(&dev_ctx,&temp1)!=0){
                  return myaccelstate_Fail;
                }

                while (!temp1){
                    #warning "add timeout here"
                }

                //there is new excell data
                // Read accelerometer data 
                memset(accelData, 0x00, 3*sizeof(int16_t));
                lis3dh_acceleration_raw_get(&dev_ctx, accelData);
                xAvg+=accelData[0];
                yAvg+=accelData[1];
                zAvg+=accelData[2];

                
                //track min and max values of the accel
                if (accelData[0] > xMax)
                {
                    xMax = accelData[0];
                }else if (accelData[0] < xMin)
                    {
                        xMin = accelData[0];
                    }

                if (accelData[1] > yMax)
                {
                    yMax = accelData[1];
                }else if (accelData[1] < yMin)
                    {
                        yMin = accelData[1];
                    }

                if (accelData[2] > zMax)
                {
                    zMax = accelData[2];
                }else if (accelData[2] < zMin)
                    {
                        zMin = accelData[2];
                    }
                

            }
            
#warning "it would be better to collect this data in the main loop insted of in a canned routiene"
            //find the avrage of all samples
            xAvg/=WaitForWakeup_SAMPLES;
            yAvg/=WaitForWakeup_SAMPLES;
            zAvg/=WaitForWakeup_SAMPLES;

            xMax += ( (int32_t)xMax - (int32_t)xAvg ) * WaitForWakeup_NOISE_FACTOR;
            xMin -= ( (int32_t)xAvg - (int32_t)xMin ) * WaitForWakeup_NOISE_FACTOR;
            
            yMax += ( (int32_t)yMax - (int32_t)yAvg ) * WaitForWakeup_NOISE_FACTOR;
            yMin -= ( (int32_t)yAvg - (int32_t)yMin ) * WaitForWakeup_NOISE_FACTOR;

            zMax += ( (int32_t)zMax - (int32_t)zAvg ) * WaitForWakeup_NOISE_FACTOR;
            zMin -= ( (int32_t)zAvg - (int32_t)zMin ) * WaitForWakeup_NOISE_FACTOR;


            //lis3dh_status_get
            //lis3dh_int1_gen_threshold_set
            //lis3dh_int1_gen_duration_set
            */

            break;

        case accelmode_SimpleReading:

        #warning "finish this case"

            /*
             *  Enable Block Data Update
                output registers not updated until MSB and LSB reading when set)
             */
            if (lis3dh_block_data_update_set(&dev_ctx, PROPERTY_DISABLE)!=0){
                return myaccelstate_Fail;
            }

            /*
             * Set Output Data Rate to 1Hz
             */
            if (lis3dh_data_rate_set(&dev_ctx, LIS3DH_ODR_1Hz)!=0){
                return myaccelstate_Fail;
            }

            /*
             * Set full scale to 4g
             */  
            if (lis3dh_full_scale_set(&dev_ctx, LIS3DH_4g)!=0){
                return myaccelstate_Fail;
            }

            /*
             * dissable temperature sensor
             */   
            if (lis3dh_aux_adc_set(&dev_ctx, LIS3DH_AUX_DISABLE)!=0){
                return myaccelstate_Fail;
            }

            /*
             * Set device in continuous mode with 12 bit resol.
             */   
            if (lis3dh_operating_mode_set(&dev_ctx, LIS3DH_NM_10bit)!=0){
                return myaccelstate_Fail;
            }
            break;
            
            default :
                return myaccelstate_Fail;
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