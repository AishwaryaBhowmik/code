%% Example 1.1
% Lagrange Polynomial Interpolation



%% Define vectors

% X : interpolation points
% Y : value of f(X)
% x : points where we want an evaluation of P(x),
%     where P is the interpolator polynomial
x = [-1:0.01:1];
X = [-1:0.20:1];

y = 1./(1+25*x.^2);
Y = 1./(1+25*X.^2);

%% Lagrange Interpolation
pol = lagrange_interp(X,Y,x);


%% Generate plots
plot(x,pol,'k',x,y,'k--',X,Y,'k.');
legend('Lagrange Polynomial','Expected behavior','Data Points');

%% Evaluate P(.7)
p7  = lagrange_interp(X,Y,.9)