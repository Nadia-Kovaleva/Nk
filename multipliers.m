function [L] = multipliers(Z,j,X)
   %  L ����� ���(Z-X1)(Z-X2)...(Z-Xj-1)(Z-Xj+1)...(Z-Xn), ��� �1...�n-���������� ������� � 
   L = 1;
   for i = 1:1:length(X)
       if (i ~= j)
           L = L.*(Z-X(i));
       end
   end
   L = double(L);
end

