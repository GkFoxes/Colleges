
#include <stdio.h>

int main()
{
    float a,b,c,d;
    printf("Rasstoyaniye do dachi = ");
    scanf ("%f", &a);
    printf("Potrebleniye benzina na 100km = ");
    scanf ("%f", &b);
    printf("Cena benzina = ");
    scanf ("%f", &c);
    d=((a*2)/b)*c;
    printf("Stoimost= %f", d);
    return 0;
}
