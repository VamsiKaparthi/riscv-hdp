//#include <stdio.h>
#include <time.h>
void delay(int delay){
    int time=delay;
    clock_t start = clock();
    while(clock()<start+(time*CLOCKS_PER_SEC/1000000)){

    }
}
int main() {
    int cnt = 0x00000000;
    int arr = 16;

    while (1) {
        if (cnt == arr) {
            cnt = 0;
        }
    //    printf("%d\n", cnt); // Printing each number on a new line
        cnt++;
        delay(500);
    }

    return 0; // Although unreachable, it's good practice to return an integer in main
}

