#include <stdio.h>

int main() {
    int n, k, b;
    float a=0;
    
    do {
    
    printf("Добро пожаловать в магазин электроники, выберите интересуещие вас товары.\n");
    printf("1) Смарфоны\n");
    printf("2) Планшеты\n");
    printf("3) Компьютеры и ноубуки\n");
    printf("4) Телевизоры\n");
    printf("Ваш выбор: ");
    scanf("%i", &n);
    
        switch (n) {
            case 1:
                printf("1) iPhone 29990р\n");
                printf("2) Samsung 19990р\n");
                printf("3) Xiaomi 13990р\n");
                printf("Ваш выбор: ");
                scanf("%i", &k);
                switch (k) {
                    case 1: a=a+29990; break;
                    case 2: a=a+19990; break;
                    case 3: a=a+13990; break;
                    default: a=a+0; break;
                }
                break;
            case 2:
                printf("1) iPad 39990р\n");
                printf("2) Samsung 27990р\n");
                printf("3) Xiaomi 18990р\n");
                printf("Ваш выбор: ");
                scanf("%i", &k);
                switch (k) {
                    case 1: a=a+39990; break;
                    case 2: a=a+27990; break;
                    case 3: a=a+18990; break;
                    default: a=a+0; break;
                }
                break;
            case 3:
                printf("1) Macbook 79990р\n");
                printf("2) Acer 58990р\n");
                printf("3) Asus 38990р\n");
                printf("Ваш выбор: ");
                scanf("%i", &k);
                switch (k) {
                    case 1: a=a+79990; break;
                    case 2: a=a+58990; break;
                    case 3: a=a+38990; break;
                    default: a=a+0; break;
                }
                break;
            case 4:
                printf("1) Sony 49990р\n");
                printf("2) Samsung 39990р\n");
                printf("3) LG 33990р\n");
                printf("Ваш выбор: ");
                scanf("%i", &k);
                switch (k) {
                    case 1: a=a+49990; break;
                    case 2: a=a+39990; break;
                    case 3: a=a+33990; break;
                    default: a=a+0; break;
                }
                break;
            default:
                printf("Вы не выбрали категорию от 1 до 4, введите заново\n");
                break;
        }
        printf("Выбрать еще один товар? 1 - Да, 2 - Нет\n");
        printf("Ваш выбор: ");
        scanf("%i", &b);
        if (b==2) {
            printf("Стоимость товаров: %5.2f\n", a);
        }
    } while (b==1);
    return 0;
}
