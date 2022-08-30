
/** I N C L U D E S **********************************************************/
#include <p18cxxx.h>
#include "system\typedefs.h"
#include "system\usb\usb.h"
#include "io_cfg.h"             // I/O pin mapping
#include "user\user.h"
/** V A R I A B L E S ********************************************************/
#pragma udata
byte old_sw2,old_sw3;
char input_buffer[64];
char my_buffer[64];
char output_buffer[32];
unsigned int counter,mPtr,index,inPtr,outPtr,Ost,Ist,Ast;
volatile unsigned char DATA,ch,OutputState,Ach;
unsigned int ADC;

unsigned int ADCA;
unsigned int ADCB;

//unsigned int ADC_Const;

double ADC_Const;

/** P R I V A T E  P R O T O T Y P E S ***************************************/
void BlinkUSBStatus(void);
void User_Process(void);
void Check_Update_Output(void);
void Check_Update_Input(void);
void update_bit(unsigned char Chan,unsigned char Data);
void GetInputStatus(void);
void Check_Update_ADC(void);
unsigned int Read_ADC_Chanel(unsigned char ch);

#pragma code
void UserInit(void)
{
    mInitADC();
    mInitInput();

	ADC_Const=5000/0x3FF;

	//mInitAllSwitches();
    //old_sw2 = sw2;
    //old_sw3 = sw3; 
    mInitOutput();    
    inPtr=outPtr=Ost=Ist=Ast=0;        
}//end UserInit



/******************************************************************************
 * Function:        void ProcessIO(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        This function is a place holder for other user routines.
 *                  It is a mixture of both USB and non-USB tasks.
 *
 * Note:            None
 *****************************************************************************/
void ProcessIO(void)
{   
	BlinkUSBStatus();

		if((usb_device_state < CONFIGURED_STATE)||(UCONbits.SUSPND==1)) return;
			
	//}
User_Process();	

}//end ProcessIO


//----------------------------        

unsigned int Read_ADC_Chanel(unsigned char CHANNEL)
{
		ADCON0bits.CHS0=(CHANNEL&0b00000001);
		ADCON0bits.CHS1=((CHANNEL&0b00000010)>>1);
		ADCON0bits.CHS2=((CHANNEL&0b00000100)>>2);
	 
	    ADCON0bits.GO = 1;              // Start AD conversion
    	while(ADCON0bits.NOT_DONE);     // Wait for conversion
    
    	return ADRES; //* ADC_Const;
}

//----------------------------
// Read ADC
void Check_Update_ADC(void)
{
	unsigned char i;
	unsigned char CHANNEL;

	unsigned int Avr_T;

		output_buffer[0] = '*';
    	output_buffer[1] = 'C';
	 
		ADCA=0;
		ADCB=0;

		for(i=0;i<10;i++)
    	{
	    	CHANNEL=0x30 & 0x07;
			ADCA=ADCA + Read_ADC_Chanel(CHANNEL);  	             

			CHANNEL=0x31 & 0x07;
			ADCB=ADCB + Read_ADC_Chanel(CHANNEL); 
		}

		ADCA=ADCA / 10;
		ADCB=ADCB / 10;

		if (ADCA > 0)
      	{
			output_buffer[2] = 0x2D;

      		for(i=0;i<4;i++)
    		{
        		output_buffer[i+3] = (((char)(ADCA % 10)) & 0x0F) | 0x30;
        		ADCA /= 10;
   	 		}//end for 
		}
    	else
		{
      		if (ADCB > 0)
        	{
				output_buffer[2] = 0x30;

				for(i=0;i<4;i++)
    			{
        			output_buffer[i+3] = (((char)(ADCB % 10)) & 0x0F) | 0x30;
        			ADCB /= 10;
   	 			}//end for 
			}
			else
        	{
				output_buffer[2] = 0x30;
				ADC=0;

				for(i=0;i<4;i++)
    			{
        			output_buffer[i+3] = (((char)(ADC % 10)) & 0x0F) | 0x30;
        			ADC /= 10;
   	 			}//end for
			};
		};              

		
		ADCA=0;
		ADCB=0;

		for(i=0;i<10;i++)
    	{
			CHANNEL=0x32 & 0x07;
			ADCA=ADCA + Read_ADC_Chanel(CHANNEL);  	             

			CHANNEL=0x33 & 0x07;
			ADCB=ADCB + Read_ADC_Chanel(CHANNEL);
		}

		ADCA=ADCA / 10;
		ADCB=ADCB / 10;

		if (ADCA > 0)
      	{
			output_buffer[7] = 0x2D;

      		for(i=0;i<4;i++)
    		{
        		output_buffer[i+8] = (((char)(ADCA % 10)) & 0x0F) | 0x30;
        		ADCA /= 10;
   	 		}//end for 
		}
    	else
		{
      		if (ADCB > 0)
        	{
				output_buffer[7] = 0x30;

				for(i=0;i<4;i++)
    			{
        			output_buffer[i+8] = (((char)(ADCB % 10)) & 0x0F) | 0x30;
        			ADCB /= 10;
   	 			}//end for 
			}
			else
        	{
				output_buffer[7] = 0x30;
				ADC=0;

				for(i=0;i<4;i++)
    			{
        			output_buffer[i+8] = (((char)(ADC % 10)) & 0x0F) | 0x30;
        			ADC /= 10;
   	 			}//end for
			};
		};	

		Avr_T=0;
		CHANNEL=0x34 & 0x07;

		for(i=0;i<10;i++)
    	{
        	Avr_T=Avr_T + Read_ADC_Chanel(CHANNEL);
   	 	}

		
		ADC=Avr_T / 10;

    	for(i=0;i<4;i++)
    	{
        	output_buffer[i+12] = (((char)(ADC % 10)) & 0x0F) | 0x30;
        	ADC /= 10;
   	 	}//end for

		output_buffer[16]=(PORTB & 0x0F) | 0x30;
	    output_buffer[17]=((PORTB>>4) & 0x0F) | 0x30;

        output_buffer[18] = 0x0D;
                
	    if(mUSBUSARTIsTxTrfReady())
        {
           	mUSBUSARTTxRam((byte*)output_buffer,19);
        }		
}
	

//----------------------------
// Update Output
//----------------------------
void update_bit(unsigned char Chan,unsigned char Data)
{
			switch (Chan)
       		{
		    	case 0x00 : mLED_3=Data & 0x01;break;		        			
		    	case 0x01 : mLED_4=Data & 0x01;break;
				
				case 0x02 :
					{
						mLED_5_Off();
						mLED_6_Off();
					} break;
				case 0x03 : 
					{
						mLED_5_On();
						mLED_6_Off();
					} break;
				case 0x04 : 
					{
						mLED_5_Off();
						mLED_6_On();
					} break;
				case 0x05 :
					{
						mLED_5_On();
						mLED_6_On();
					} break;;
				case 0x06 :
					{
						mLED_7_Off();
						mLED_8_Off();
					} break;

				case 0x07 : 
					{
						mLED_7_On();
						mLED_8_Off();
					} break;
				case 0x08 : 
					{
						mLED_7_Off();
						mLED_8_On();
					} break;
				case 0x09 :
					{
						mLED_7_On();
						mLED_8_On();
					} break;;		               
		    }		    
}	

//----------------------------
// Get Input Status
// input : none
// output: USB Port <== [*]['B'][Status:Byte][0x0D] , total 4 byte
//----------------------------
void GetInputStatus(void)
{
	    output_buffer[0]='*';
	    output_buffer[1]='W';
		
	    output_buffer[2]='-';
	    output_buffer[3]='-';
	    
		output_buffer[4]='1';
		output_buffer[5]='0';
		output_buffer[6]='8';

		output_buffer[7]=0x0D;

	    if(mUSBUSARTIsTxTrfReady())
        {
         	mUSBUSARTTxRam((byte*)output_buffer,8);
        }      
}	

//----------------------------
// Check to update output
//----------------------------
void Check_Update_Output(void)
{
         
	      if (Ost==0)
	      {
		    if (DATA=='*')Ost=1;
		  }
		  else
	 	  if (Ost==1)
		  {
			Ost=0;   
			if (DATA=='A')
			Ost=2;			
		  }
		  else
		  if (Ost==2)
		  {			
			ch=DATA & 0x0F;
			Ost=3;
		  }
		  else
		  if (Ost==3)
		  {
			  OutputState=DATA & 0x01;
			 Ost=4;
		  }
		  else
		  if (Ost==4)
		  {			  
			  if (DATA==0x0D)			  
			  update_bit(ch,OutputState);
			 Ost=0;	
		  }			  
}

//----------------------------
// Check to update Input
//----------------------------
void Check_Update_Input(void)
{
	      if (Ist==0)
	      {
		    if (DATA=='*') Ist=1;
		  }
		  else
	 	  if (Ist==1)
		  {
			Ist=0;   
			if (DATA=='W')
			Ist=2;			
		  }
		  else
		  if (Ist==2)
		  {			  
			  if (DATA==0x0D)			  
			  GetInputStatus();
			  Ist=0;	
		  }			  
}
	
//****************************************
// User change here
//****************************************
void User_Process(void)
{
	static word icount=0;

	counter++;
	if (counter==5000)	{
		counter=0;     
    	Check_Update_ADC();
		}

    if(getsUSBUSART(input_buffer,32))
    {
		mPtr = mCDCGetRxLength();
		for(index = 0; index < mPtr; index++)
		{  		
		   my_buffer[inPtr]= input_buffer[index];
		   inPtr++;
		   if (inPtr==64) inPtr=0;
		}  	    
    }
        
    if (inPtr!=outPtr)
    {
	      DATA=my_buffer[outPtr];
	      outPtr++;
	      if (outPtr==64) outPtr=0;

		  Check_Update_Output();
    	  Check_Update_Input();	
	}      
	    
}
/******************************************************************************
 * Function:        void BlinkUSBStatus(void)
 *
 * PreCondition:    None
 *
 * Input:           None
 *
 * Output:          None
 *
 * Side Effects:    None
 *
 * Overview:        BlinkUSBStatus turns on and off LEDs corresponding to
 *                  the USB device state.
 *
 * Note:            mLED macros can be found in io_cfg.h
 *                  usb_device_state is declared in usbmmap.c and is modified
 *                  in usbdrv.c, usbctrltrf.c, and usb9.c
 *****************************************************************************/
void BlinkUSBStatus(void)
{
    static word led_count=0;
    
    if(led_count == 0)led_count = 10000U;
    led_count--;

    #define mLED_Both_Off()         {mLED_1_Off();mLED_2_Off();}
    #define mLED_Both_On()          {mLED_1_On();mLED_2_On();}
    #define mLED_Only_1_On()        {mLED_1_On();mLED_2_Off();}
    #define mLED_Only_2_On()        {mLED_1_Off();mLED_2_On();}

    if(UCONbits.SUSPND == 1)
    {
        if(led_count==0)
        {
            mLED_1_Toggle();
            mLED_2 = mLED_1;        // Both blink at the same time
        }//end if
    }
    else
    {
        if(usb_device_state == DETACHED_STATE)
        {
            mLED_Both_Off();
        }
        else if(usb_device_state == ATTACHED_STATE)
        {
            mLED_Both_On();
        }
        else if(usb_device_state == POWERED_STATE)
        {
            mLED_Only_1_On();
        }
        else if(usb_device_state == DEFAULT_STATE)
        {
            mLED_Only_2_On();
        }
        else if(usb_device_state == ADDRESS_STATE)
        {
            if(led_count == 0)
            {
                mLED_1_Toggle();
                mLED_2_Off();
            }//end if
        }
        else if(usb_device_state == CONFIGURED_STATE)
        {
            if(led_count==0)
            {
                mLED_1_Toggle();
                mLED_2 = !mLED_1;       // Alternate blink                
            }//end if
        }
    }

}
