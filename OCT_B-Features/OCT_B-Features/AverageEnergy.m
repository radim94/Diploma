function [ s ] = AverageEnergy( x )
%������������ ���������� ���������
%��� ����������� ����������� ������� ����� �� ������������� ������������
%�������
%   TO EVALUATE AVERAGE ENERGY
[m,n]=size(x);
d=0;
for i=1:m
    for j=1:n
        d=d+x(i,j)^2;
    end
end
s=d/(m*n);

end

