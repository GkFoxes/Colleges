//
//  main.cpp
//  laba28-30
//
//  Created by Дмитрий Матвеенко on 17.04.18.
//  Copyright © 2018 GkFoxes. All rights reserved.
//

#include <iostream>
#include <stdio.h>
#include <cstdlib>
#include <ctime>

int score = 0;
//int question = randomNumber();

int questionMathematic(void){
    if (question >=0) {
        
    }
    for (int i = 0; i < 10; i++;){
        
    }
    return 0;
}
int questionOne () {
    int answer = 0;
    for (int i = 0; i < 3; i++) {
        printf("Сколько будет 25+2*3?\n");
        printf("1) 81; 2) 31; 3) 105; 4) 1;\n");
        printf("Осталось попыток: %d\n", 3-i);
        printf("Ответ: ");
        scanf("%d", &answer);
        if (answer == 2) {
            score++;
            i = 4;
        }
    }
    return 0;
}

int questionTwo () {
    int answer = 0;
    for (int i = 0; i < 3; i++) {
        printf("Какой город является столицой Росcии?\n");
        printf("1) Москва; 2) Спб; 3) Калининград; 4) Казань;\n");
        printf("Осталось попыток: %d\n", 3-i);
        printf("Ответ: ");
        scanf("%d", &answer);
        if (answer == 1) {
            score++;
            i = 4;
        }
    }
    return 0;
}

int questionThree () {
    int answer = 0;
    for (int i = 0; i < 3; i++) {
        printf("Кто президент в США?\n");
        printf("1) Путин; 2) Меркель; 3) Трамп; 4) Навальный;\n");
        printf("Осталось попыток: %d\n", 3-i);
        printf("Ответ: ");
        scanf("%d", &answer);
        if (answer == 3) {
            score++;
            i = 4;
        }
    }
    return 0;
}

int questionFour () {
    int answer = 0;
    for (int i = 0; i < 3; i++) {
        printf("Что такое Н20?\n");
        printf("1) Сериал; 2) Вода; 3) Спирт; 4) Бренд;\n");
        printf("Осталось попыток: %d\n", 3-i);
        printf("Ответ: ");
        scanf("%d", &answer);
        if (answer == 2) {
            score++;
            i = 4;
        }
    }
    return 0;
}

int questionFive () {
    int answer = 0;
    for (int i = 0; i < 3; i++) {
        printf("Когда была Куликовская битва?\n");
        printf("1) 1380; 2) 1941; 3) 988; 4) 1541;\n");
        printf("Осталось попыток: %d\n", 3-i);
        printf("Ответ: ");
        scanf("%d", &answer);
        if (answer == 1) {
            score++;
            i = 4;
        }
    }
    return 0;
}

int randomNumber() {
    srand(static_cast<unsigned int>(time(0))); // устанавливаем значение системных часов в качестве стартового числа
    int questionNumber = rand() % (5 - 1 + 1) + 1;
    return questionNumber;
}

int main() {
    int question = randomNumber();
    printf("%d\n", question);
    
    switch (question) {
        case 1:
            questionOne();
            questionTwo();
            questionThree();
            questionFour();
            questionFive();
            break;
        case 2:
            questionTwo();
            questionOne();
            questionThree();
            questionFour();
            questionFive();
            break;
        case 3:
            questionThree();
            questionTwo();
            questionOne();
            questionFour();
            questionFive();
            break;
        case 4:
            questionFour();
            questionThree();
            questionTwo();
            questionOne();
            questionFive();
            break;
        case 5:
            questionFive();
            questionFour();
            questionThree();
            questionTwo();
            questionOne();
            break;
        default:
            break;
    }
    printf("Вы набрали баллов: %d\n", score);
    return 0;
}

