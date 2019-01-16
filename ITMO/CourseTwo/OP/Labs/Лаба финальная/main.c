//
//  main.c
//  labaFinal
//
//  Created by ������� ��������� on 31.05.2018.
//  Copyright � 2018 ������� ���������. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <locale.h>
#define n 10

void make(void);        //�������� �������
void view(void);        //�������� �������
int passw(void);        //������ ������
void edit(void);        //���� ��������������
void rem(void);         //��������� �������
void del(void);         //�������� �������
void sortStar(void);    //���������� �� �������
void sortset(void);     //���� ����������
void sortPrice(void);   //���� ���������� ����

struct str {
    char country[20];
    int star;
    int day;
    float price;
    char target[50];
}holidays[n];

struct b {
    char country[20];
    int star;
    int day;
    float price;
    char target[50];
}buf[n];

FILE *fl;

int main() {
    setlocale(LC_ALL, "Rus");
    int a=0,b;

    do{
        a=0;
        printf("1. ��������� ������\n2. �������� ������\n3. �����\n");
        fflush(stdin);
        scanf("%d",&b);
        switch(b) {
            case 1: edit();break;
            case 2: view();break;
            case 3:break;
            default:printf("Error\n");break;
        }
        printf("\n\t�����?\n\t1. ��\n\t2. ���\n");
        fflush(stdin);
        scanf("%d",&b);
        switch(b) {
            case 1:  break;
            case 2: a=1;system("cls"); break;
            default: printf("������ �����\n"); break;
        }

    }while(a==1);
    return 0;
}

void view (void) {

    setlocale(LC_ALL, "Rus");
    int i;
    FILE *fl;
    fl = fopen("d.txt", "r");
    if (fl != NULL) {
        fread(holidays, sizeof(holidays), 1, fl);
        fclose(fl);
        printf("�  %-18s  %-7s %-7s %-17s %-20s\n", "������", "����", "������", "������������", "���� ������");
        puts("_____________________________________________________________________________");
        for(i=0;i<n;i++){
            if((holidays[i].price!=0)&&(holidays[i].star!=0)&&(holidays[i].day!=0)) {
                printf("%-5d %-15s %-10.2f %-7.1d %-15.2d %-20s\n",i+1,holidays[i].country, holidays[i].price, holidays[i].star, holidays[i].day, holidays[i].target);
            }
        }
        puts("_____________________________________________________________________________");
    }
    else {
        puts("Error of reading file");
        fclose(fl);
    }
}


void make(void) { //���� ������� ��������
    setlocale(LC_ALL, "Rus");
    int a = 1,b=0;
    int i = 0;
    while (a==1) {
        if(i==n){
            puts("����� ��� ������ ������ ���");
            break;
        }
        puts("�������� ������ ����\n������� �������� ������:");
        fflush(stdin);
        gets(holidays[i].country);

        puts("������� ����:");
        fflush(stdin);
        scanf("%f", &holidays[i].price);

        puts("������� ���������� ����(1-5):");
        fflush(stdin);
        scanf("%d", &holidays[i].star);
        if((holidays[i].star<1)||(holidays[i].star>5)) {
            printf("ERROR");
            break;
        }

        puts("������� ���������� ���� � ����:");
        fflush(stdin);
        scanf("%d", &holidays[i].day);

        puts("�������� ���� ������:\n1.��������� ������\n2.�����\n3.������� � ��������\n4.������������\n5.������");
        fflush(stdin);
        scanf("%d", &b);
        switch(b)
        {   case 1:strcpy(holidays[i].target,"Visiting museums");break;
            case 2:strcpy(holidays[i].target,"Recreation");break;
            case 3:strcpy(holidays[i].target,"Traveling with friends");break;
            case 4:strcpy(holidays[i].target,"Business trip");break;
            case 5:strcpy(holidays[i].target,"Other");break;
            default:printf("ERROR");break;
        }
        i++;
        puts("���������� ������? 1 - ��, 2 - ���\n");
        scanf("%d", &a);
        if(a==1)system("cls");
    }
    FILE *fl;
    fl = fopen("d.txt", "w");
    fwrite(&holidays, sizeof(holidays), 1, fl);
    fclose(fl);
    i = 0;
}

int passw(void) {
    setlocale(LC_ALL, "Rus");

    int s=0;
    int b=4444;
    puts("������� ������ �� 4 ����");
    scanf("%d",&s);
    if(s==b)return 0;
    else {
        puts("������ ����� ������");
        return 1;
    }
}

void edit(void) {
    int a;
    setlocale(LC_ALL, "Rus");
    if(passw()==0) {
        printf("1. ��������\n2. ���������\n3. ��������\n4. �������� ����������\n5. �����\n");
        fflush(stdin);
        scanf("%d",&a);
        switch(a) {
            case 1:make();break;
            case 2:rem();break;
            case 3:del();break;
            case 4:sortset();break;
            case 5:break;
            default:puts("ERROR");
        }
    }
}

void rem(void) {
 setlocale(LC_ALL, "Rus");
    int i,g=1,b=0;
    int a=1;
    FILE *fl;
    fl = fopen("d.txt", "r");
    if (fl != NULL) {
        fread(holidays, sizeof(holidays), 1, fl);
        fclose(fl);
        printf("�  %-18s  %-7s %-7s %-17s %-20s\n", "������", "����", "������", "������������", "���� ������");
        puts("_____________________________________________________________________________");
        for(i=0;i<n;i++){
            if((holidays[i].price!=0)&&(holidays[i].star!=0)&&(holidays[i].day!=0)) {
                printf("%-5d %-15s %-10.2f %-7.1d %-15.2d %-20s\n",i+1,holidays[i].country, holidays[i].price, holidays[i].star, holidays[i].day, holidays[i].target);
            }
        }
        puts("_____________________________________________________________________________");
    }
    else {
        puts("ERROR READING");
        fclose(fl);
    }

    while(g==1) {
        puts("����� ����� ��������?");
        fflush(stdin);
        scanf("%d",&a);

        puts("�������� ������ ����\n������� �������� ������");
        fflush(stdin);
        gets(holidays[a-1].country);
        //scanf("%s", &holidays[a-1].country);

        puts("������� ����:");
        fflush(stdin);
        scanf("%f", &holidays[a-1].price);

        puts("������� ���������� ����(1-5):");
        fflush(stdin);
        scanf("%d", &holidays[a-1].star);
        if((holidays[a-1].star<1)||(holidays[a-1].star>5)) {
            printf("ERROR");
            break;
        }

        puts("������� ���������� ���� � ����:");
        fflush(stdin);
        scanf("%d", &holidays[a-1].day);

        puts("�������� ���� ������:\n1.��������� ������\n2.�����\n3.������� � ��������\n4.������������\n5.������� � ������\n6.������\n");
        fflush(stdin);
        scanf("%d",&b);
        switch(b)
        {   case 1:strcpy(holidays[a-1].target,"Visiting museums");break;
            case 2:strcpy(holidays[a-1].target,"Recreation");break;
            case 3:strcpy(holidays[a-1].target,"Traveling with friends");break;
            case 4:strcpy(holidays[a-1].target,"Business trip");break;
            case 5:strcpy(holidays[a-1].target,"Traveling with family");break;
            case 6:strcpy(holidays[a-1].target,"Other");break;
            default:printf("ERROR");break;
        }

        puts("���������� ������? 1 - ��, 2 - ���\n");
        scanf("%d",&g);
    }
    fl = fopen("d.txt", "w");
    fwrite(&holidays, sizeof(holidays), 1, fl);
    fclose(fl);
}

void del(void) {
    int b=0;
    int i,a=0;
    setlocale(LC_ALL, "Rus");

    FILE *fl;
    fl = fopen("d.txt", "r");
    if (fl != NULL) {
        fread(holidays, sizeof(holidays), 1, fl);
        fclose(fl);
        printf("�  %-18s  %-7s %-7s %-17s %-20s\n", "������", "����", "������", "������������", "���� ������");
        puts("_____________________________________________________________________________");
        for(i=0;i<n;i++){
            if((holidays[i].price!=0)&&(holidays[i].star!=0)&&(holidays[i].day!=0)) {
                printf("%-5d %-15s %-10.2f %-7.1d %-15.2d %-20s\n",i+1,holidays[i].country, holidays[i].price, holidays[i].star, holidays[i].day, holidays[i].target);
            }
        }
        puts("_____________________________________________________________________________");
    }
    else {
        puts("Error of reading file");
        fclose(fl);
    }
    puts("������� ����� ���������� ������");
    scanf("%d",&b);
    a=b-1;
    if(b==n-1) //1 b=n-1
    {   strcpy(holidays[a].country,"");
        strcpy(holidays[a].target,"");
        holidays[a].price=0;
        holidays[a].day=0;
        holidays[a].star=0;
    }

    for(a=0;a<n;a++){ //2 a=0
        strcpy(holidays[a].country,holidays[a+1].country);
        strcpy(holidays[a].target,holidays[a+1].target);
        holidays[a].price=holidays[a+1].price;
        holidays[a].day=holidays[a+1].day;
        holidays[a].star=holidays[a+1].star;
    }

    fl = fopen("d.txt", "w");
    fwrite(&holidays, sizeof(holidays), 1, fl);
    fclose(fl);
    puts("������� ������");
}

void sortset(void)
{   int a;
    puts("�������� ����� ����������:\n1. ���������� �� ���������� �����\n2. ���������� �� ����\n3. �����\n");
    scanf("%d",&a);
    switch(a)
    {
        case 1:sortStar();break;
        case 2:sortPrice();break;
        case 3:break;
        default:puts("ERROR");
    }
}

void sortStar(void)
{int i,a;
    FILE *fl;
    fl = fopen("d.txt", "r");
    if (fl != NULL) {
        fread(holidays, sizeof(holidays), 1, fl);
        fclose(fl);

    }
    else {
        puts("ERROR READING");
        fclose(fl);
    }
    for(a=0;a<n;a++){
        for(i=0; i<n-1;i++){
            if(holidays[i].star<holidays[i+1].star){

                strcpy(buf[i].country,holidays[i].country);
                strcpy(buf[i].target,holidays[i].target);
                buf[i].price=holidays[i].price;
                buf[i].day=holidays[i].day;
                buf[i].star=holidays[i].star;

                strcpy(holidays[i].country,holidays[i+1].country);
                strcpy(holidays[i].target,holidays[i+1].target);
                holidays[i].price=holidays[i+1].price;
                holidays[i].day=holidays[i+1].day;
                holidays[i].star=holidays[i+1].star;

                strcpy(holidays[i+1].country,buf[i].country);
                strcpy(holidays[i+1].target,buf[i].target);
                holidays[i+1].price=buf[i].price;
                holidays[i+1].day=buf[i].day;
                holidays[i+1].star=buf[i].star;
            }

        }
    }
    fl = fopen("d.txt", "w");
    fwrite(&holidays, sizeof(holidays), 1, fl);
    fclose(fl);
    puts("��������� ���������� ���������");
}
void sortPrice(void)
{int i,a;
    FILE *fl;
    fl = fopen("d.txt", "r");
    if (fl != NULL) {
        fread(holidays, sizeof(holidays), 1, fl);
        fclose(fl);

    }
    else {
        puts("ERROR READING");
        fclose(fl);
    }
    for(a=0;a<n;a++){
        for(i=0; i<n-1;i++){
            if(holidays[i].price>holidays[i+1].price){

                strcpy(buf[
                       i].country,holidays[i].country);
                strcpy(buf[i].target,holidays[i].target);
                buf[i].price=holidays[i].price;
                buf[i].day=holidays[i].day;
                buf[i].star=holidays[i].star;

                strcpy(holidays[i].country,holidays[i+1].country);
                strcpy(holidays[i].target,holidays[i+1].target);
                holidays[i].price=holidays[i+1].price;
                holidays[i].day=holidays[i+1].day;
                holidays[i].star=holidays[i+1].star;

                strcpy(holidays[i+1].country,buf[i].country);
                strcpy(holidays[i+1].target,buf[i].target);
                holidays[i+1].price=buf[i].price;
                holidays[i+1].day=buf[i].day;
                holidays[i+1].star=buf[i].star;
            }

        }
    }
    fl = fopen("d.txt", "w");
    fwrite(&holidays, sizeof(holidays), 1, fl);
    fclose(fl);
    puts("��������� ���������� ���������");
}

