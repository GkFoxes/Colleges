//
//  main.cpp
//  laba30
//
//  Created by Дмитрий Матвеенко on 18.04.18.
//  Copyright © 2018 GkFoxes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <iostream>
#include <cstdlib>
#include <ctime>

int math(int firstNumber, int secondNumber, char plusOrMinus) {
    if (plusOrMinus == '+'){
        return(firstNumber + secondNumber);
    } else if (plusOrMinus == '-'){
        return(firstNumber - secondNumber);
    }
    return 0;
}

int questionMath(void) {
    srand(static_cast<unsigned int>(time(0)));
    return(rand() % 10);
}

int questionMathTwo(void) {
    return(rand() % 10);
}

int total(int result) {
    switch (result) {
        case 1:
            return(result=1);
            break;
        case 2:
            return(result=1);
            break;
        case 3:
            return(result=1);
            break;
        case 4:
            return(result=2);
            break;
        case 5:
            return(result=3);
            break;
        case 6:
            return(result=3);
            break;
        case 7:
            return(result=3);
            break;
        case 8:
            return(result=4);
            break;
        case 9:
            return(result=4);
            break;
        case 10:
            return(result=5);
            break;
        default:
            printf("Как так?\n");break;
    }
    return 0;
}

char signal(void) {
    int plusOrMinus = rand() % 2;
    
    if (plusOrMinus == 0) {
        return('+');
    } else {
        return('-');
    }
}



int main() {
    int firstNumber, secondNumber, answer, score=0;
    char plusOrMinus;
    printf("Напишите ответы на примеры!\n");
    printf("На каждый пример у вас есть 3 попытки\n");
    printf("За один не правильный ответ у вас отнимают 1 балл!\n");
    for (int i=0; i<10; i++){
        
        firstNumber=questionMath();
        secondNumber=questionMathTwo();
        plusOrMinus=signal();
        
        printf ("%i %c %i = ", firstNumber, plusOrMinus, secondNumber);
        
        for (int t=0; t<3; t++){
            scanf ("%i", &answer);
            if (answer == math(firstNumber, secondNumber, plusOrMinus)) {
                score++;
                t = 4;
            } else if (answer != math(firstNumber, secondNumber, plusOrMinus)) {
                score--;
                printf("У вас осталось попыток %d\n", 2-t);
                if (t<2) {
                    printf("Введите новый ответ: ");
                }
            }
        }
    }
    
    printf ("Ваша оценка: %i\n", total(score));
    return 0;
}
