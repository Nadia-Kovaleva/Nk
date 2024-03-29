        %%%% �������� �������, ������ 305 %%%%       
    %%%% ������� �5. ���������������� ������� %%%%
format longG;
                        % ������� ��������
 
f = @(x)(x + 3).*cos(x) - 1;
% ������������ ������� ��������
N = 25;
% ���������� ����������� ����� 
m = 200;
a=-5; b=2;
% ������ ����������� ����� 
Y = linspace(a,b,m);

% ���������� �������
hold on; 
grid on; 
axis([a,b,-4,3]);
plot(Y,f(Y),'Color','r', 'LineWidth', 1);

%�������
table = zeros(1,4);

for n = 5:5:N            % �������� ����� ������� ������� ����� �������
    R = zeros(1,2);      % ������ ������������ ����������� ��� ���� �������
    
    % ����� ������������ ���� ���������������� 
    X1 = linspace(a,b,n+1);

    % ������� �������� �� ������������ ����� 
    L1 = @(t)0;
    for i = 1:n+1
        L1 = @(t)(L1(t) + multipliers(t,i,X1)./multipliers(X1(i),i,X1).*f(X1(i)));
    end

    % ����� ����������� ���� ���������������� 
    X2 = zeros(1,n+1);
    for i = 0:n
        X2(n+1-i) = 1/2*((b-a)*cos(pi*(2*i+1)/(2*n+2))+a+b);
    end

    % ������� �������� �� ����������� ����� 
    L2 = @(x)0;
    for i = 1:n+1
        L2 = @(x)(L2(x) + multipliers(x,i,X2)./multipliers(X2(i),i,X2).*f(X2(i)));
    end
    
    % ������������ ����������� ��� ������������ �����
    R1 = @(x)abs(f(x) - L1(x));

    % ������������ ���������� �� ������������ ����� 
    for i = 1:m
        if R(1) < R1(Y(i))
            R(1) = R1(Y(i));
        end
    end

    % ������������ ����������� ��� ����������� �����
    R2 = @(x)abs(f(x) - L2(x));

    % ������������ ���������� �� ����������� �����
    for i = 1:m
        if R(2) < R2(Y(i))
            R(2) = R2(Y(i));
        end
    end

    % �������
    if n==10
       plot(Y,L1(Y),'Color', 'b', 'LineWidth', 1);
       plot(Y,L2(Y),'Color', 'k', 'LineWidth', 1);
    end

    % ��������� �������
    table(n/5,1) = n;
    table(n/5,2) = m;
    table(n/5,3) = R(1);
    table(n/5,4) = R(2);
end

disp(table);