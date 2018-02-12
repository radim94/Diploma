function [ Ak] = TamuraCoarseA(I,k,x,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   Textural Features Corresponding to
%Visual Perception Tamura part of algorithm for evaluating coarseness
s=0;
[m,n]=size(I);
Ak=zeros(k,k);
for i=x-2^(k-1):x+2^(k-1)-1
    for j=y-2^(k-1):y+2^(k-1)-1
        if(i>0)&&(j>0)&&(i<m+1)&&(j<n+1)
            Ak= s+I(i,j)/(2^(2*k));
        end
    end
end

end

