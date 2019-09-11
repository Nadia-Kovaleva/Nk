// Vadim.cpp: ������� ���� �������.

#include "stdafx.h"
#include <iostream>
#include <cstring>  
#include <stdio.h>

#define MAX 100000

using namespace System;
using namespace std;


int main()
{
	int i = 0, b = 0, c = 0, ss = 0, l = 0, fss = 0; //b-������� �������, i-������� ���������� ����, c-�������, l-����� ���������� �����
	bool is_negative = false;
	char num1[MAX];

	cout << "Enter number: ";
	fgets(num1, 1024, stdin);  //1.���� ��������, 2.���� ���-�� ��������, 3.��� �����(� ����������)
	l = strlen(num1) - 1;      //������� ���-�� ��������(-������)

	cout << "Enter number SS: ";
	cin >> ss;

	cout << "Enter number final SS: ";
	cin >> fss;

	if (num1[0] == '-')            //�������� ������������� �� �����
	{
		is_negative = true;
	}

	for (i = l - 1; i >= 0; i--)    //���.����; ���; ����������
	{
		if (is_negative && i == 0)
		{
			break;
		}

		int t;                                //t=���� �����
		//
		if (num1[i] >= 48 && num1[i] <= (ss - 1 + 48))
		{
			t = num1[i] - 48;
		}
		else if (num1[i] >= 65 && num1[i] <= (ss - 1 + 55))
		{
			t = num1[i] - 55;
		}
		else
		{
			cout << "Incorrect number." << endl;
			system("pause");
			return 0;
		}

		b = b + t * pow(ss, c);                 // (�����;�������)
		c++;
	}

	cout << "10 SS: " << b << endl;
	                                             //��������� ������� � 10
	int ch = b, j = 0;                           //ch-����������� �����, j-�������
	int num2[MAX];                               // ������ ��� ������������� �����

	do {
		num2[j++] = ch % fss;                    //%-������� � ���
		ch = ch / fss;
	} while (ch >= fss);

	if (ch == 0) {
		--j;
	}
	else {
		num2[j] = ch;
	}

	int k = 0, j2 = j;                                   //k-c������
	char num3[MAX];                                     //������ � ������� ����� �������� ��������
	for (int k = 0; k <= j; k++)
	{
		int t = num2[j2--];
		if (t >= 0 && t <= 9)
		{                                                 //��������� �������
			t = t + 48;
		}
		else if (t >= 10 && t <= 16)
		{
			t = t + 55;
		}
		else
		{
			cout << "Unknown Error. Incorrect symbol: " << t << " j: " << j << endl;
			system("pause");
			return 0;
		}

		num3[k] = t;                              //���������� ���������������  � ����� ����� � ����� ������
	}
	num3[j + 1] = '\0';

	if (is_negative == true)
	{
		cout << "-";
	}
	cout << "Final number: " << puts(num3);                                   //����� �a �����

	system("pause");
	return 0;

}




/*int down_first = -1, down_last = 0, down_first_max = 0, down_last_max = 0;  //

for (i = 0; i < MAX; i++)
{
	if (i == MAX - 1 && num[i] < num[i - 1])
	{
		down_last = i;
	}
	else if (i == 0 && num[i + 1] >= num[i])
	{
		down_first = i;
	}
	else if (num[i + 1] <= num[i] && num[i - 1] < num[i])
	{
		down_first = i;
	}
	else if (num[i] < num[i + 1] && up_first != -1)
	{
		down_last = i;
		if (down_last - up_first + 1 > down_last_max - down_first_max + 1)
		{
			down_last_max = down_last;
			down_first_max = down_first;
		}
		down_first = -1; down_last = 0;
	}
}
cout << "\n" << "��������� ������������� �� �������������: " << endl;
for (i = down_first_max; i <= down_last_max; i++)
{
	cout << num[i] << " ";
}
cout << endl;
*/

