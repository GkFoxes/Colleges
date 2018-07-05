//
//  main.c
//  Строки
//
//  Created by Дмитрий Матвеенко on 27.03.18.
//  Copyright © 2018 GkFoxes. All rights reserved.
//

// Разбивает фамилии по алфавиту!

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define W 100
#define H 100

int main() {
    
    int i = 0, j = 0;
    int fxs = 0;

    char * surnames[] = {"Матвеенко","Авсянкин","Аброгимович","Навальный","Явлинская","Путин", "Иванов"};
    int size = sizeof(surnames) / sizeof(char *);
    char *txs;

    for (i = 1; i < size; i++) {
        for (j = 0; j < size - i; j++) {

            fxs = strcmp(surnames[j+1], surnames[j]);

            if (fxs < 0) {
                txs = surnames[j];
                surnames[j] = surnames[j+1];
                surnames[j+1] = txs;
            }
        }
    }

    printf("Столбик фамилий по алфавиту:\n");
    for (i= 0; i < size; i++) {
        printf("%s\n",surnames[i]);
    }
    return 0;
}

//Разбиваем строку strtok, надо написать теперь свою такую прогу

//#include <stdio.h>
//#include <string.h>
//
//char *func(char *p, char x) {
//    static char *s = NULL;
//
//    if (p == NULL) {
//        if (s == NULL) {
//            return NULL;
//        }
//        p = s + 1;
//    }
//
//    s = strchr(p, x);
//
//    if (s!=NULL) {
//        *s = '\0';
//    }
//
//    return p;
//}
//
//int main() {
//    char p[100], *q;
//
//    strcpy(p, "слово1 слово2 слово3 слово4");
//
//    printf ("result:\n");
//
//    q = func(p, ' ');
//
//    while(q!=NULL) {
//        printf("%s\n", q);
//        q = func(NULL, ' ');
//    }
//}



// Разбивает с помощью strtok (Для примера)

//int main () {
//
//    char str [100] = "слово1 слово2 слово3 слово4";
//    char sep [10] = " ";
//    char *istr;
////
////    printf ("%s\n", str);
////    printf ("result:\n");
////
////    istr = strtok (str,sep);
////
////
////    while (istr != NULL) {
////
////        printf ("%s\n",istr);
////        istr = strtok (NULL,sep);
////    }
////
//    return 0;
//
//}

