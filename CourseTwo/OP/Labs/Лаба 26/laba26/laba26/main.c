#include <stdio.h>
#define n 3
#define k 3

//Варианты заданий: имеется структура типа student с полями: ФИО, год рождения, год поступления, оценки за 1, 2, и 3 экзамен (предметы любые). Создать и ввести массив из структур типа student (размер массива произвольный) и выполнить задание согласно варианту:

//Распечатать анкетные данные студентов, успевающих на 4 и 5.

int main() {
    
    struct Students {
        char fio[50];
        int birthday;
        int yearOfReceipt;
        int gradesExam1[k], gradesExam2[k], gradesExam3[k];
        int score;
    } students[n];
    
    int g[n];
    int i = 0, j = 0;
    //int score1 = 0, score2 = 0, score3 = 0;
    
    for (i = 0; i < n; i++) {
        printf("Введите Ф.И.О %i студента\n", i+1);
        //fflush (stdin);
        gets(students[i].fio);
    }
    puts("Введите данные студентов");
    for (i = 0; i < n; i++) {
        students[i].score = 0;
        puts("Введите 3 оценки по 3 предметам (Математика, Английский, История)");
        //fflush (stdin);
        for (j = 0; j < k; j++) {
            printf("Студент %i, предмет %i\n", i+1, j+1);
            scanf ("%i %i %i", &students[i].gradesExam1[j], &students[i].gradesExam2[j], &students[i].gradesExam3[j]);
            
            if (students[i].gradesExam1[j] > 3 && students[i].gradesExam2[j] > 3 && students[i].gradesExam3[j] > 3) {
                students[i].score++;
            }
        }
    } // for для ввода данных
    for (i = 0; i < n; i++) {
        if (students[i].score > 2) {
            puts("Студенты полчившие 4 и 5\n");
            printf ("%s", students[i].fio);
        }
    }
}
