function [  ] = Fourier(  )
%FOURIER Summary of this function goes here
%   Detailed explanation goes here
% ������ ������������� ���������
% ������ � �������� �������������� �����.,
% ������������ ��������� �����������,
[x, y]=meshgrid(1:32);
I=sin(2*pi*x/8)+sin(2*pi*y/16);
% ����� ��������� ����������� �� �����.
imshow(mat2gray(I));
% ����� ��������� ����������� � ���� 3D-�����������.
figure, mesh(x,y, I);
% ������ �������������� �����.
h=fft2(l);
% ����� �� ����� ������� ��������� �����������.
figure, mesh(x,y, abs(h));
% ��������� ����� �������.
h(1:32,1:2)=0;
% ����� �� ����� ������������� �������.
figure, mesh(x,y, abs(h));
% �������� �������������� �����.
I=iffi2(abs(h));
% ����� �� ����� ��������������� �����������.
figure, imshow(mat2gray(abs(I)));
% ����� �� ����� ��������������� ����������� � ���� 3D-�����������.
figure, mesh(x, y, abs(I));



end

