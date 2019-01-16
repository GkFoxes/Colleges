#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#define n 7
// Упорядочить элементы массива по возрастанию модулей.

int main() {
    int m[n], i, tmp;
    bool noSwap;
    puts("Введите массив: ");
    for (i=0;i<n;i++) {
        scanf("%d", &m[i]);
        if (m[i]<0){
            m[i] = abs (m[i]);
        }
    }
    
    for (int i = 7 - 1; i >= 0; i--) {
        noSwap = 1;
        for (int j = 0; j < i; j++) {
            if (m[j] > m[j + 1]) {
                tmp = m[j];
                m[j] = m[j + 1];
                m[j + 1] = tmp;
                noSwap = 0;
            }
        }
        if (noSwap == 1)
            break;
    }
    printf("Отсортированный массив:\n");
    for (int i = 0; i < 7; i++)
        printf("%d ", m[i]);
    printf("\n");
    return 0;
}
