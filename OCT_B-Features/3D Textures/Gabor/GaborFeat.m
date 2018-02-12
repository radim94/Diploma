function [ output_args ] = GaborFeat( I,t10,t20,w10,w20,x0 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%G=GaborFunc(t1,t2,t10,t20,w10,w20);
[m,n]=sizes(I);
a= GaborA(t10,t20,w10,w20,m,n,x0);
deg1=-1/2*((sigma1^2)*((w1-w10)^2)+(sigma2^2)*((w2-w20)^2));
deg2=-1i*((w1-w10)*t10+(w2-w20)*t20);
Gi(w1,w2,t1,t2,t10,t20,w10,w20,sigma1,sigma2)= 2*pi*sigma1*sigma2* exp(deg1)*exp(deg2);
a(t1,t2,w10,w20)= xi(t1,t2)*Gi(t1,t2,t10,t20,w10,w20);


end

