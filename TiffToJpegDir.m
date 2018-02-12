function [  ] = TiffToJpegDir(  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
files=dir('D:\OCTImageProcessing\OCTdeepLearning\SetDNN\HTAdd');
[r,m]=size(files);
%path='D:\OCTImageProcessing\OCTdeepLearning\SetDNN\BCC\B.tif';
%a=imfinfo('D:\OCTImageProcessing\OCTdeepLearning\SetDNN\BCC\B.tif');
%[m,r]=size(a);
k=1;
for j=3:r
    path= strcat('D:\OCTImageProcessing\OCTdeepLearning\SetDNN\HTAdd\',files(j,1).name)
    a=imfinfo(path);
    [m,n]=size(a);
for i=1:m
I=imread(path,i);
imwrite(I,strcat('D:\OCTImageProcessing\OCTdeepLearning\SetDNNCopy\HTAdd\image',num2str(k),'.tif'));
k=k+1;
end
end
end

