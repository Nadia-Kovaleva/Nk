format longG
f = @(x) 3.7.*cos(1.5.*x).*exp(-4.*x./3) + 2.4.*sin(4.5.*x).*exp(2.*x./3) + 4;
a = 1.8; b = 2.3;
alfa = 0; betta = 3/5;
p = @(x) 1./(((x-a).^alfa).*((b-x).^betta));
F = @(x) f(x).*p(x);
N = 20;
Moduli = zeros(1,N+1);
I = zeros(1,N+1);

for n = 2:N+1

h = (b-a)/n;

x = zeros(1,n);
for i = 1:n
   x(i) = a+h.*(i-1/2);
end
%x = linspace(a, b, n);

% вспомогательная формула
S = @(k)((1/2).^(k+2/5))./(k+2/5);
% находим вектор моментов мю
M = zeros(n+1,1);
M(1) = S(0);
for k = 1:n
    c = binomial_coeffs(k);
    for i = 0:k
        M(k+1) = M(k+1) + ((-1).^i)*(b.^(k-i)).*c(i+1).*S(i);
    end
end

% находим коэффициенты квадратурной формулы
% матрица системы
X = zeros(n,n);
for i = 1:n
    for j = 1:n
        X(i,j) = (x(j))^(i-1);
    end
end
% столбец коэффициентов
A =X\M(1:n);

%сумма модулей Аk
 for i = 1:n
    Moduli(n) = Moduli(n) + abs(A(i));
 end

% вычисление интеграла 
for i = 1:n
    I(n) = I(n) + A(i)*f(x(i));
end

 

 end 

hold on; 
grid on; 
axis square; 
Z = linspace(0,N,N+1); 
plot(Z, Moduli,'LineWidth',1.5,'Color',[0 0 1]); 
plot(Z, I,'LineWidth',1.5,'Color',[1 0 1]); 


q = integral(F, a, b);
R = abs(I(n) - q);