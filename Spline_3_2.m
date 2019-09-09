 %%%%%  Численные методы задание №3: Интерполирование функции с помощью  сплайнов
                %%%%%  Ковалева Надежда группа 305
                
N = [3 5 8 10];
F = @(x) (x + 3).*cos(x) - 1;

a = -5;
b = 2;
table = zeros(length(N),3);
m = 100;

for i = 1 : length(N)
    
    table(i,1) = N(i);
    table(i,2) = m;
    
    G(i) = figure('NumberTitle', 'off', 'Name', ['Сплайн 3,2 по ',num2str(N(i)), ' точкам']);
    hold on;
    grid on;
    
    n = N(i);
    X = linspace(a, b, n);
    Y = F(X);
    
    %максимальное отклонение
    mR = 0;
    %хотим решить систему Ну=гамма
    %шаг
    h = X(2) - X(1);
    %строим матрицу, сначала заполняем главную диагональ
    H = 4 * h * eye(n - 2);
    
    %заполняем диагонали под и над главной диагональю
    for j = 1 : n - 2
        if j > 1
            H(j, j - 1) = h;
        end
        if j < n - 2
            H(j, j + 1) = h;
        end
    end
    
    gamma = zeros(n - 2, 1);
    
    for j = 2 : n - 1
        gamma(j - 1) = 6 * (Y(j + 1) - 2 * Y(j) + Y(j - 1)) / h;
    end
    
    Y2 = [0; H \ gamma; 0;];
    
    Y1 = zeros(n - 1, 1);
    for j = 1 : n - 1
        Y1(j) = (Y(j + 1) - Y(j)) / h - Y2(j + 1) * h / 6 - Y2(j) * h / 3;
    end
    
    for j = 1 : n - 1
        
        Spline = @(x) Y(j) + Y1(j) * (x - X(j)) + Y2(j) * (x - X(j)).^2 / 2 +...
            (Y2(j + 1) - Y2(j)) * (x - X(j)).^3 / (6 * h);
        
        %проверочные точки
        z = linspace(X(j), X(j + 1), m);    

        plot(z, Spline(z), 'LineWidth', 1.5,'Color',  'k');
        plot(z, F(z), 'LineWidth', 1,'Color',  'b');
        
        %отклонение
        R = @(x) abs(F(x) - Spline(x));     
        mR = max(R(z)); 
        
        table(i,3) = mR;
    end
    
    plot(X, Y, 'ro');
end
disp(table);