function [ Ekh ] = TamuraCoarseEH( I,k,x,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Textural Features Corresponding to
%Visual Perception Tamura part of algorithm for evaluating coarseness
%--horizontal direction
if ((x-2^(k-1))<=0)
   Ekh=abs(TamuraCoarseA(I,k,x+2^(k-1),y));
else Ekh=abs(TamuraCoarseA(I,k,x+2^(k-1),y)-TamuraCoarseA(I,k,x-2^(k-1),y));
end
end

