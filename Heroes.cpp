#include "stdafx.h"
#include <iostream>
#include <string>
#include <stdlib.h>
#include <time.h>
#include "NameG.h"
#include "Heroes.h"

using namespace std;

Heroes::Heroes()
	{
		this->name = NameG();
		this->Health_max = rand() % 100 + 1;
		this->Health = this->Health_max;
		this->Attack = rand() % 30;
		this->Level = rand() % 10 + 1;
		this->Uron = rand() % Health_max;

	}


	void Heroes::get()
	{
		cout << name << endl;
		cout << "Health_max: " << Health_max << endl;
		cout << "Uron: " << Uron << endl;
		cout << "Attack: " << Attack << endl;
		cout << "Level: " << Level << endl;
	}

	void Heroes::getName()
	{
		cout << this->name << endl;
	}

	void Heroes::takeDmg(int dmg, string n) {
		if (dmg < 0) dmg = 0;
		cout << this->name << " took " << dmg << " damage from " << n << endl;
		this->Health -= dmg;
		HPCheck();
	}

	void Heroes::dealDmg(Heroes* H){
		if (HPCheckB()) 
		{
			cout << this->name << " is attaking "; H->getName();
			H->takeDmg(this->Uron,this->name);
		}
	}

	void Heroes::HPCheck()
	{
		if (HPCheckB())
			cout << this->Health << "/" << this->Health_max << endl;
		else
		{
			cout << this->name << "is dead!" << endl;
			this->Health = 0;
		}
	}

	bool Heroes::HPCheckB()
	{
		if (this->Health > 0) return 1; else return 0;
	}

	//----------------------------------------------------------------------------------------------------
	
	SushestvoA1::SushestvoA1() : Heroes::Heroes()
	{
		this->Evasion = rand() % 25 + 1 ;
	}
	void SushestvoA1::get()
	{
		this->Heroes::get();
		cout << "Evasion: " << Evasion << endl;
	}

	void SushestvoA1::takeDmg(int dmg, string n) {
		if (rand() % 50 + 1 > this->Evasion) {
			if (dmg < 0) dmg = 0;
			cout << this->name << " took " << dmg << " damage from " << n << endl;
			this->Health -= dmg;
			HPCheck();
		}
		else
		{
			cout << this->name << " didn't take Damage from " << n << endl;
		}
	}

	//--------------------------------------------------------------------------------------------------------
	
	SushestvoA2::SushestvoA2() : Heroes::Heroes()
	{
		this->Assassinate = rand() % 25 + 1;
	}
	void SushestvoA2::get()
	{
		this->Heroes::get();
		cout << "Assassinate: " << this->Assassinate << endl;
	}
	void SushestvoA2::dealDmg(Heroes* H)
	{
		if (HPCheckB()) {
			if (rand() % 50 + 1 > this->Assassinate)
			{
				cout << this->name << " is attaking "; H->getName();
				H->takeDmg(this->Uron, this->name);
			}
			else
			{
				cout << this->name << " is attaking with Great Power "; H->getName();
				H->takeDmg(1000000, this->name);
			}
		}
	}

	//-------------------------------------------------------------------------------------------------------
	
	SushestvoB1::SushestvoB1() : Heroes::Heroes()
	{
		this->Assassinate = rand() % 25 + 1;
	}
	void SushestvoB1::get()
	{
		this->Heroes::get();
		cout << "Assassinate: " << this->Assassinate << endl;
	}
	void SushestvoB1::dealDmg(Heroes* H)
	{
		if (HPCheckB()) {
			if (rand() % 50 + 1 > this->Assassinate)
			{
				cout << this->name << " is attaking "; H->getName();
				H->takeDmg(this->Uron, this->name);
			}
			else
			{
				cout << this->name << " is attaking with Great Power "; H->getName();
				H->takeDmg(1000000, this->name);
			}
		}
	}

	//-----------------------------------------------------------------------------------------------------------

	SushestvoB2::SushestvoB2() : Heroes::Heroes()
	{
		this->Evasion = rand() % 25 + 1;
	}
	void SushestvoB2::get()
	{
		this->Heroes::get();
		cout << "Evasion: " << Evasion << endl;
	}

	void SushestvoB2::takeDmg(int dmg, string n) {
		if (rand() % 50 + 1 > this->Evasion) {
			if (dmg < 0) dmg = 0;
			cout << this->name << " took " << dmg << " damage from " << n << endl;
			this->Health -= dmg;
			HPCheck();
		}
		else
		{
			cout << this->name << " didn't take Damage from " << n << endl;
		}
	}