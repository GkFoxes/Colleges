#include "pch.h"
#include <iostream>
#include <windows.h>
#include <stdio.h>
#include <locale.h>

// Используется для перевода байтов в килобайты
#define DIV 1024
// Ширина поля для вывода чисел (Звездочка в спецификаторе формата "% * I64d" принимает целое число)
#define WIDTH 8

int main() {

	setlocale(LC_ALL, "Russian");

	MEMORYSTATUSEX statex;

	statex.dwLength = sizeof(statex);

	GlobalMemoryStatusEx(&statex);

	printf("Используется %*ld %% памяти.\n", WIDTH, statex.dwMemoryLoad);
	printf("\n");
	printf("Всего        %*I64d KB физической памяти.\n", WIDTH, statex.ullTotalPhys / DIV);
	printf("Занято       %*I64d KB физической памяти.\n", WIDTH, statex.ullTotalPhys / DIV - statex.ullAvailPhys / DIV);
	printf("Свободно     %*I64d KB физической памяти.\n", WIDTH, statex.ullAvailPhys / DIV);
	printf("\n");
	printf("Всего        %*I64d KB в файле подкачки.\n", WIDTH, statex.ullTotalPageFile / DIV);
	printf("Занято       %*I64d KB в файле подкачки.\n", WIDTH, statex.ullTotalPageFile / DIV - statex.ullAvailPageFile / DIV);
	printf("Свободно     %*I64d KB в файле подкачки.\n", WIDTH, statex.ullAvailPageFile / DIV);
	printf("\n");
	printf("Всего        %*I64d KB виртуальной памяти.\n", WIDTH, statex.ullTotalVirtual / DIV);
	printf("Занято       %*I64d KB виртуальной памяти.\n", WIDTH, statex.ullTotalVirtual / DIV - statex.ullAvailVirtual / DIV);
	printf("Свободно     %*I64d KB виртуальной памяти.\n", WIDTH, statex.ullAvailVirtual / DIV);
	printf("\n");
	// Показать количество доступной расширенной памяти.
	printf("Свободно     %*I64d KB расширенной памяти.\n", WIDTH, statex.ullAvailExtendedVirtual / DIV);
}