format longG
a = 1.8; b = 2.3;
eps = [10^(-6); 10^(-8); 10^(-10); 10^(-12)];

%h1 = 0.05;
%h1 = 0.125;
L = 2;

for s = 1:length(eps)
h1 = 0.5;
Cm = [1, 0, 0, 0];
m = zeros(1,4);
k = 1;
while abs(Cm(k)*(h1.^m(k))) >= eps(s)
h = [h1; h1/L; h1/L^2];
Int = zeros(1,3);
l = b-a;
for j = 1:length(h)
    
    n =  fix((l)./h(j)) + 2;

x = zeros(1,n);
for i = 0:n-1
   x(i+1) = a + h(j).*i;
end

f = @(x) 3.7.*cos(1.5.*x).*exp(-4.*x./3) + 2.4.*sin(4.5.*x).*exp(2.*x./3) + 4;
alfa = 0; betta = 3/5;

I = zeros(1, n-1);
for i = 1:n-1
    p = @(y) 1./(((y-1.8).^alfa).*((2.3-y).^betta));
    F = @(y) f(y).*p(y);
    %I(i) = integral(F, x(i), x(i+1));
    I(i) = Nuton_Kotes(x(i), x(i+1), 0);
    %I(i) = Gauss(x(i),x(i+1),0);
    Int(j) = Int(j) + I(i);
end

end
k = k + 1;
m(k) = -log(abs((Int(3)-Int(2))./(Int(2)-Int(1))))./log(L);
Cm(k) = (abs(Int(2)-Int(1)))./((h1.^m(k)).*(1-L^(-m(k))));
R2 = (abs(Int(2)-Int(1)))./((L^m(k))-1);

h_opt = 0.95*h(2)*((eps(s)/abs(R2))^(1/m(k)));
h_opt = (b-a)/ceil((b-a)/h_opt);

q = integral(F, a, b);
R_1 = abs(Int(1) - q);
R_2 = abs(Int(2) - q);
R_3 = abs(Int(3) - q);
h1 = h_opt;

end
disp(s);
m
Cm
Int
%hold on; 
grid on; 
axis square; 
%Z = linspace(0,N,N+1); 
plot( Int, 'LineWidth', 1.5, 'Color', [0 0 1]); 
% plot(Z, I,'LineWidth',1.5,'Color',[1 0 1]); 
end