// ConsoleApplication2.cpp: главный файл проекта.
#include "stdafx.h"
#include <iostream>
using namespace std;

	bool isCorrectLetter(const char &letter) {    //проверка символов
		const int size = 7;
		char mySymbols[size] = { 'I', 'V', 'X', 'L', 'C', 'D', 'M' };
		for (int i = 0; i < size; ++i) {
			if (letter == mySymbols[i]) {
				return true;
			}
		}
		return false;
	}

	bool isCorrectSequence(const char &previous, const char &next, int &recurrence) {    	//првоерка последовательности
		if (next == previous && (previous == 'L' || previous == 'D' || previous == 'V')) {
			return false;
		}
		if (recurrence == 3 && (next == 'X' || next == 'C' || next == 'M' || next == 'I')) {
			return false;
		}
		if ((next == 'X' && previous == 'V') || (next == 'C' && previous == 'L') || (next == 'M' && previous == 'D')) {
			return false;
		}

		return true;
	}
	
	int getArabNumber(const char &rimNumber) {               //конвертация из римских в арабские
		switch (rimNumber) {
		case 'I': return 1;
		case 'V': return 5;
		case 'X': return 10;
		case 'L': return 50;
		case 'C': return 100;
		case 'D': return 500;
		case 'M': return 1000;
		}
		return 0;
	}
	
	int calculation(const char array[], const int &count) {     	//вычесление результата
		int res = 0;
		int prev = 0, next;
		for (int i = count; i >= 0; --i) {
			next = getArabNumber(array[i]);
			if (prev > next) {
				res = (res - prev) + (prev - next);
			}
			else {
				res += next;
			}
			prev = next;
		}
		return res;
	}

	int main() {
		setlocale(0, "");
		const int size = 256;
		char s[size], next, previous;
		int i, recurrence = 0;
		bool isCorrect = true;

		cout << "Введите римское число: ";
		for (i = 0; (next = cin.get()) != '\n'; ++i) {
			if (i == 0) {
				s[i] = next;
				previous = next;
			}
			else {
				if (previous == next)
					recurrence++;
				else
					recurrence = 0;
				if (isCorrectLetter(next) && isCorrectSequence(previous, next, recurrence)) {
					s[i] = next;
					previous = next;
				}
				else {
					isCorrect = false;
					break;
				}
			}
		}
		if (!isCorrect || (s[i - 3] == 'I' && s[i - 2] != 'I')) {
			cout << "Число не корректно. Проверьте правильность введённого числа. ";
		}
		else {
			cout << "Это число в десятичной СС: " << calculation(s, i - 1) << endl;
		}

		system("pause");
		return 0;
	}