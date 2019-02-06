#include "power.h"
#include "boards.h"

void nvmcErase(void);


/**
 * @brief Function to erase UICR Registers.
 */
void nvmcErase(void){       
  if (NRF_UICR->REGOUT0 != UICR_REGOUT0_VOUT_3V3) 
  {
      NRF_NVMC->CONFIG = NVMC_CONFIG_WEN_Een << NVMC_CONFIG_WEN_Pos;        //write enable
      while (NRF_NVMC->READY == NVMC_READY_READY_Busy){}                    //wait untill the memory is not busy
      NRF_NVMC->ERASEUICR = NVMC_ERASEUICR_ERASEUICR_Erase << NVMC_ERASEUICR_ERASEUICR_Pos;   //erase UICR
      while (NRF_NVMC->READY == NVMC_READY_READY_Busy){}
      NRF_NVMC->CONFIG = NVMC_CONFIG_WEN_Ren << NVMC_CONFIG_WEN_Pos;  //read only enable
      while (NRF_NVMC->READY == NVMC_READY_READY_Busy){}
  }
}


/**
 * @brief Function for configuration of REGOUT0. the UICR must first be erased before it can be written to
 */
void UicrInit(void)
{
    //check to see if we need to change anything
    if (NRF_UICR->REGOUT0 != UICR_REGOUT0_VOUT_3V3) 
    {
        uint8_t i;
        NRF_UICR_Type tempUicr;
  
        //backup the UICR space-----------------------------------------
        tempUicr.UNUSED0   = NRF_UICR->UNUSED0;
        tempUicr.UNUSED1   = NRF_UICR->UNUSED1;
        tempUicr.UNUSED2   = NRF_UICR->UNUSED2;
        //tempUicr.RESERVED  = NRF_UICR->RESERVED;
        tempUicr.UNUSED3   = NRF_UICR->UNUSED3;

        for(i=0;i<15;i++){
            tempUicr.NRFFW[i] = NRF_UICR->NRFFW[i];
        }
    
        for(i=0;i<12;i++){
            tempUicr.NRFHW[i] = NRF_UICR->NRFHW[i];
        }

        for(i=0;i<32;i++){
            tempUicr.CUSTOMER[i] = NRF_UICR->CUSTOMER[i];
        }
    
        /*
        for(i=0;i<64;i++){
            tempUicr.RESERVED1[i] = NRF_UICR->RESERVED1[i];
        }
        */
        for(i=0;i<2;i++){
            tempUicr.PSELRESET[i] = NRF_UICR->PSELRESET[i];
        }

        tempUicr.APPROTECT = NRF_UICR->APPROTECT;
        tempUicr.NFCPINS = NRF_UICR->NFCPINS;
        tempUicr.DEBUGCTRL = NRF_UICR->DEBUGCTRL;
        /*
        for(i=0;i<60;i++){
            tempUicr.RESERVED2[i] = NRF_UICR->RESERVED2[i];
        }
        */
        tempUicr.REGOUT0 = NRF_UICR->REGOUT0;
        //backup complete--------------------------------------------------

     
        
        //now that the memory has been backed up, erase the memory
        nvmcErase();

        

        //make our changes to the temp data
        tempUicr.REGOUT0 = UICR_REGOUT0_VOUT_3V3;

        

        NRF_NVMC->CONFIG = NVMC_CONFIG_WEN_Wen << NVMC_CONFIG_WEN_Pos;    //write enable
        while (NRF_NVMC->READY == NVMC_READY_READY_Busy){}
        
        //start write our values back to the UCIR

        NRF_UICR->UNUSED0 = tempUicr.UNUSED0;
        NRF_UICR->UNUSED1 = tempUicr.UNUSED1;
        NRF_UICR->UNUSED2 = tempUicr.UNUSED2;
        //NRF_UICR->RESERVED = tempUicr.RESERVED;
        NRF_UICR->UNUSED3 = tempUicr.UNUSED3;

        for(i=0;i<15;i++){
            NRF_UICR->NRFFW[i] = tempUicr.NRFFW[i];
        }
    
        for(i=0;i<12;i++){
            NRF_UICR->NRFHW[i] = tempUicr.NRFHW[i];
        }

        for(i=0;i<32;i++){
            NRF_UICR->CUSTOMER[i] = tempUicr.CUSTOMER[i];
        }
        /*
        for(i=0;i<64;i++){
            NRF_UICR->RESERVED1[i] = tempUicr.RESERVED1[i];
        }
        */
        for(i=0;i<2;i++){
            NRF_UICR->PSELRESET[i] = tempUicr.PSELRESET[i];
        }

        NRF_UICR->APPROTECT = tempUicr.APPROTECT;
        NRF_UICR->NFCPINS = tempUicr.NFCPINS;
        NRF_UICR->DEBUGCTRL = tempUicr.DEBUGCTRL;
        /*
        for(i=0;i<60;i++){
            NRF_UICR->RESERVED2[i] = tempUicr.RESERVED2[i];
        }
        */
        NRF_UICR->REGOUT0 = tempUicr.REGOUT0;

        //end write our values back to the UCIR

        NRF_NVMC->CONFIG = NVMC_CONFIG_WEN_Ren << NVMC_CONFIG_WEN_Pos;    //set read only
        while (NRF_NVMC->READY == NVMC_READY_READY_Busy){}
        NVIC_SystemReset();                                               // Reset device so the config will take effect

    }

}