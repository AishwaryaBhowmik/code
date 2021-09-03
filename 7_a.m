clc;
clear variables;
close all;

% X : interpolation points
% Y : value of f(X)
% x : points where we want an evaluation of P(x),
%     where P is the interpolator polynomial
x = [1998:0.10:2008]; 
X = [1998:1:2008]; 

y = 1./(1+25*x.^2); % Runge function
Y = [21300 23057 24441 25917 27204 28564 29847 31200 32994 34800 36030];

pol = polyval(polyfit(X, Y, 5), X);


plot(X,pol,'k',X,Y,'ko','MarkerFaceColor','k');
set(get(gca,'XAxis'),'Fontweight','normal','FontSize',10);
set(get(gca,'YAxis'),'Fontweight','normal','FontSize',10);
xlabel ('Year','fontweight','normal','fontsize',12);
ylabel ('Tuition per year','fontweight','normal','fontsize',12);
legend('Intuitive Curve Fitting','Data Points','fontweight','normal','fontsize',12,'Location','North');
grid on;
ax = gca;
ax.YAxis.Exponent = 0;
print(gcf,'hw1_sol7a.png','-dpng','-r1200');