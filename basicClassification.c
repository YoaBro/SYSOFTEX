#include "NumClass.h"//is this needed?

//assist func
int factorial(int num){
    if(num==0){
        return 1;
        }
    else{
        return num*factorial(num-1);
        }
}

//option for efficiancy- add sqrt to for loop
int isPrime(int num){
    int tmp=num;
    if (tmp<=1){
        return 0;
    }
    for (int i=2; i<tmp; i++){
        if (tmp%i==0)
        {
            return 0;
        }
    }
    return 1;
}

int isStrong(int num){
    int tmp=num;
    int sum=0;
    
    while(tmp>0){
        int digit=tmp%10;
        sum+=factorial(digit);
        tmp=tmp/10;
    }
    if(sum==num){
        return 1;
    }
    return 0;
}


