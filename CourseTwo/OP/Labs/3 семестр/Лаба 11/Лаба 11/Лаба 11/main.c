#include <stdio.h>
#include <math.h>

int main() {
//        int i,n;
//        for (i=1; i<10; i++) {
//            for (n=1; n<10; n++)
//                printf("%4d", i*n);
//            printf("\n");
//        }
    int a,sum=0,b=0, n;
    printf("Введите число: ");
    scanf("%d", &a);
    n=a;
    while (a!=0) {
        b=a%10;
        sum=sum+b;
        a=a/10;
    }
    if (sum==10) {
        printf("Сумма чисел (%d) = 10\n", n);
    }
    else
        printf("Сумма чисел (%d) не = 10\n", n);
}
