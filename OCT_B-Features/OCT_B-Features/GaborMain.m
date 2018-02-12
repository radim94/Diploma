function [ S ] = GaborMain(I)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%I= imread('C:\Users\User\Desktop\Наука\Science now-now\Science_now\Science\180912\melan\3ddd.tif',20);
% bn = mean(mean(I(30:50,:)));
% Ib = I - bn;
% I = Ib;
J=im2double(I);
% J = Func_FzdII(J,15,0.25,2);
x=J;
X0=AddX0(x);
X0=fft2(X0);
[m,n]=size(X0);
[ m0,ms0,sigma,sigmas ] = GaborGausDecomp( m );
W=zeros(m,m);
W(:,:)=1;
Ws=zeros(m,m);
Ws(:,:)=1;
for k=1:17 
 W = W.*GausWind2( m,m0(k,1),m0(k,2),sigma(k),sigma(k));
end
for k=1:16 
  Ws = Ws.*GausWind2( m,ms0(k,1),ms0(k,2),sigmas(k),sigmas(k));
end
 Y  = GaborSpectrIm2( X0,W,Ws );
 Y(:,:)=Y(:,:)-1;
 S=zeros(1,17);
for k=1:17
   S(k)=GaborAverEnergy2(Y,m0(k,1),m0(k,2),sigma(k)); 
end 


end

