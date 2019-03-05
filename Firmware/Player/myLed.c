#include "myLed.h"

#include "nrf_drv_pwm.h"

#define RED_LED_PIN                     BSP_LED_0
#define GREEN_LED_PIN                   BSP_LED_1


#define BLINK_PWM_TOP_VALUE             2500
#define BRIGHTNESS_PWM_TOP_VALUE        100


#define PWM_INSTANCE_CNT 2
static nrf_drv_pwm_t m_pwm0 = NRF_DRV_PWM_INSTANCE(0);
static nrf_drv_pwm_t m_pwm1 = NRF_DRV_PWM_INSTANCE(1);





void pwm_init(uint8_t led, uint16_t topCount);

void setLedBrightness(uint8_t led, uint8_t brightnessPercent)
{

    pwm_init( led, BRIGHTNESS_PWM_TOP_VALUE );

    // This cannot be allocated on stack (hence "static") and it must
    // be in RAM (hence no "const", though its content is not changed).
    static uint16_t /*const*/ brightness_red, brightness_green;




    nrf_pwm_sequence_t seq =
    {
        .length          = 1,
        .repeats         = 0,
        .end_delay       = 0
    };


    

    switch (led) {

    case LED_RED:

        //the max is 2^15
        //the most significant digit controles polarity
        //+0x8000 to invert the pin to the corect polarity
        brightness_red = ((float)brightnessPercent/100.0 * (float)BRIGHTNESS_PWM_TOP_VALUE);
        brightness_red+=0x8000;
        seq.values.p_common = &brightness_red;
        if(!nrf_drv_pwm_is_stopped(&m_pwm0)){
            nrf_drv_pwm_stop(&m_pwm0,true);    //end any current pwm sequence
        }
        (void)nrf_drv_pwm_simple_playback(&m_pwm0, &seq, 1, NRFX_PWM_FLAG_LOOP);
        break;

    case LED_GREEN:

        //the max is 2^15
        //the most significant digit controles polarity
        brightness_green = ((float)brightnessPercent/100.0 * (float)BRIGHTNESS_PWM_TOP_VALUE);
        brightness_green+=0x8000;
        seq.values.p_common = &brightness_green;
        if(!nrf_drv_pwm_is_stopped(&m_pwm1)){
            nrf_drv_pwm_stop(&m_pwm1,true);    //end any current pwm sequence
        }
        (void)nrf_drv_pwm_simple_playback(&m_pwm1, &seq, 1, NRFX_PWM_FLAG_LOOP);
        break;

    default:
        break;

    }

}

void blinkLED(uint8_t led)
{



    /*
     * The LED blinks two times
     */

    pwm_init( led, BLINK_PWM_TOP_VALUE );



    // This array cannot be allocated on stack (hence "static") and it must
    // be in RAM (hence no "const", though its content is not changed).
    static uint16_t /*const*/ seq_values[] =
    {
        //+0x8000 to invert the pin to the corect polarity
        (0+0x8000),
        (0x1500+0x8000),
        (0+0x8000),
        (0x1500+0x8000),
        (0+0x8000)
    };
    nrf_pwm_sequence_t const seq =
    {
        .values.p_common = seq_values,
        .length          = NRF_PWM_VALUES_LENGTH(seq_values),
        .repeats         = 0,
        .end_delay       = 0
    };

    switch (led) {

    case LED_RED:
        if(!nrf_drv_pwm_is_stopped(&m_pwm0)){
            nrf_drv_pwm_stop(&m_pwm0,true);    //end any current pwm sequence
        }
        (void)nrf_drv_pwm_simple_playback(&m_pwm0, &seq, 1, NRF_DRV_PWM_FLAG_STOP);
        break;

    case LED_GREEN:
        if(!nrf_drv_pwm_is_stopped(&m_pwm1)){
            nrf_drv_pwm_stop(&m_pwm1,true);    //end any current pwm sequence
        }
        (void)nrf_drv_pwm_simple_playback(&m_pwm1, &seq, 1, NRF_DRV_PWM_FLAG_STOP);
        break;

    default:
        break;

    }
}



void pwm_init(uint8_t led, uint16_t topCount) {

    nrf_drv_pwm_config_t config;
    static uint16_t instanceTopCnt[PWM_INSTANCE_CNT]={0};

    
    switch (led) {
        case LED_RED:
            if(instanceTopCnt[0]==topCount){
                return;   //do not run setup if there is no change
            }
            instanceTopCnt[0]=topCount;
            break;

        case LED_GREEN:
            if(instanceTopCnt[1]==topCount){
                return;   //do not run setup if there is no change
            }
            instanceTopCnt[1]=topCount;
            break;

        default:
            break;

    }



    config.output_pins[1]=NRF_DRV_PWM_PIN_NOT_USED; // channel 1
    config.output_pins[2]=NRF_DRV_PWM_PIN_NOT_USED; // channel 2
    config.output_pins[3]=NRF_DRV_PWM_PIN_NOT_USED; // channel 3
    config.irq_priority=APP_IRQ_PRIORITY_LOWEST;
    config.base_clock=NRF_PWM_CLK_125kHz;
    config.count_mode=NRF_PWM_MODE_UP;
    config.load_mode=NRF_PWM_LOAD_COMMON;
    config.step_mode=NRF_PWM_STEP_AUTO;
    config.top_value = topCount;

    switch (led) {
    

    case LED_RED:
        
        config.output_pins[0]=LED_RED;// channel 0 NRF_DRV_PWM_PIN_INVERTED

        /*
        //stop pwm after current sequence
        if(!nrf_drv_pwm_is_stopped(&m_pwm0)){
            nrf_drv_pwm_stop(&m_pwm0,true);    //end any current pwm sequence
        }
        */
        nrf_drv_pwm_uninit(&m_pwm0);    //stop pwm imedatly
        APP_ERROR_CHECK(nrf_drv_pwm_init(&m_pwm0, &config, NULL));
        break;

    case LED_GREEN:
        
        config.output_pins[0]=LED_GREEN | NRF_DRV_PWM_PIN_INVERTED;
        /*
        //stop pwm after current sequence
        if(!nrf_drv_pwm_is_stopped(&m_pwm1)){
            nrf_drv_pwm_stop(&m_pwm1,true);    //end any current pwm sequence
        }
        */
        nrf_drv_pwm_uninit(&m_pwm1);    //stop pwm imedatly
        APP_ERROR_CHECK(nrf_drv_pwm_init(&m_pwm1, &config, NULL));
        break;

    default:
        break;

    }



}