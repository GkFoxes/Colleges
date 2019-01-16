#include "pch.h"
#include <iostream>
#include <windows.h>

using namespace std;

int main() {
	setlocale(LC_ALL, "Russian");

	int width = GetSystemMetrics(SM_CXSCREEN);
	int height = GetSystemMetrics(SM_CYSCREEN);
	
	HDC dc = GetDC(NULL);
	int bitsPerPixel = GetDeviceCaps(dc, BITSPIXEL);

	cout << "Разрешение экрана: " << width << "/" << height << "\n";
	cout << "Глубина цвета: " << bitsPerPixel << "\n";
	cout << "\n";

	cout << "Размер кадра: " << "\n";
	cout << width * height * bitsPerPixel / 8 << " Байт" << "\n";
	cout << width * height * bitsPerPixel / 8 / 1024 << " KБайт" << "\n";
	cout << width * height * bitsPerPixel / 8 / 1024 / 1024 << " МБайт" << "\n";
}