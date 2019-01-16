#include <stdio.h>
#define n 7
// Х(20)    Преобразовать массив таким образом, чтобы элементы,
//          равные нулю, располагались после всех остальных.

int main() {
    int m[n], i, k=0, buf=0;
    puts("Введите массив: ");
    for (i=0;i<n;i++) {
        scanf("%d", &m[i]);
        if (m[i]!=0) {
            buf=m[k];
            m[k]=m[i];
            m[i]=buf;
            k=k+1;
        }
    }
    for (i=0; i<n; i++) {
        printf("Элемент %d: %d\n", i+1, m[i]);
    }
    return 0;
}
