function [ Wk ] = GausWind2( m,m10k,m20k,sigma1k,sigma2k)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
Wk=zeros(m,m);
Wk(:,:)=1;
for m1=m10k-sigma1k+1:m10k+sigma1k
    for m2=m20k-sigma2k+1:m20k+sigma2k
deg1= (m1-m10k)^2/(2*sigma1k^2);
deg2=(m2-m20k)^2/(2*sigma2k^2);
Wk(m1,m2)=exp(-(deg1+deg2));
    end
end

end

