%=====================================================
% Lagrange Polynomial Interpolation
%=====================================================
% X : interpolation points
% Y : value of f(X)
% x : points where we want an evaluation of P(x),
%     where P is the interpolator polynomial
%=====================================================


function polynomial = lagrange_interp(X,Y,x)


n          = length(X);
phi        = ones(n,length(x));
polynomial = zeros(1,length(x));
i = 0;
j = 0;

for i = [1:n]
    for j = [1:n]
        if not(i==j)
           phi(i,:) = phi(i,:).*(x-X(j))./(X(i)-X(j)); %i=1 to n row er element and all column
        end;
    end;
end;

for i = [1:n]
    polynomial = polynomial + Y(i)*phi(i,:);
end;