function [ gk ] = GaborAverEnergy2( Y,m10k,m20k,sigma1k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
gk=0;
CY=conj(Y);
for m1=m10k-sigma1k+1:m10k+sigma1k
    for m2=m20k-sigma1k+1:m20k+sigma1k
gk=gk+Y(m1,m2)*CY(m1,m2)/(4*sigma1k^2);
    end
end

end

