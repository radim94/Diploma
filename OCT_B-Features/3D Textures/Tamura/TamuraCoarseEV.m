function [ Ekv ] = TamuraCoarseEV( I,k,x,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   Textural Features Corresponding to
%Visual Perception Tamura part of algorithm for evaluating coarseness --
%vertical degree
if ((y-2^(k-1))<=0)
   Ekv=abs(TamuraCoarseA(I,k,x,y+2^(k-1)));
else Ekv=abs(TamuraCoarseA(I,k,x,y+2^(k-1))-TamuraCoarseA(I,k,x,y-2^(k-1)));
end
end

