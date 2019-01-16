#include <stdio.h>

int main()
{
    int a, b;
    int a1, a2, a3, b1, b2, b3;
    int c,d;

    printf("Введите два действительных числа\n");
    printf("1: ");
    scanf ("%d", &a);
    printf("2: ");
    scanf ("%d", &b);

    printf("Введите кол-во сдвигов вправо (1) и влево (2)\n");
    printf("1: ");
    scanf ("%d", &c);
    printf("2: ");
    scanf ("%d", &d);

    a1= a>>c;
    a2= a<<d;
    a3= ~a;
    b1= b&a;
    b2= b|a;
    b3= b^a;

    printf("Сдвиг вправо (>>): %d\n", a1);
    printf("Сдвиг влево(<<): %d\n", a2);
    printf("Дополнение до 1: %d\n", a3);
    printf("Операция (&): %d\n", b1);
    printf("Операция (|): %d\n", b2);
    printf("Операция (^): %d\n", b3);
    return 0;
}

