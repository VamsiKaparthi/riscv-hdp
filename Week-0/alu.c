
#include <stdio.h>

int main()
{
    float a;
    float b;
    int op;
    printf("Enter number-1 ");
    scanf("%f",&a);
    printf("Enter number-2 ");
    scanf("%f",&b);
    printf("Enter 1,2,3,4 for add,subtract,multiply,divide respectively ");
    scanf("%d",&op);
    if(op==1){
        printf("Addition sum = %f",a+b);
    }
    else if(op==2){
        printf("Subtraction difference = %f",a-b);
    }
    else if(op==3){
        printf("Multiplicatio product = %f",a*b);
    }
    else if(op==4){
        printf("Division quotient = %f",a/b);
    }
    else{
        printf("Invalid operation");
    }
    return 0;
}

