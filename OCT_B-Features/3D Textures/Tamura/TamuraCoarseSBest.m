function [ Sbest ] = TamuraCoarseSBest( I,x,y)
%UNTITLED3 Summary of this function goes here
%   Textural Features Corresponding to
%Visual Perception Tamura part of algorithm for evaluating coarseness
Ek1=linspace(0,0,5);
for i=1:5
Ek1(i)=TamuraCoarseEH(I,i,x,y)+TamuraCoarseEV(I,i,x,y);
end
k=find(Ek1==max(Ek1));
Sbest=2.^k;

end

