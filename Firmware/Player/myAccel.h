/*
  this file povides the glue for the acceleromiter and the i2c comunication of the mcu
  as well as some general accel setup functions
*/

#ifndef MYACCEL_H
#define MYACCEL_H

  #ifdef __cplusplus
  extern "C" {
  #endif



  /*
      accelmode_WaitForWakeup = very slowly take mesurements and inturupt when a threshold has been met to power on the device
  */
  typedef enum  accelmode {accelmode_WaitForWakeup, accelmode_SimpleReading}accelMode;

  typedef enum  myaccelstate {myaccelstate_Success, myaccelstate_Fail}myAccelState;

  myAccelState initAccel(accelMode mode);


  #ifdef __cplusplus
  }
  #endif

#endif