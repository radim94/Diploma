% TO CALCULATE FRACTAL DIMENSION OF 2D IMAGE BY USING DIFFERENTIAL BOX
% COUNTING METHOD (DBC)
% WEI GAO, SAMARA STATE AEROSPACE UNIVERSITY
% 11/20/2014

function [Fd] = Func_DBC(I)

% INPUT
% I    -   Image matrix

% OUTPUT
% Fd   -   Fractal Dimension

%--------------------------------------------------------------------------

[row,col] = size(I);
maxV = max(row,col);
N = ceil(log(maxV)/log(2));
M = 2^N;

I2 = zeros(M,M);
I2(1:row,1:col) = I;

G = max(max(I2));

s = zeros(1,N);
NBox = zeros(1,N);

for k = 1:N
    s(k) = 2^k;
    sp = double(G)/M*s(k);
    M2 = M/s(k);
    for i = 1: M2
        for j = 1:M2
            V = I2(((i-1)*s(k)+1):(i*s(k)),((j-1)*s(k)+1):(j*s(k)));
            minV = min(min(V));
            maxV = max(max(V));
            
            lc = ceil(maxV/sp);
            kc = ceil(minV/sp);
        
%             lc = ceil(maxV/(G/M*s(k)));
%             kc = ceil(minV/(G/M*s(k)));
            
            if (kc == 0)
                NBox(1,k) = NBox(1,k)+lc;
            else
                NBox(1,k) = NBox(1,k)+lc-kc+1;
            end
           
        end
    end
end

p = polyfit(log(s),log(NBox),1);
Fd = -p(:,1);

% s
% NBox
% figure; plot(log(s),log(NBox),'go');
% Y = polyval(p,log(s));
% hold on; plot(log(s),Y,'r-');

end