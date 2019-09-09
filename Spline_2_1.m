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
    
   G(i) = figure('NumberTitle', 'off', 'Name', ['Сплайн 2,1 по ',num2str(N(i)), ' точкам']);
    hold on;
    grid on;
    
    n = N(i);
    X = linspace(a, b, n);
    Y = F(X);
    
    mR = 0;    %максимальное отклонение


    a_12 = 0;
    a_11 =  cos(a) - (3 + a).*sin(a) ;
    
    for j = 1 : n - 1
        

        P = [    X(j)^2      X(j)  1;
             X(j + 1)^2  X(j + 1)  1;
             2 * X(j)         1  0;];
           
        Q = [    Y(j);
             Y(j + 1);
            2 * X(j) * a_12 + a_11;];
        
        A = P \ Q;
        
        a_12 = A(1);
        a_11 = A(2);
          
        Spline = @(x) A(1) * x.^2 + A(2) * x + A(3) ;
        
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