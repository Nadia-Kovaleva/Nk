function [ dX ] = F_for_MIXER(u,c1,c2,k,S)
%   правая часть оду
dX = zeros(2,1);
V = u(3);
c = u(4);
F1 = u(1);
F2 = u(2);
dV = F1 + F2 - k*sqrt(V/S);
dc = 1/V*((c1-c)*F1 + (c2-c)*F2);
dX(1) = dV;
dX(2) = dc;

end

