% PURPOSE: OBTAIN THE THRESHOLD USED IN THE CALCULATION OF MEMBERSHIP
% DEGREE WITH PROPER MEMBERSHIP FUNCTIONS

% PAPER: INTERVAL TYPE-II FUZZY ANISOTROPIC DIFFUSION ALGORITHM FOR SPECKLE
% NOISE REDUCTION IN OPTICAL COHERENCE TOMOGRAPHY IMAGES 2009

% WEI GAO, BASCOM PALMER EYE INSTITUTE, UNIVERSITY OF MIAMI, MIAMI, FL


function [KL,KU] = Func_Kv(I0,Gs,PL,PU)

% INPUT
%   I0  -  orginal oct image matrix
%   Gs  -  gaussian kernel matrix
%   PL  -  value to set up the lower threshold level
%   PU  -  value to set up the upper threshold level


% OUTPUT
%   KL  -  lower threshold values used in the function g
%   KU  -  upper threshold values used in the function g

%--------------------------------------------------------------------------
%  obtain the lower & upper threshold value

if (nargin == 2)
    PL = 0.8;
    PU = 0.9;
end

[r c] = size(I0);
dx = [-1 0 1; -1 0 1; -1 0 1];
dy = [1 1 1; 0 0 0; -1 -1 -1];

Igs = conv2(I0,Gs,'same');
Idx = conv2(Igs,dx,'same');
Idy = conv2(Igs,dy,'same');

Ixy = sqrt((abs(Idx)).^2+(abs(Idy)).^2);

LIxy = reshape(Ixy,1,r*c);
LIxy2 = sort(LIxy);

KL = LIxy2(1,round(r*c*PL));
KU = LIxy2(1,round(r*c*PU));

KL = KL/max(LIxy);
KU = KU/max(LIxy);

end