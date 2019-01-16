//
//  main.c
//  Лаба 9
//
//  Created by Дмитрий Матвеенко on 02.11.17.
//  Copyright © 2017 Дмитрий Матвеенко. All rights reserved.
//

#include <stdio.h>
#include<math.h>

int main() {
    double x, x1, x2, y, delx;
    
    do {
        printf("Введите начальное значение x: ");
        scanf("%lf", &x1);
    } while (x1<2 || x1>3);
    
    do {
    printf("Введите конечное значение x: ");
    scanf("%lf", &x2);
    } while (x1<2 || x1>3);
   
    printf("Введите шаг (delx): ");
    scanf("%lf", &delx);
    
    for (x=x1; x1<=x2; x1=x1+delx) {
        y = (tan((x1*x1-1)*(x1*x1-1))/(-log(x1)));
        printf("При x1 = %lf, y = %lf\n", x1, y);
    }
    return 0;
}
