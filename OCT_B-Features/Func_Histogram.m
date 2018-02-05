% CALCULATE THE HISTROGRAM OF THE SELECTED DATA
% WEI GAO, SAMARA STATE AEROSPACE UNIVERSITY
% 11/21/2014

function [n,xout,cp,fwhm,coe] = Func_Histogram(R)

% INPUT
%   R       -  1D array

% OUTPUT
%   n       -  number of elements in each bin
%   xout    -  location of bin
%   cp      -  centroid
%   fwhm    -  full width at half maximum
%   coe     -  correlation coefficient

%--------------------------------------------------------------------------
% perform the histogram 

x = 1:0.05:4;
[n] = hist(R,x);

% perform the gaussian fit

f = fit(x.',n.','gauss1');

cp = f.b1;
fwhm = 2*sqrt(2*log2(2))*f.c1;


y = n';
yf = f(x);
% calculate the correlation coefficients

R = Func_Corr(y,yf);


end