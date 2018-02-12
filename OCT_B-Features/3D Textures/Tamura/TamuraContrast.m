function [ Fcon ] = TamuraContrast( I )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
J=I.^4;
B=I.^2;
nu4=mean(J(:));
sigma2=mean(B(:))-mean(I(:))^2;
alpha4=nu4/(sigma2^2);
Fcon=sigma2/(alpha4^0.25);
end

