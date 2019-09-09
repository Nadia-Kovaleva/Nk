 %%%%%  Численные методы задание №3: Интерполирование функции с помощью  сплайнов
                %%%%%  Ковалева Надежда группа 305
                
N = [3 5 8 10 20];
F = @(x) (x + 3).*cos(x) - 1;

a = -5;
b = 2;
table = zeros(length(N),3);
m = 100;

for i = 1 : length(N)
    
    table(i,1) = N(i);
    table(i,2) = m;
    
    G(i) = figure('NumberTitle', 'off', 'Name', ['Сплайн 1,0 по ',num2str(N(i)), ' точкам']);
    hold on;
    grid on;
    
    n = N(i);
    X = linspace(a, b, n);
    Y = F(X);
    
    mR = 0;
    
    for j = 1 : n - 1
        
        P = [    X(j) 1; 
             X(j + 1) 1;];
         
        Q = [    Y(j);
             Y(j + 1);];
         
        A = P \ Q;
        
        Spline = @(x) A(1) * x + A(2);
        
        z = linspace(X(j), X(j + 1), m);    %проверочные точки

        plot(z, Spline(z), 'LineWidth', 1.5,'Color',  'k');
        plot(z, F(z), 'LineWidth', 1,'Color',  'b');
        
        R = @(x) abs(F(x) - Spline(x));     %отклонение
        mR = max(R(z));  %максимальное отклонение
        table(i,3) = mR;
    end

    plot(X, Y, 'ro');
end

disp(table);
