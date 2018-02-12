function [ X0 ] = AddX0( x0)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[m,n]=size(x0);
s=max(m,n);
s=ceil(log2(s));
s=2^s;
X0=zeros(s,s);
for i=1:m
    for j=1:n       
X0(m,n)=x0(m,n);
    end
end

end

