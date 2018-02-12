function [ a ] = GaborA( t10,t20,w10,w20,m,n,x0 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
a=0;
for t1=1:m
    for t2=1:n
a=a+x0(t1,t2)*GaborFunc(t1,t2,t10,t20,w10,w20);
    end
end

end

