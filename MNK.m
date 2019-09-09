 %             Численные методы задание №4:
 %     Аппроксимация функции методом наименьших квадратов
 %              Ковалева Надежда группа 305
 
f = @(x) (x + 3).*cos(x) - 1;

a = -5;
b = 2;

m = 100;
n = 4;
X = linspace(a, b, m);
r = randn(1,m);
Y = f(X) + r;

% строим матрицу системы MA=F
M = zeros(n+1,n+1);
for i = 0:n
    for j = 0:n
        for k = 1:m
            M(i+1,j+1) = M(i+1,j+1) + (X(k))^(i+j);
        end
    end
end

% строим вектор F системы
F = zeros(n+1,1);
for i = 0:n
    for k = 1:m
        F(i+1) = F(i+1) + ((X(k))^i)*Y(k);
    end
end

%вычисляем коэффициенты полинома
A = M\F;

% строим сам полином
P = @(x) A(1);
for i = 1:n 
P = @(x) P(x) + A(i+1)*(x.^(i));
end

% строим графики
    hold on;
    grid on;
    axis([a,b,-4,3]);
% нарисуем точки, по которым строили апроксимирующий полином
for i = 1:m
    plot(X(i),Y(i),'r.');
end

    plot(X, P(X), 'LineWidth', 1.5,'Color',  'k');
    plot(X, f(X), 'LineWidth', 1,'Color',  'b');
    
% найдем максимальное отклонение     
R = @(x) abs(f(x) - P(x));     
mR = max(R(X)) 