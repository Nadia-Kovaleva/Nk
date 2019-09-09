#include "NameG.h"
#include "stdafx.h"
#include <string>
#include <vector>
#include <stdlib.h>
#include <time.h>
using namespace std;

int Random_Slogov()
{
	int R_ = 0;
	R_ = rand() % 4 + 3;
	return R_;
}

int Random_Glas()
{
	int R_G = 0;
	R_G = rand() % 5;
	return R_G;
}

int Random_Soglas()
{
	int R_S = 0;
	R_S = rand() % 14;
	return R_S;
}


string NameG()
{

	vector<char> vec_glas = { 'a','i','u','e','o' };
	vector<char> vec_sogl = { 'k', 's', 't', 'n', 'h', 'm', 'y', 'r', 'w', 'g', 'z', 'd', 'b', 'p' };

	string st = "";
	int k, l;

	for (int j = 0; j < Random_Slogov(); j++)
	{
		k = Random_Soglas();
		l = Random_Glas();
		st = st + vec_sogl[k];
		st = st + vec_glas[l];
	}
	st[0] = char(int(st[0]) - 32);
	return st;
}