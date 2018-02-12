function [ fi,w ] = Local_Grad_Meth_CDF( I,M )
[X,Y]=size(I);
fi=I;
w=I;
for x=1:X
    for y=1:Y

qx=0;
qy=0;


for m=-M:M
    for n=-M:M
        
        if (x+m>1)&&(x+m+1<X)&&(y+n>1)&&(y+n+1<Y)
qmnx=(I(x+m+1,n+y+1)-I(x+m,y+n+1)+I(x+m+1,y+n)-I(x+m,y+n))/2;%2*2 mask
qmny=(I(x+m+1,n+y+1)+I(x+m,y+n+1)-I(x+m+1,y+n)-I(x+m,y+n))/2;        
 qx=qmnx/(2*M+1)^2+qx;
 qy=qmny/(2*M+1)^2+qy;
        end
        
    end
end
fi(x,y)=-atan(qx/qy);
if(fi(x,y)<0)
 fi(x,y)=pi+fi(x,y);   
end
if (isnan(fi(x,y)))
    fi(x,y)=0;
end
w(x,y)=sqrt(qx^2+qy^2);
    end
end

end

