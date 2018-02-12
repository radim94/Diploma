function [ HD ] = TamuraDirectionality(I)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%%Directionality
N=16;
t=12;
[m,n]=size(I);
deltaH=[-1 0 1;-1 0 1;-1 0 1];
deltaV=[1 1 1;0 0 0;-1 -1 -1];
a=abs(conv2(deltaH,I));
b=abs(conv2(deltaV,I));
deltaG=(a+b)/2;
theta=atan(b/a)+pi/2;

Nsum=0;
Nteta =zeros(1,N-1);
for k=1:N-1% trouble!!!
    Nteta(k)=0;
    for i=1:m
        for j=1:n
            if ((2*k-1)*pi/(2*n)<=theta<(2*k+1)*pi/(2*n))
              if (deltaG(i,j)>=t)
                Nteta(k)=Nteta(k)+1;  
              end
            end
        end
    end
    Nsum=Nsum+Nteta(k);
end

HD =zeros(1,N-1);
for k=1:N-1%trouble!!!
    HD(k)=Nteta(k)/Nsum;
end

end

