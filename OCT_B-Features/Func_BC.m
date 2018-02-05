% TO CALCULATE FRACTAL DIMENSION OF 1D ARRAY BY USING BOX COUNTING METHOD
% WEI GAO, SAMARA STATE AEROSPACE UNIVERSITY
% 11/20/2014

% walking 

function [Fd] = Func_BC(A)

% INPUT
% I    -   Image matrix

% OUTPUT
% Fd   -   Fractal Dimension

%--------------------------------------------------------------------------

Len = length(A);
N = ceil(log(Len)/log(2));
M = 2^N;

A2 = zeros(1,M);
A2(1:Len) = A;

G = max(A);

s = zeros(1,N);
NBox = zeros(1,N);

%--------------------------------------------------------------------------

for k = 1:N
    s(k) = 2^k;
    sp = double(G)/M*s(k);
    M2 = M/s(k);
    for i = 1: M2
        
%         V = A2(((i-1)*s(k)+1):(i*s(k)));
        V = A2((max((i-1)*s(k),1)):(i*s(k)));

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

p = polyfit(log(s),log(NBox),1);
Fd = -p(:,1);

% figure; plot(log(s),log(NBox),'go');
% Y = polyval(p,log(s));
% hold on; plot(log(s),Y,'r-');

end