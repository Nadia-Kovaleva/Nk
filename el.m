function [y, x] = el(f, I, y0, h)

% определение варианта работы
if nargin == 3
    h = 0.0001;
elseif nargin ~= 4
    error('Неверно заданы входные аргументы');
end

y_el = @(x,y,h) y + h/2 * (f(x,y) + f(x + h, y + h * f(x,y)));

% интегрирование с постоянным шагом
x = I(1):h:I(2);
N = length(x);
y = zeros(length(y0),N);
y(:,1) = y0;
for i = 2:N
y(:,i) = y_el(x(i-1),y(:,i-1),h);
end
end