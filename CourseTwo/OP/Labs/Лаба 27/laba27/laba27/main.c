//
//  main.c
//  laba27
//
//  Created by Дмитрий Матвеенко on 29.03.18.
//  Copyright © 2018 GkFoxes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

float func(float u, float t) {
    if (u>0 && t>0) {
        return (u*u+t*t);
    } else if (u<=0 && t<=0) {
        return (u+t*t);
    } else if (u>0 && t<=0){
        return (u-t);
    } else {
        return (u+t);
    }
}

int main() {
    float a=0, b=0, z=0;
    
    puts("Введите числа a и b:");
    scanf("%f,%f",&a, &b);
    
    z = func(a*a, b*b) + func(a*a-1, b) + func(a-b, b) + func(a*a+b*b, b*b-1);
    printf("Ваш ответ: %f\n", z);
    return 0;
}

