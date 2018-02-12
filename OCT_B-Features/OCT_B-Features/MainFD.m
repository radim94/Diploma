% PERFORM THE 1D & 2D FOURIER FRACTAL ANALYSIS ON B-SCAN (IMAGE)
% WEI GAO, NINGBO UNIVERSITY OF TECHNOLOGYS
% LAST MODIFIED DATE: 8/15/2016

function [FD,TT]=MainFD(Rt)

% INPUT
%   I0      -  original image

%--------------------------------------------------------------------------
% 7 methods for calculating the fractal dimension as the following:
% the 1D box counting method (along the vertical direction)
% the 1D box counting method (along the horizontal direction)
% the 2D box counting method
% the 1D Fourier fractal analysis (along the vertical direction)
% the 1D Fourier fractal analysis (along the horizontal direction)
% the 2D Fourier fractal analysis
% the 2D differential box counting method


FD = zeros(1,7);
TT = zeros(1,7);



   
    [r c] = size(Rt);


    % 1d Fourier fractal analysis
    tic;
    tem3 = zeros(1,c);
    for j = 1:c
        [tem3(j)] = Func_PS1D(Rt(:,j)); % along the vertical direction
    end
    FD(4) = mean(tem3);
    toc;
    TT(4) = toc;

    tic;
    tem4 = zeros(1,r);
    for i = 1:r
        [tem4(i)] = Func_PS1D(Rt(i,:)); % along the horizontal direction
    end
    FD(5) = mean(tem4);
    toc;
    TT(5) = toc;

    % 2d Fourier fractal analysis
    tic;
    [FD(6)] = Func_PS2D(Rt);
    toc;
    TT(6) = toc;

    % 2d differential box counting method
    tic;
    [FD(7)] = Func_DBC(Rt);
    toc;
    TT(7) = toc;
    


%--------------------------------------------------------------------------
% output



end