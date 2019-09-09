// ConsoleApplication7.cpp: главный файл проекта.

#include "stdafx.h"
#include <iostream>
using namespace System;
using namespace std;

	int joseph(int n, int k) {
		return n>1 ? (joseph(n - 1, k) + k - 1) % n + 1 : 1;
	}

	int main()
	{
		setlocale(0, "");
		int n, v, del = 2;
		cout << "Число солдат: ";
		cin >> n;
		cout << "Номер выжившего: ";
		cin >> v;
		while (v != joseph(n, del))
			del++;
		cout<< "Умирает каждый: " << del << endl;
		system("pause");
		return 0;
	}

  