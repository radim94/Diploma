% CALCULATE THE FRACTAL DIMENSION BY USING BOX COUNTING METHOD
% WEI GAO, SAMARA STATE AEROSPACE UNIVERSITY
% 11/21/2014

function [I_Mean,I_Median,I_Var,I_Skew,I_Kurt] = Func_Int(R)

% INPUT
%   R        -  region of interest

% OUTPUT
%   I_Mean   -  average value of intensity
%   I_Median -  median value of intensity
%   I_Var    -  variance
%   I_Skew   -  skewness
%   I_Kurt   -  kurtosis

%--------------------------------------------------------------------------

[row,col] = size(R);
A = reshape(R,[1,row*col]);

% [n,x] = hist(A);

I_Mean = mean(A);
I_Median = median(A);

I_Var = var(A);
I_Skew = skewness(A);
I_Kurt = kurtosis(A);

end