function res = binomial_coeffs(deg)
    n = deg+1;
    res(1) = 1;
    res(2) = deg;
    if deg < 11
        switch deg
            case 2
                res(3) = 1;
            case 3
                % ceil округляет до большего целого
                for i = (ceil(n/2)+1):n
                    res(i) = res(n+1-i);
                end
            case 4
                res(3) = 6;
                for i = (ceil(n/2)+1):n
                    res(i) = res(n+1-i);
                end
            case 5
                res(3) = 10;
                for i = (ceil(n/2)+1):n
                    res(i) = res(n+1-i);
                end
            case 6
                res(3) = 15;
                res(4) = 20;
                for i = (ceil(n/2)+1):n
                    res(i) = res(n+1-i);
                end
            case 7
                res(3) = 21;
                res(4) = 35;
                for i = (ceil(n/2)+1):n
                    res(i) = res(n+1-i);
                end
            case 8
                res(3) = 28;
                res(4) = 56;
                res(5) = 70;
                for i = (ceil(n/2)+1):n
                    res(i) = res(n+1-i);
                end
            case 9
                res(3) = 36;
                res(4) = 84;
                res(5) = 126;
                for i = (ceil(n/2)+1):n
                    res(i) = res(n+1-i);
                end
            case 10
                res(3) = 45;
                res(4) = 120;
                res(5) = 210;
                res(6) = 252;
                for i = (ceil(n/2)+1):n
                    res(i) = res(n+1-i);
                end
        end
    else
        for k = 3:ceil(n/2)
            num = deg;
            den = 1;
            for i = 2:k-1
                num = num*(deg+1-i);
                den = den*i;
            end
            res(k) = num/den;
        end
        for i = (ceil(n/2)+1):n
            res(i) = res(n+1-i);
        end
    end
end