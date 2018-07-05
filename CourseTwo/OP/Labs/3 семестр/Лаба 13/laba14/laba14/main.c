#include <stdio.h>
#define n 7
//Сумму элементов массива, расположенных  до последнего положительного элемента.

int main() {
    int m[n], i, nmax=0, sum = 0;
    puts("Введите массив: ");
    for (i=0;i<n;i++) {
        scanf("%d", &m[i]);
        if (m[i]>=0) {
            nmax=i;
        }
    }
    for (i=0; i<nmax; i++) {
        sum=sum+m[i];
    }
    printf("Ответ: %d\n", sum);
    return 0;
}
