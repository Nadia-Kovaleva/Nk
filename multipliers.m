function [L] = multipliers(Z,j,X)
   %  L имеет вид(Z-X1)(Z-X2)...(Z-Xj-1)(Z-Xj+1)...(Z-Xn), где Х1...Хn-компоненты вектора Х 
   L = 1;
   for i = 1:1:length(X)
       if (i ~= j)
           L = L.*(Z-X(i));
       end
   end
   L = double(L);
end

