#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#define n 7
// Плюсы и минусы. В массиве Z(m) найти число чередований знака, то есть число переходов  с
// минуса на плюс или с плюса на минус. Например, в последовательности
// 0 -2 0 -1 0 2 -1 0 0 3 2 -3 четыре чередования (как известно, нуль не имеет знака).

int main() {
    int m[n], i, buf;
    puts("Введите массив:");
    for (i=0;i<n;i++) {
        scanf("%d", &m[i]);
    }
    
    for (i=1;i<n;i++) {
        if (i%2==0) {
            buf=m[i];
            m[i]=m[i-1];
            m[i-1]=buf;
        }
    }
    
    for (int i = 0; i < 7; i++)
        printf("%d ", m[i]);
    printf("\n");
    return 0;
}

