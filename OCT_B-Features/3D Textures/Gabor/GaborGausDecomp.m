function [ m0,ms0,sigma,sigmas ] = GaborGausDecomp( m )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%17 window=0 window in theory
m0=zeros(17,2);
ms0=zeros(17,2);
sigma=zeros(17,1);

m0(17,1)=floor(m/2);
m0(17,2)=floor(m/2);
sigma(17)=floor(m/6);

m0(1,1)=floor(m/2);
m0(1,2)=floor(5*m/6);
sigma(1)=floor(m/6);
ms0(1,1)=floor(m/2);
ms0(1,2)=floor(m/6);

m0(2,1)=floor(m/6);
m0(2,2)=floor(m/2);
sigma(2)=floor(m/6);
ms0(2,1)=floor(5*m/6);
ms0(2,2)=floor(m/2);

m0(3,1)=floor(3*m/4);
m0(3,2)=floor(11*m/12);
sigma(3)=floor(m/12);
ms0(3,1)=floor(m/4);
ms0(3,2)=floor(m/12);

m0(4,1)=floor(3*m/4);
m0(4,2)=floor(3*m/4);
sigma(4)=floor(m/12);
ms0(4,1)=floor(m/4);
ms0(4,2)=floor(m/4);

m0(5,1)=floor(m/4);
m0(5,2)=floor(3*m/4);
sigma(5)=floor(m/12);
ms0(5,1)=floor(3*m/4);
ms0(5,2)=floor(m/4);

m0(6,1)=floor(m/4);
m0(6,2)=floor(11*m/12);
sigma(6)=floor(m/12);
ms0(6,1)=floor(m/4);
ms0(6,2)=floor(m/12);

m0(7,1)=floor(11*m/12);
m0(7,2)=floor(3*m/4);
sigma(7)=floor(m/12);
ms0(7,1)=floor(m/12);
ms0(7,2)=floor(m/4);

m0(8,1)=floor(m/12);
m0(8,2)=floor(3*m/4);
sigma(8)=floor(m/12);
ms0(8,1)=floor(11*m/12);
ms0(8,2)=floor(m/4);

m0(9,1)=floor(21*m/24);
m0(9,2)=floor(23*m/24);
sigma(9)=floor(m/24);
ms0(9,1)=floor(3*m/24);
ms0(9,2)=floor(m/24);

m0(10,1)=floor(21*m/24);
m0(10,2)=floor(21*m/24);
sigma(10)=floor(m/24);
ms0(10,1)=floor(3*m/24);
ms0(10,2)=floor(3*m/24);

m0(11,1)=floor(3*m/24);
m0(11,2)=floor(21*m/24);
sigma(11)=floor(m/24);
ms0(11,1)=floor(21*m/24);
ms0(11,2)=floor(3*m/24);

m0(12,1)=floor(3*m/24);
m0(12,2)=floor(21*m/24);
sigma(12)=floor(m/24);
ms0(12,1)=floor(21*m/24);
ms0(12,2)=floor(3*m/24);

m0(13,1)=floor(23*m/24);
m0(13,2)=floor(23*m/24);
sigma(13)=floor(m/24);
ms0(13,1)=floor(m/24);
ms0(13,2)=floor(m/24);

m0(14,1)=floor(23*m/24);
m0(14,2)=floor(21*m/24);
sigma(14)=floor(m/24);
ms0(14,1)=floor(m/24);
ms0(14,2)=floor(3*m/24);

m0(15,1)=floor(m/24);
m0(15,2)=floor(21*m/24);
sigma(15)=floor(m/24);
ms0(15,1)=floor(23*m/24);
ms0(15,2)=floor(3*m/24);

m0(16,1)=floor(m/24);
m0(16,2)=floor(23*m/24);
sigma(16)=floor(m/24);
ms0(16,1)=floor(23*m/24);
ms0(16,2)=floor(m/24);

sigmas=sigma;
sigmas(17)=0;
end

