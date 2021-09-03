clc;
clear variables;
close all;

% X : interpolation points
% Y : value of f(X)
% x : points where we want an evaluation of P(x),
%     where P is the interpolator polynomial
x = [1998:0.10:2010]; %#ok<*NBRAK>
X = [1998:1:2008]; % with equidistant points

%y = 1./(1+25*x.^2); % Runge function
Y = [21300 23057 24441 25917 27204 28564 29847 31200 32994 34800 36030];

interp = naturalCubicSpline(X,Y,x);

plot(x,interp,'k-',X,Y,'ko','MarkerFaceColor','k');
set(get(gca,'XAxis'),'Fontweight','normal','FontSize',12);
set(get(gca,'YAxis'),'Fontweight','normal','FontSize',12);
xlabel ('year (x)','fontweight','normal','fontsize',14);
ylabel ('Tuition per year (f(x))','fontweight','normal','fontsize',14);
legend('Cubic Spline','Data Points','fontweight','normal','fontsize',12,'Location','North');
grid on;
ax = gca;
ax.YAxis.Exponent = 0;
print(gcf,'hw1_sol7c.png','-dpng','-r1200');

% evaluate P(2010)
format short g
p2010  = naturalCubicSpline(X,Y,2010)