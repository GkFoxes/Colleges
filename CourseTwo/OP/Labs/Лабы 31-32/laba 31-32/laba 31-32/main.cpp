//
//  main.cpp
//  laba 31-32
//
//  Created by Дмитрий Матвеенко on 18.04.18.
//  Copyright © 2018 GkFoxes. All rights reserved.
//

#include <iostream>
#include <string>
#include <math.h>

//Вычислить суммы положительных элементов каждой строки для матриц a(4,5) и b(5,6).

//using namespace std;
//
//void positiveStrings (int *matr, int size){
//    int str[size];
//    for(int i = 0; i < size; i++){
//        str[i] = 0;
//        for(int j = 0; j < size; j++){
//            if (*(matr+i*size + j) > 0) {
//                str[i] += *(matr+i*size + j);
//            }
//        }
//        printf("Сумма %d строки = %d\n", i+1, str[i]);
//    }
//}
//
//int main(){
//
//    int n = 0;
//    int m = 0;
//    int *matrA = new int [n * n];
//    int *matrB = new int [n * n];
//
//    printf("Введите размерность квадратной матрицы А: ");
//    scanf("%d", &n);
//    puts("Введите матрицу А:");
//    for (int i = 0; i < n; i++) {
//        for (int j = 0; j < n; j++) {
//            scanf("%d", (matrA + i*n + j));
//        }
//    }
//
//    printf("Введите размерность квадратной матрицы Б: ");
//    scanf("%d", &m);
//    puts("Введите матрицу Б:");
//    for (int i = 0; i < m; i++) {
//        for (int j = 0; j < m; j++) {
//            scanf("%d", (matrB + i*m + j));
//        }
//    }
//
//    positiveStrings (matrA, n);
//    positiveStrings (matrB, m);
//
//    return 0;
//}

float func(float rad) {
    float v = 0;
    v = ((1.3*(3.14))*rad);
    printf("Объем шара v = %f\n", v);
    return v;
}

int main() {
    float r1=0, r2=0, r3=0;
    float z = 0;
    
    printf("Введите длину радиуса r1 (см): ");
    scanf("%f",&r1);
    printf("Введите длину радиуса r2 (см): ");
    scanf("%f",&r2);
    printf("Введите длину радиуса r3 (см): ");
    scanf("%f",&r3);
    
    z = ((func(r1)+func(r2)+func(r3))/3);
    printf("z = %f\n", z);
    return 0;
}
