function [ a ] = GaborA2( t10,t20,w10,w20,w1,w2,sigma1,sigma2,m,n,x0 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
a=0;
X0=ifft2(x0);
for t1=1:m
    for t2=1:n
a=a+X0(t1,t2)*GaborFourierIm(w1,w2,t10,t20,w10,w20,sigma1,sigma2);
    end
end

end

