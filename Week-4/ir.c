#include <stdio.h>
#include <stdlib.h>

int readState();
void writeState();

int main(){
    int decision;
    while(1){        
    	printf("Enter 1,2,3,4 for forward, reverse, left, right ");
    	scanf("%d",&decision);
    	if(decision==1){ //forward //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed
		writeState(1,0xFFFFFEFF,8);
		writeState(0,0xFFFFFDFF,9);
		writeState(1,0xFFFFFBFF,10);
		writeState(1,0xFFFFF7FF,11);
    	}
    	else if(decision==2){ //reverse //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed
		writeState(0,0xFFFFFEFF,8);
		writeState(1,0xFFFFFDFF,9);
		writeState(1,0xFFFFFBFF,10);
		writeState(1,0xFFFFF7FF,11);
    	}
    	else if(decision==3){ //left //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed
		writeState(1,0xFFFFFEFF,8);
		writeState(0,0xFFFFFDFF,9);
		writeState(0,0xFFFFFBFF,10);
		writeState(1,0xFFFFF7FF,11);
    	}
    	else if(decision==4){ //right //8th(dir1) and 9th bit(dir2) for direction // 10th(right) and 11th(left) for speed
		writeState(1,0xFFFFFEFF,8);
		writeState(0,0xFFFFFDFF,9);
		writeState(0,0xFFFFFBFF,10);
		writeState(1,0xFFFFF7FF,11);
    	}
    	else{ //error
		writeState(0,0xFFFFFEFF,8);
		writeState(0,0xFFFFFDFF,9);
		writeState(0,0xFFFFFBFF,10);
		writeState(0,0xFFFFF7FF,11);
    	}
	printf("8th gpio pin has the value %d\n",readState(8));
        printf("9th gpio pin has the value %d\n",readState(9));
	printf("10th gpio pin has the value %d\n",readState(10));
	printf("11th gpio pin has the value %d\n",readState(11));
    }
}

int readState(int position){
    int var;
    asm volatile("srl x10,x27,%0\n\t" //shift by position because ir sensor input
	         "andi %0,x10,1\n\t"
		 : "=r"(var)
		 : "r"(position)
		 : "x10");
    return var;
};


void writeState(int GPIO_state, int mask, int bit_position){
    int bitShifted = GPIO_state<<bit_position;	
    asm volatile("and x27,x27, %1\n\t"
		 "or x27,x27, %0\n\t"
		 :
		 : "r"(bitShifted), "r"(mask)
		 : "x30"
    );
}

