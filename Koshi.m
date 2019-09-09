format longG
A = -3; B = 2.5; C = 1;
y0 = [1; 1; A; 1];
f = @(x,y)[2.*x.*y(4).*(y(2)).^(1./B); 2.*B.*x.*exp(B./C.*(y(3)-A)).*y(4); 2.*C.*x.*y(4); -2.*x.*log(y(1))];
Y = @(x) [exp(sin(x.^2)); exp(B * sin(x.^2)); C * sin(x.^2) + A; cos(x.^2)];
a = 0; b = 5; I = [a, b];
R = zeros(4,4);
N = zeros(1,4);

     
% мой метод
% [y, x, h, r] = my(f, I, y0, tol, hmax, h0)
tol = [10^(-4);10^(-5);10^(-6);10^(-7)];
for k=1:4
[y, x, h, r] = my(f, I, y0, tol(k), 0.01, 0);
N(k) = length(x);

% метод оппонент
% [y, x] = el(f, X, y0, h)
[y_el, x_el] = el(f, I, y0, 0.0001);


% точное решение в точках из моего метода
z = Y(x);


% на графике
col = 'ymcg'; % вектор цветов 
% for i = 1:4
%     figure('Position', [50 + (i-1)*50, 80 + (i-1)*40, 720, 560],...
%             'NumberTitle', 'off', 'Name',...
%             ['Сравнение точного и приближенного решений по ',num2str(i),'-й компоненте']);
%     hold on; 
%     grid on; 
%     axis square;
%     plot(x, z(i,:), 'LineWidth',4,'Color',[0 0 0]);
%     plot(x, z(i,:) + tol, '--r');
%     plot(x, z(i,:) - tol, '--r');
%     plot(x, y(i,:), 'LineWidth',1,'Color',col(i));
% end

% вектор максимальных погрешностей

for i = 1:4
    %R(k,i) = max(abs(z(i,:) - y(i,:)));
    R(k,i) = abs(z(i,length(x)) - y(i,length(x)));
end
end
disp(R);
r = -log(R);
disp(r);
for i = 1:4
    figure('NumberTitle', 'off', 'Name',['Логарифм погрешности для ',num2str(i),'-й компоненты в зависимости от N']);
    hold on; 
    grid on; 
    plot(N(1),r(1,i),'r*',N(2),r(2,i),'r*',N(3),r(3,i),'r*',N(4),r(4,i),'r*');
end