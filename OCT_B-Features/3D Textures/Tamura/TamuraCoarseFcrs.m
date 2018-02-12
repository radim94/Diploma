function [ Fcrs ] = TamuraCoarseFcrs( I )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%   Textural Features Corresponding to
%Visual Perception Tamura part of algorithm for evaluating coarseness
s=0;
[m,n]=size(I);
for i=1:m
    for j=1:n
Fcrs=s+1/(m*n)*TamuraCoarseSBest( I,i,j);
    end
end

end

