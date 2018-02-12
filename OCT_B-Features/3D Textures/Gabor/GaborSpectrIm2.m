function [ y ] = GaborSpectrIm2( xinv,Wk,Winv )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y=xinv.*(Wk+Winv);

end

