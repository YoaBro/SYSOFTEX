
int power(int,int);


//efficiancy option- maybe add seperate func for numDigits
int isArmstrong(int num){
    int tmp=num;
    int sum=0;
    int numDigits = 0;
    
    while(tmp>0){
        numDigits=numDigits+1;
        tmp=tmp/10;
    }

    tmp=num;

    while(tmp>0){
        int digit=tmp%10;
        sum+= power(digit,numDigits);
        tmp=tmp/10;
    }

    if(sum==num){
        return 1;
    }
    return 0;
}

int isPalindrome(int num){
    int reveredDigits= 0;
    int tmp=num;

    while (tmp>0)
    {
        int digit = tmp%10;
        reveredDigits=reveredDigits*10+digit;
        tmp /=10;
    }

    if(num==reveredDigits){
        return 1;
    }
    else{
        return 0;
    }
}


int power(int digit, int exp){
    if (exp==0) {
        return 1;
    } else {
        return digit*power(digit, exp - 1);
    }
}