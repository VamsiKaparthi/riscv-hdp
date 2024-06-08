## Week-4
### NEC Protocol 

Logic is represented as follows: 
  - Logical 1 is represented by 560 us of signal high, followed by 1.69 ms of signal low.    
    Total time taken to represent is 2.25 ms.
  - Logical 0 is represented by 560 us of signal high, followed by 560 us of signal low.     
    Total time taken to represent is 1.12 ms.
    
Protocol is as follows:

   ![image](https://github.com/VamsiKaparthi/riscv-hdp/assets/89274263/a42e843f-a883-415b-ad14-75bcf6ee9520)

Application code is as follows: 
      
    #include <stdio.h>
    #include <stdlib.h>


    int readState(){
        int var;
        asm volatile("srli x10,x30,31\n\t" //shift by 31 because ir sensor input is coming from 0 of x30 register
	    "andi %0,x10,1\n\t"
	    : "=r"(var)
	    :
	    : "x10");
        return var;
    };

    void decimalToHex(int decNumber,char hexNumber[]){
        int temp;
        int i=0;
    	while(decNumber!=0){
	    temp=decNumber%16;
	    if(temp<10){
	       temp=temp+48;
            }
	    else{
               temp=temp+55;
            }
	    hexNumber[i++]=temp;
	    decNumber=decNumber/16;
       }
    }

    int compareHexStrings(const char* str1, const char* str2) {
        while (*str1 && *str2) {
            if (*str1 != *str2) {
                return 0; // Not equal
            }
            str1++;
        str2++;
        }
        return 1; // Both strings end at the same time
    }

    int recieveData(){

        int count;
        int readValue=1;
        //Start sequence will consist of 9ms low and 4.5ms high
        while(!readState()){ //low
        }
        while(readState()){ //high
        }

    
        //bit 0-> [562.5us high then 562.5us low] total = 1.125ms
        //bit 1-> [562.5us high then 1.6875ms low] total = 2.25ms

        for(int i = 0; i<32; i++){ //read and calculate decimal value
	    while(!readState()){ //wait for pin to go high, this is 562.5us low
	    }    
	    while(readState()){
	       count++;
               for(int j = 0; j < 10000; j++){
               //delay of 100microseconds assuming 10Mhz core and 1 cycle for each loop iteration		
	       }
	    }
             //if count is more than 1.2milliseconds than take the bit as 1 else take the bit as 0
             if(count>12){
	       for(int k=0; k<i; k++){
		    readValue=readValue*2; //exponentiation to get decimal value
	       }
	     }
	     else{
	        readValue+=0;
	     }	
        }

        return readValue;
    
    }

    void writeState(int GPIO_state, int mask, int bit_position){
        int bitShifted = GPIO_state>>bit_position;	
        asm volatile("and x30,x30, %1\n\t"
	    	 "or x30,x30, %0\n\t"
		 :
		 : "r"(bitShifted), "r"(mask)
		 : "x30"
        );
    }

    int drive(int value){
        char hexNumber[9];
        //convert to hexadecimal
        decimalToHex(value,hexNumber);
        if(compareHexStrings(hexNumber,"FFFFFFFF")){ //forward //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed
		writeState(1,0xFFFFFEFF,8);
	    	writeState(0,0xFFFFFDFF,9);
	    	writeState(1,0xFFFFFBFF,10);
	    	writeState(1,0xFFFFF7FF,11);
        }
        else if(compareHexStrings(hexNumber,"FFFFFFFE")){ //reverse //8th(dir1) and 9th 
    bit(dir2) for direction // 10th(right) and 11th(left) for speed
	    	writeState(0,0xFFFFFEFF,8);
	    	writeState(1,0xFFFFFDFF,9);
	    	writeState(1,0xFFFFFBFF,10);
	    	writeState(1,0xFFFFF7FF,11);
        }
        else if(compareHexStrings(hexNumber,"FFFFFFFD")){ //left //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed
	    	writeState(1,0xFFFFFEFF,8);
	    	writeState(0,0xFFFFFDFF,9);
	    	writeState(1,0xFFFFFBFF,10);
	    	writeState(0,0xFFFFF7FF,11);
        }
        else if(compareHexStrings(hexNumber,"FFFFFFFC")){ //right //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed
	     	writeState(1,0xFFFFFEFF,8);
	     	writeState(0,0xFFFFFDFF,9);
	     	writeState(0,0xFFFFFBFF,10);
	    	writeState(1,0xFFFFF7FF,11);
         }
         else{
	     	writeState(0,0xFFFFFEFF,8);
	    	writeState(0,0xFFFFFDFF,9);
	     	writeState(0,0xFFFFFBFF,10);
	     	writeState(0,0xFFFFF7FF,11);
         }
    }
    int main(){
        int data;
        while(1){
		while(readState()){
	    	}
	    	data = recieveData();
	    	drive(data);
        }
    }

