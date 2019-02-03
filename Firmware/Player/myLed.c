#include "myLed.h"

#include "nrf_drv_pwm.h"

#define RED_LED_PIN                     BSP_LED_0
#define GREEN_LED_PIN                   BSP_LED_1

static nrf_drv_pwm_t m_pwm0 = NRF_DRV_PWM_INSTANCE(0);
static nrf_drv_pwm_t m_pwm1 = NRF_DRV_PWM_INSTANCE(1);

static uint8_t pwmStarted=0;


void pwm_init();

void BlinkLED(uint8_t led)
{

    /*
     * This demo uses only one channel, which is reflected on LED 1.
     * The LED blinks three times (200 ms on, 200 ms off), then it stays off
     * for one second.
     * This scheme is performed three times before the peripheral is stopped.
     */
    #warning  "i dont know how to make the green led pwm yet"

    if (!pwmStarted){
        pwmStarted=1;
        pwm_init();
    }

    

    // This array cannot be allocated on stack (hence "static") and it must
    // be in RAM (hence no "const", though its content is not changed).
    static uint16_t /*const*/ seq_values[] =
    {
        0x8000,
             0,
        0x8000,
             0,
        0x8000,
             0
    };
    nrf_pwm_sequence_t const seq =
    {
        .values.p_common = seq_values,
        .length          = NRF_PWM_VALUES_LENGTH(seq_values),
        .repeats         = 0,
        .end_delay       = 4
    };

    switch (led){

        case LED_RED:
            (void)nrf_drv_pwm_simple_playback(&m_pwm0, &seq, 3, NRF_DRV_PWM_FLAG_STOP);
            break;

        case LED_GREEN:
            (void)nrf_drv_pwm_simple_playback(&m_pwm1, &seq, 3, NRF_DRV_PWM_FLAG_STOP);
            break;

        default:
            break;
    
    }
}

void pwm_init(){
    nrf_drv_pwm_config_t const config0 =
    {
        .output_pins =
        {
            LED_RED, // channel 0 NRF_DRV_PWM_PIN_INVERTED
            NRF_DRV_PWM_PIN_NOT_USED,             // channel 1
            NRF_DRV_PWM_PIN_NOT_USED,             // channel 2
            NRF_DRV_PWM_PIN_NOT_USED,             // channel 3
        },
        .irq_priority = APP_IRQ_PRIORITY_LOWEST,
        .base_clock   = NRF_PWM_CLK_125kHz,
        .count_mode   = NRF_PWM_MODE_UP,
        .top_value    = 25000,
        .load_mode    = NRF_PWM_LOAD_COMMON,
        .step_mode    = NRF_PWM_STEP_AUTO
    };

        nrf_drv_pwm_config_t const config1 =
    {
        .output_pins =
        {
            LED_GREEN, // channel 0 NRF_DRV_PWM_PIN_INVERTED
            NRF_DRV_PWM_PIN_NOT_USED,             // channel 1
            NRF_DRV_PWM_PIN_NOT_USED,             // channel 2
            NRF_DRV_PWM_PIN_NOT_USED,             // channel 3
        },
        .irq_priority = APP_IRQ_PRIORITY_LOWEST,
        .base_clock   = NRF_PWM_CLK_125kHz,
        .count_mode   = NRF_PWM_MODE_UP,
        .top_value    = 25000,
        .load_mode    = NRF_PWM_LOAD_COMMON,
        .step_mode    = NRF_PWM_STEP_AUTO
    };

    APP_ERROR_CHECK(nrf_drv_pwm_init(&m_pwm0, &config0, NULL));
    APP_ERROR_CHECK(nrf_drv_pwm_init(&m_pwm1, &config1, NULL));





}