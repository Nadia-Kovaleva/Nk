%Data for mixer dynamics
c1 = 1; 
c2 = 2;
cz = 1.25;
Fz = 0.02;
S = 1;
k = 0.02;
Vz = S*(Fz/k)^2; %(1.31)

X_ini = [1.5 0.5].';

A = [1 1; c1 - cz c2 - cz];
b = [Fz;0];
uz = A\b;
F1z = uz(1);
F2z = uz(2);

a = 1; %with feedback
k1 = -10;
k2 = -10;