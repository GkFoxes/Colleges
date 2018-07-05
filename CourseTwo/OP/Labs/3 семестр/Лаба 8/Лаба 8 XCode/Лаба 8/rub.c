#include <stdio.h>

int main() {
    int n=0, k=0;
    float a,b,c=0;
    
    do {
        printf("Введите первое число: ");
        scanf("%f", &a);
        printf("Введите второе число: ");
        scanf("%f", &b);
        printf("Введите действие цифрой\n");
        printf("1 - (+), 2 - (-), 3 - (*), 4 - (/)\n");
        printf("Действие: ");
        scanf("%d", &n);
        
        switch (n) {
            case 1:
                c=a+b;
                break;
            case 2:
                c=a-b;
                break;
            case 3:
                c=a*b;
                break;
            case 4:
                c=a/b;
                break;
            default:
                printf("Неправильное значение действия\n");
                
        }
        printf("Ответ: %f\n", c);
        printf("Повторить? 1 - Да, 2 - Нет \n");
        printf("Выбор: ");
        scanf("%d", &k);
    } while (k!=2);
    
    return 0;
}

