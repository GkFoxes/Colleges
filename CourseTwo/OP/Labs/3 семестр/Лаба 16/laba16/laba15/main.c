#include <stdio.h>
#define n 7
//Сумму элементов массива, расположенных между первым и последним нулевыми элементами.

int main() {
    int m[n], i, firstZero=0, secondZero=0, sum = 0;
    puts("Введите массив: ");
    for (i=0;i<n;i++) {
        scanf("%d", &m[i]);
    }
    for (i=0;i<n;i++) {
        if (m[i]==0) {
            firstZero=i;
            break;
        }
    }
    for (i=firstZero + 1;i<n;i++) {
        if (m[i]==0) {
            secondZero=i;
        }
    }
    for (i=firstZero; i<secondZero; i++) {
        sum=sum+m[i];
    }
    printf("Ответ: %d\n", sum);
    return 0;
}
