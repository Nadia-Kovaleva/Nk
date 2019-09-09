// ConsoleApplication10.cpp: главный файл проекта.

#include "stdafx.h"
#include <iostream>
#include <string>
#include <stdlib.h>
#include <time.h>
#include "NameG.h"
#include "Heroes.h"


using namespace std;

int main()
{
	srand(time(NULL));
	Heroes  s;
	
	setlocale(0, " ");
	//s.get();
	//cout << endl;

	cout << " Team A: " << endl;

	SushestvoA1  sA1;
	sA1.get();
	cout << endl;

	SushestvoA2  sA2;
	sA2.get();
	cout << endl;

	cout << " Team B: " << endl;

	SushestvoB1  sB1;
	sB1.get();
	cout << endl;

	SushestvoB2  sB2;
	sB2.get();
	cout << endl;

	while (sA1.HPCheckB()*sB1.HPCheckB())
	{
		sA1.dealDmg(&sB1);
		sB1.dealDmg(&sA1);
	}

	while (sA2.HPCheckB()*sB2.HPCheckB())
	{
		sA2.dealDmg(&sB2);
		sB2.dealDmg(&sA2);
	}
	while (sA1.HPCheckB()*sB2.HPCheckB())
	{
		sA1.dealDmg(&sB2);
		sB2.dealDmg(&sA1);
	}

	while (sA2.HPCheckB()*sB1.HPCheckB())
	{
		sA2.dealDmg(&sB1);
		sB1.dealDmg(&sA2);
	}

	if (sA1.HPCheckB()*sA2.HPCheckB()) {
		cout << " Team A win!!! " << endl;
	}
	else if (sB1.HPCheckB()*sB2.HPCheckB()) {
		cout << " Team B win!!! " << endl;
	}

	system("pause");
    return 0;
}
