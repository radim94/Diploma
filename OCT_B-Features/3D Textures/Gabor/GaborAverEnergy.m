function [ gk ] = GaborAverEnergy( X0,yk )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m,n]=sizes(X0);
gk=0;
%for i= -(m-1)/2:(m-1)/2
 %   for j= -(n-1)/2:(n-1)/2
 for i= 1:m
   for j= 1:n
gk=gk+yk(m,n)*conj(yk(m,n))/(m*n)
    end
end

end

