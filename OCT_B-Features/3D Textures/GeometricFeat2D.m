function [ S,P,D,Irr,Kiso,Sph ] = GeometricFeat2D(J)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Square,Perimeter,Diameter+Shape Features as Sphericity(relation Square to Square of Circle wih Diameter,Irregularity-STD of tumor surface)
%from surface of sphere
% I= imread('C:\Users\User\Desktop\Наука\Science now-now\070213\nonpig mel\front\3ddd.tif',20);
% bn = mean(mean(I(30:50,:)));
% Ib = I - bn;
% I = Ib;
% J=im2double(I);
% imshow(J);

%J = Func_FzdII(J,15,0.25,2);
%Rt=MRF_Func_Rois(J);

level = graythresh(J);% method Otsu of thresholding
J = im2bw(J,level);
figure;
imshow(J);
S=bwarea(J);
P=bwperim(J);
P=bwarea(P);
[a,b]=size(J);
 D=sqrt(a^2+b^2);
Irr=P/(pi*D);%Coefficient of irregularity shows us irregularity of borders.Unnormed.If K is more, than probability of malignant tumor is more.
Kiso=sqrt(2)*min(a,b)/D;%Coefficient of isotropy shows us growth of tumor in different directions.Normed.If K is 1,then we probably
%(not in all cases!!!) have a good story.
Sph=S/(pi*D^2/4);%Indirect estimation of sphericity for tumor.Unnormed.
end

