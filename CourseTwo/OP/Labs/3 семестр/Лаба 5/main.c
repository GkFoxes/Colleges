#include <stdio.h>

int main()
{
    int k;
    unsigned int n;
    float e, c;
    double a;

    printf("NAPISHITE SBOU ZARPLATU: ");
    scanf ("%lf", &a);

    if (a>=20000.00 && a<60000.00) {
        n++;
    }
    else if (a>=60000.00) {
        n+=2;
    }
    else {
        n--;
    }

    k = a / 25;
    e = a * 0.07 / 12;
    c = a - (a*0.47);

    printf("VI MOZJETE:\n");
    printf("!----------------------------------------------!\n");
    printf("  KUPIT' %d BUHANOK HLEBA\n", k);
    printf("  POLUCHIT' ZA MESIAC PO VKLADU: %0.2f rub \n", e);
    printf("  ZARPLATA BEZ NALOGA: %0.2f\n", c);
    printf("!----------------------------------------------!\n");


    printf("VI ZIVETE LUCHSHE: ");
    if (n==1) {
        printf("65%% Rossiyan");
    }
    else if (n<0) {
        printf("54%% Rossiyan");
    }
    else {
        printf("81%% Rossiyan");
    }
    return 0;
}

