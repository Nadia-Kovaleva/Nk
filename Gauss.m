function[I] = Gauss(a,b,par)
%function[I,A] = integral(a,b,h,eps)
% p = 0, значит вывод для определённого N
% p = 1, значит вывод для n = 1,2,...,N 
format longG
f = @(x) 3.7.*cos(1.5.*x).*exp(-4.*x./3) + 2.4.*sin(4.5.*x).*exp(2.*x./3) + 4;
a1 = 1.8; b1 = 2.3;
alfa = 0; betta = 3/5;
p = @(x) 1./(((x-a1).^alfa).*((b1-x).^betta));
F = @(x) f(x).*p(x);

N = 6;
if par == 0
    N1 = N;
else
    N1 = 1;
end

Moduli = zeros(1,N+1);
I = zeros(1,N+1);

for n = N1:N
    
% вспомогательная формула
S = @(k)(((b1-a).^(k+1-betta))-((b1-b).^(k+1-betta)))./(k+1-betta);
% находим вектор моментов мю
Mu = zeros(2*n+1,1);
Mu(1) = S(0);
for k = 1:2*n
    c = binomial_coeffs(k);
    for i = 0:k
        Mu(k+1) = Mu(k+1) + ((-1).^i)*(b1.^(k-i)).*c(i+1).*S(i);
    end
end

% находим коэффициенты узлового полинома
% матрица системы
M = zeros(n,n);
for i = 1:n
     M(i,:) = (Mu(i : i + n - 1));
end

% столбец коэффициентов a
a_ = [1, fliplr((M \ (-Mu(n + 1 : 2 * n)))')];
x = roots(a_);

X = fliplr(vander(x))';
A = X \ Mu(1 : n);

%сумма модулей Аk
 for i = 1:n
    Moduli(n) = Moduli(n) + abs(A(i));
 end

% вычисление интеграла 
for i = 1:n
    I(n) = I(n) + A(i)*f(x(i));
end

 end 

%hold on; 
% grid on; 
% axis square; 
% Z = linspace(0,N,N+1); 
% plot(Z, Moduli,'LineWidth',1.5,'Color',[0 0 1]); 
% plot(Z, I,'LineWidth',1.5,'Color',[1 0 1]); 


q = integral(F, a, b);
R = abs(I(n) - q);
I = I(n);

end