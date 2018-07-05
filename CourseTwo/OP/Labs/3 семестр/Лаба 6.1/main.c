#include <stdio.h>

int main()
{
    int a, b;
    int c, d, e, f;

    printf("Введите  действительное число\n");
    printf("1: ");
    scanf ("%d", &a);
    b=a;

    printf("Введите кол-во показанных значений умножения (1) и деления (2)\n");
    printf("1: ");
    scanf ("%d", &c);
    printf("2: ");
    scanf ("%d", &e);

    printf("\n");
    for (d=0; d<c; d++) {
        a= a*2;
        printf("%d\n", a);
    }
    printf("\n");
    for (f=0; f<e; f++) {
        b= b/2;
        printf("%d\n", b);
        if (b==0) break;

    }
    return 0;
}

