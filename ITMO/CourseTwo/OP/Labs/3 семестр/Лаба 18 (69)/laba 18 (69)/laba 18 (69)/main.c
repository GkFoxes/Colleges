#include <stdio.h>
#define n 7
// В Массиве  Z(2n) каждый элемент с четным индексом поменять местами с предыдущим, то есть получить последовательность чисел z2, z1, z4, z3, ..., z2n, z2n-1

int main() {
    int m[n], i, buf;
    puts("Введите массив: ");
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
