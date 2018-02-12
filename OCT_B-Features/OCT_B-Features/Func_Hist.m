% CALCULATE THE HISTROGRAM OF THE SELECTED DATA
% WEI GAO, SAMARA STATE AEROSPACE UNIVERSITY
% 11/21/2014

function [cp,fwhm,R2] = Func_Hist(A)

% INPUT
%   A       -  1D array

% OUTPUT
%   cp      -  centroid
%   fwhm    -  full width at half maximum
%   R2      -  correlation coefficient

%--------------------------------------------------------------------------
% perform the histogram 

[n,x] = hist(A);

% perform the gaussian fit

f = fit(x.',n.','gauss1');

cp = f.b1;
fwhm = 2*sqrt(2*log2(2))*f.c1;

y = n';
yf = f(x);

% calculate the correlation coefficients
R = Func_Corr(y,yf);

R2 = R*R;

figure;
plot(x,n,'ro');
hold on;
x2 = 1:0.01:2;
yf2 = f(x2);
plot(x2,yf2,'g-');
hold off;


end