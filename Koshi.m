format longG
A = -3; B = 2.5; C = 1;
y0 = [1; 1; A; 1];
f = @(x,y)[2.*x.*y(4).*(y(2)).^(1./B); 2.*B.*x.*exp(B./C.*(y(3)-A)).*y(4); 2.*C.*x.*y(4); -2.*x.*log(y(1))];
Y = @(x) [exp(sin(x.^2)); exp(B * sin(x.^2)); C * sin(x.^2) + A; cos(x.^2)];
a = 0; b = 5; I = [a, b];
R = zeros(4,4);
N = zeros(1,4);

     
% ��� �����
% [y, x, h, r] = my(f, I, y0, tol, hmax, h0)
tol = [10^(-4);10^(-5);10^(-6);10^(-7)];
for k=1:4
[y, x, h, r] = my(f, I, y0, tol(k), 0.01, 0);
N(k) = length(x);

% ����� ��������
% [y, x] = el(f, X, y0, h)
[y_el, x_el] = el(f, I, y0, 0.0001);


% ������ ������� � ������ �� ����� ������
z = Y(x);


% �� �������
col = 'ymcg'; % ������ ������ 
% for i = 1:4
%     figure('Position', [50 + (i-1)*50, 80 + (i-1)*40, 720, 560],...
%             'NumberTitle', 'off', 'Name',...
%             ['��������� ������� � ������������� ������� �� ',num2str(i),'-� ����������']);
%     hold on; 
%     grid on; 
%     axis square;
%     plot(x, z(i,:), 'LineWidth',4,'Color',[0 0 0]);
%     plot(x, z(i,:) + tol, '--r');
%     plot(x, z(i,:) - tol, '--r');
%     plot(x, y(i,:), 'LineWidth',1,'Color',col(i));
% end

% ������ ������������ ������������

for i = 1:4
    %R(k,i) = max(abs(z(i,:) - y(i,:)));
    R(k,i) = abs(z(i,length(x)) - y(i,length(x)));
end
end
disp(R);
r = -log(R);
disp(r);
for i = 1:4
    figure('NumberTitle', 'off', 'Name',['�������� ����������� ��� ',num2str(i),'-� ���������� � ����������� �� N']);
    hold on; 
    grid on; 
    plot(N(1),r(1,i),'r*',N(2),r(2,i),'r*',N(3),r(3,i),'r*',N(4),r(4,i),'r*');
end