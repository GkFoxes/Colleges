#include <stdio.h>

int main(void)
{
    int d,e,f;
    char a[]="Milk";
    char b[]="Water";
    char c[]="Bread";
    float v,n,m,l,o,p;
    d=3;
    e=5;
    f=8;
    v=25.6;
    n=31.5;
    m=61.2;
    l=d*v;
    o=e*n;
    p=f*m;
    printf("!-----------------------------\n");
    printf("! N ! Name !  Qt  !  Price !\n");
    printf("!----------!------!--------!\n");
    printf("!   ! %s   !  %d      ! %1.2f  !\n", a,d,v);
    printf("!   !%s  !  %d      ! %1.2f  !\n",b,e,n);
    printf("!   !%s  !  %d      ! %1.2f  !\n",c,f,m);
    printf("!---------!---------!--------!\n");
    printf("! Total price %s: ! %1.2f  !\n",a,l);
    printf("! Total price %s:! %1.2f !\n",b,o);
    printf("! Total price %s:! %1.2f !\n",c,p);
    printf("!-----------------------------\n");
    return(0);
}