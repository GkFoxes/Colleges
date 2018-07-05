#include <stdio.h>
#define n 7
//B(K)    Определить максимальный элемент массива B, удовлетворяющий условию, и его номер    Xi<0, K≤40

int main() {
    int m[n], i, max=-1001;
    puts("Введите массив: ");
    for (i=0;i<n;i++) {
        scanf("%d", &m[i]);
        if (m[i]>=0){
            m[i]=-1000;
        }
        if (m[i]>max) {
            max=m[i];
        }
    }
    printf("Ответ: %d\n", max);
    return 0;
}
