clc;
clear variables;
close all;

% X : interpolation points
% Y : value of f(X)
% x : points where we want an evaluation of P(x),
%     where P is the interpolator polynomial
x = [1993:0.20:2009]; %#ok<*NBRAK>
X = [1993:2:2007]; % with equidistant points

y = 1./(1+25*x.^2); % Runge function
Y = [12.0 12.7 13.0 15.2 18.2 19.8 24.1 28.1];

pol = lagrange_interp(X,Y,x);

plot(x,pol,'k',X,Y,'ko','MarkerFaceColor','k');
set(get(gca,'XAxis'),'Fontweight','normal','FontSize',12);
set(get(gca,'YAxis'),'Fontweight','normal','FontSize',12);
xlabel ('Year (x)','fontweight','normal','fontsize',14);
ylabel ('Toxin Concentration (f(x))','fontweight','normal','fontsize',14);
legend('Lagrange Interpolation','Data Points','fontweight','normal','fontsize',12,'Location','South');
xlim([1993 2009]);
set(gca,'XTick',[1993 1995 1997 1999 2001 2003 2005 2007 2009]);
grid on;
ax = gca;
ax.YAxis.Exponent = 0;
print(gcf,'hw1_sol8a.png','-dpng','-r1200');

% evaluate P(2009)
format short g
p2009  = lagrange_interp(X,Y,2009) %#