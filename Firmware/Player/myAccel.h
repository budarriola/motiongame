/*
  this file povides the glue for the acceleromiter and the i2c comunication of the mcu
  as well as some general accel setup functions
*/

#ifndef MYACCEL_H
#define MYACCEL_H

  #ifdef __cplusplus
  extern "C" {
  #endif
  #include <stdint.h>

  #include "lis3dh_reg.h"

  extern lis3dh_ctx_t dev_ctx;
  /*
      accelmode_WaitForWakeup = very slowly take mesurements and inturupt when a threshold has been met to power on the device
  */
  typedef enum  accelmode {accelmode_WaitForWakeup, accelmode_SimpleReading}accelMode;

  typedef enum  myaccelstate {myaccelstate_Success, myaccelstate_Fail}myAccelState;
  /*
  typedef struct{
      int16_t xmax;
      int16_t xmin;
      int16_t ymax;
      int16_t ymin;
      int16_t zmax;
      int16_t zmin;
   }myAccelThresholds;
*/
  myAccelState initAccel(accelMode mode,uint8_t value);
  
  typedef struct {
      lis3dh_hp_t highPassIrq;        //High-pass filter on interrupts/tap generator
      uint8_t highPassOutput;         //High pass data from internal filter sent to output register (PROPERTY_ENABLE/PROPERTY_DISSABLE)
      lis3dh_ctrl_reg3_t int1Type;    //int1 pin inturupt type
      lis3dh_lir_int1_t int1Latch;    //will int1 be latching or pulsed LIS3DH_INT1_LATCHED
      lis3dh_fs_t fullScale;          //full scale output
      uint8_t int1Threshold;          //interrupt 1 threshold
      uint8_t int1Duration;           //The minimum duration (LSb = 1/ODR) of the Interrupt 1 event to be recognized
      lis3dh_int1_cfg_t int1Source;
      lis3dh_op_md_t resolution;
      lis3dh_odr_t sampleRate;        //odr sample rate
      uint8_t blockDataUpdate;        //if set wait for all data registers to be read before takeing a new reading

  }accelSettings;

  #ifdef __cplusplus
  }
  #endif

#endif