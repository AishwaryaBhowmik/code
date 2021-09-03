clc;
clear variables;
close all;

% X : interpolation points
% Y : value of f(X)
% x : points where we want an evaluation of P(x),
%     where P is the interpolator polynomial
x = [1993:0.20:2007]; %#ok<*NBRAK>
X = [1993 1995 2001 2003 2005 2007]; % with equidistant points

y = 1./(1+25*x.^2); % Runge function
Y = [12.0 12.7 18.2 19.8 24.1 28.1];

pol = lagrange_interp(X,Y,x);

plot(x,pol,'k',X,Y,'ko','MarkerFaceColor','k');
set(get(gca,'XAxis'),'Fontweight','normal','FontSize',12);
set(get(gca,'YAxis'),'Fontweight','normal','FontSize',12);
xlabel ('Year (x)','fontweight','normal','fontsize',14);
ylabel ('Toxin Concentration (f(x))','fontweight','normal','fontsize',14);
legend('Lagrange Interpolation','Data Points','fontweight','normal','fontsize',12,'Location','South');
xlim([1993 2007]);
set(gca,'XTick',[1993 1995 1997 1999 2001 2003 2005 2007]);
grid on;
ax = gca;
ax.YAxis.Exponent = 0;
print(gcf,'hw1_sol8b.png','-dpng','-r1200');


% evaluate P(1997)
format short g
p1997 = lagrange_interp(X,Y,1997) %#ok<*NOPTS>
tre = abs((13.0 - p1997)/13.0)*100 %#ok<*NASGU> % true relative error

% evaluate P(1999)
format short g
p1999 = lagrange_interp(X,Y,1999)
tre = abs((15.2 - p1999)/15.2)*100 % true relative error