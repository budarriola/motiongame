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


  #ifdef __cplusplus
  }
  #endif

#endif