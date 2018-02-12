function [ J ] = Smooth( I,L )
%UNTITLED Summary of this function goes here
%   Linear smoothing in square window with size (2L+1)*(2L+1)
[X,Y]=size(I);
J=I;
for x=1:X
    for y=1:Y
        sum=0;
        for i=-L:L
            for j=-L:L
                if(x+i<=X)&&(y+j<=Y)&&(x+i>0)&&(y+j>0)
                sum= I(x+i,y+j)+sum;
                end
            end
        end
        sum=sum/((2*L+1)*(2*L+1));
        J(x,y)=sum;
    end
end


end

