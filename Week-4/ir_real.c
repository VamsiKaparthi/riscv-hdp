//#include <stdio.h>
//#include <stdlib.h>

int readState();
void writeState();

int main(){
    /*writeState(1,0xFFFFFFFE,0);
    writeState(0,0xFFFFFFFD,1); (to test)
    writeState(0,0xFFFFFFFB,2);*/
    while(1){
    	if(!readState(2)&&!readState(1)&&readState(0)){ //forward //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed (001)
		writeState(1,0xFFFFFEFF,8);
		writeState(0,0xFFFFFDFF,9);
		writeState(1,0xFFFFFBFF,10);
		writeState(1,0xFFFFF7FF,11);
    	}
    	else if(!readState(2)&&readState(1)&&!readState(0)){ //reverse //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed (010)
		writeState(0,0xFFFFFEFF,8);
		writeState(1,0xFFFFFDFF,9);
		writeState(1,0xFFFFFBFF,10);
		writeState(1,0xFFFFF7FF,11);
    	}
    	else if(!readState(2)&&readState(1)&&readState(0)){ //left //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed (011)
		writeState(1,0xFFFFFEFF,8);
		writeState(0,0xFFFFFDFF,9);
		writeState(0,0xFFFFFBFF,10);
		writeState(1,0xFFFFF7FF,11);
    	}
    	else if(readState(2)&&readState(1)&&!readState(0)){ //right //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed (110)
		writeState(1,0xFFFFFEFF,8);
		writeState(0,0xFFFFFDFF,9);
		writeState(0,0xFFFFFBFF,10);
		writeState(1,0xFFFFF7FF,11);
    	}
    	else{ //error stop
		writeState(0,0xFFFFFEFF,8);
		writeState(0,0xFFFFFDFF,9);
		writeState(0,0xFFFFFBFF,10);
		writeState(0,0xFFFFF7FF,11);
    	}
    }
}

int readState(int position){
    int var;
    asm volatile("srl x10,x30,%0\n\t" //shift by position because ir sensor input
	         "andi %0,x10,1\n\t"
		 : "=r"(var)
		 : "r"(position)
		 : "x10");
    return var;
};


void writeState(int GPIO_state, int mask, int bit_position){
    int bitShifted = GPIO_state<<bit_position;	
    asm volatile("and x30,x30, %1\n\t"
		 "or x30,x30, %0\n\t"
		 :
		 : "r"(bitShifted), "r"(mask)
		 : "x30"
    );
}

