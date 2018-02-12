function [ Gi ] = GaborFourierIm( w1,w2,t10,t20,w10,w20,sigma1,sigma2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
deg1=-1/2*((sigma1^2)*((w1-w10)^2)+(sigma2^2)*((w2-w20)^2));
deg2=-1i*((w1-w10)*t10+(w2-w20)*t20);
Gi= 2*pi*sigma1*sigma2* exp(deg1)*exp(deg2);
end

