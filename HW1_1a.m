%% Example 1.1
% Lagrange Polynomial Interpolation



%% Define vectors

% X : interpolation points
% Y : value of f(X)
% x : points where we want an evaluation of P(x),
%     where P is the interpolator polynomial
x = [1998:0.10:2010];
X = [1998:1:2008];

y = 1./(1+25*x.^2);
Y = 1./(1+25*X.^2);

%% Lagrange Interpolation
pol = lagrange_interp(X,Y,x);


%% Generate plots
plot(x,pol,'k',x,y,'k--',X,Y,'k+');
legend('Lagrange Interpolation','Data Points','fontweight','normal','fontsize',12,'Location','North');
grid on;

%% Evaluate P(.7)
p7  = lagrange_interp(X,Y,2010)