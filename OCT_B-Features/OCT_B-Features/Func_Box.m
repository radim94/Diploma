% CALCULATE THE FRACTAL DIMENSION BY USING BOX COUNTING METHOD
% WEI GAO, SAMARA STATE AEROSPACE UNIVERSITY
% 11/21/2014

function [FD,SD] = Func_Box(R)

% INPUT
%   R       -  region of interest

% OUTPUT
%   FD      -  fractal dimension of ROI

%--------------------------------------------------------------------------
%  calculate the fractal dimension of region of interest (2D)

% if (iscell(R))
%     
%     N = length(R);
%     FD = zeros(1,N);
%     for i = 1:N    
%         B = R{i};  
%         FD(i) = Func_DBC(B);
%     end
%     
% else
%     
%     B = R;
%     FD = Func_DBC(B);
% end
% calculate fractal dimension along each A-scan
%--------------------------------------------------------------------------
if (iscell(R))
    
    N = length(R);
    FD = zeros(1,N);
    for i = 1:N    
        B = R{i};
        col = size(B,2);
        tem = zeros(1,col);
        for k = 1:col
            A = B(:,k);
            tem(k) = Func_BC(A);
        end

       % [cp,fwhm,R2] = Func_Hist(tem);  
        
        FD(i) = mean(tem);
        SD = std(tem);
    end
    
else
    
    B = R;
    col = size(B,2);
    tem = zeros(1,col);
    for k = 1:col
        A = B(:,k);
        tem(k) = Func_BC(A);
    end
    
    %[cp,fwhm,R] = Func_Hist(tem);
    FD = mean(tem);
    SD = std(tem);
    
end


end