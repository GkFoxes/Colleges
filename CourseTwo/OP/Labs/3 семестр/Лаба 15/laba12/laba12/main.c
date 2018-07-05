#include <stdio.h>
#define n 7
//Сжать массив, удалив из него все элементы меньше еденицы.
//Освободившиеся в конце массива элементы заполнить нулями

int main() {
    int mas[n], i, j, m = 0;
    puts("Введите массив: ");
    for (i = 0; i < n; i++) {
        scanf("%d", &mas[i]);
    }
    
    for (j = 0; j < n; j++) {
        if ((mas[j]) <= 1) {
            for (i = j; i < n - 1; i++) {
                mas[i] = mas[i + 1];
            }
            m++;
        }
    }
    puts("\n\n");
    for (i = n - 1; i > (n - 1) - m; i--) {
        mas[i] = 0;
    }
    for (i = 0; i < n; i++) {
        printf("%d ", mas[i]);
    }
    
    return 0;
}
