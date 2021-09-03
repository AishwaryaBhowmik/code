%===============================================================
% Cubic Spline Interpolation with the Free Run-out End Condition
%===============================================================
% Syntax  
% --------------------------------------------------------------
%   yy = naturalCubicSpline(X,Y,xx)
%   pp = naturalCubicSpline(X,Y)
%
% Input Parameters  
% --------------------------------------------------------------
%   X  : interpolation points
%   Y  : value of f(X)
%   xx : points where we want an evaluation of P(x),
%        where P is the interpolator polynomial
%
% Description
% --------------------------------------------------------------
%   yy = naturalCubicSpline(X,Y,xx) uses a cubic spline interpolation
%   to find yy at the values of the interpolant xx. The end
%   condition is Free run-out (see p.6 in the text). The values 
%   in x must be distinct.
%===============================================================

function output = naturalCubicSpline(X,Y,xx)
% Sort [X,Y] to avoid errors in ppval()
[Xsorted, I] = sort(X);
Ysorted = Y(I);

n     = length(Xsorted);
delta = Xsorted(2:n)-Xsorted(1:n-1);

% Construct the tri-diagonal matrix to find g'' (with free run-out b.c.)
matSize = n-2;
M = zeros(matSize);
b = zeros(matSize,1);
for i = 1:matSize
    if i > 1
        M(i,i-1) = delta(i)/6;
    end
    M(i,i) = (delta(i) + delta(i+1))/3;
    if i < matSize
        M(i,i+1) = delta(i+1)/6;
    end   
    
    b(i) = (Ysorted(i+2) - Ysorted(i+1))/delta(i+1) - (Ysorted(i+1)-Ysorted(i))/delta(i);
end

% Solve the system for g'' and add boundary points
gpp = M\b;
gpp = [0; gpp; 0];

% Construct the piecewise polynomials
coefs = zeros(n-1,4);
for i=1:n-1
    Delta = delta(i);
    
    coefs(i,1) = (gpp(i+1)-gpp(i))/(6*Delta);
    coefs(i,2) = gpp(i)/2;
    coefs(i,3) = -(gpp(i+1)+2*gpp(i))/6*Delta + (Ysorted(i+1)-Ysorted(i))/Delta;
    coefs(i,4) = Ysorted(i);
end
pp = mkpp(Xsorted, coefs);

% Return
if(~exist('xx','var'))
    output = pp;
else
    output = ppval(pp,xx);
end