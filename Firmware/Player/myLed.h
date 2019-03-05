#ifndef MYLED_H
#define MYLED_H

#ifdef __cplusplus
extern "C" {
#endif


#include <stdint.h>
#include "boards.h"



void blinkLED(uint8_t led);
void setLedBrightness(uint8_t led,uint8_t brightnessPercent);

#ifdef __cplusplus
}
#endif
#endif
