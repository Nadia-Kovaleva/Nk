// ConsoleApplication7.cpp: ������� ���� �������.

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
		cout << "����� ������: ";
		cin >> n;
		cout << "����� ���������: ";
		cin >> v;
		while (v != joseph(n, del))
			del++;
		cout<< "������� ������: " << del << endl;
		system("pause");
		return 0;
	}

  