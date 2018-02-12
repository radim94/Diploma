function [ G ] = GaborFunc( t1,t2,t10,t20,w10,w20)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
deg=-(((t1-t10)^2)/(2*sigma1^2)+((t2-t20)^2)/(2*sigma2^2))+1i*(w10*t1+w20*t2);
%G(t1,t2,t10,t20,w10,w20)=exp(deg);
G=exp(deg);

end

