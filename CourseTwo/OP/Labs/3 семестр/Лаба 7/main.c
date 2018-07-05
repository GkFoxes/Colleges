#include <stdio.h>
#include <math.h>

int main()
{
    int n;
    float x, y;

    printf("Введите X: ");
    scanf ("%f", &x);
    printf("Введите Y: ");
    scanf ("%f", &y);

    if (x > 0 && y > 0) {
        printf("Точка лежит в I четверти");
    }
    else if (x < 0 && y > 0) {
        printf("Точка лежит во II четверти");
    }
    else if (x < 0 && y < 0) {
        printf("Точка лежит в III четверти");
    }
    else if (x > 0 && y < 0) {
        printf("Точка лежит в IV четверти");
    }
    else if (x==0 && y!=0) {
        printf(" Точка лежит на 0y");
    }
    else if (y==0 && x!=0) {
        printf("Точка лежит на 0x");
    }
    else  {
        printf("Точка лежит в центре");
    }
    return 0;
}

