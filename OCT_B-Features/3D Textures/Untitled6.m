function [ Wk ] = Untitled6( m1,m2,k,m10,m20,sigma1,sigma2)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
deg1= (m1-m10(k))^2/(2*sigma1(k)^2);
deg2=(m2-m20(k))^2/(2*sigma2(k)^2);
Wk(m1,m2)=exp(-(deg1+deg2));
%%troubleaaa
end

