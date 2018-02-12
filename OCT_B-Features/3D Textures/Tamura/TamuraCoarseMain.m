function [ a ] = TamuraCoarseMain(  )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%   Textural Features Corresponding to
%Visual Perception Tamura all algorithm for evaluating coarseness
I= imread('C:\Users\User\Desktop\Наука\Science now-now\Science_now\Science\180912\melan\3ddd.tif',20);
% bn = mean(mean(I(30:50,:)));
% Ib = I - bn;
% I = Ib;
J=im2double(I);
% J = Func_FzdII(J,15,0.25,2);
a=TamuraCoarseFcrs(I);

end

