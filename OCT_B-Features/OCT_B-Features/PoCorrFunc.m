function [ s ] = PoCorrFunc( x,m,n )
%ÈÑÑËÅÄÎÂÀÍÈÅ ÒÅÊÑÒÓĞÍÛÕ ÏĞÈÇÍÀÊÎÂ
%ÄËß ÄÈÀÃÍÎÑÒÈÊÈ ÇÀÁÎËÅÂÀÍÈÉ ÊÎÑÒÍÎÉ ÒÊÀÍÈ ÏÎ ĞÅÍÒÃÅÍÎÂÑÊÈÌ ÈÇÎÁĞÀÆÅÍÈßÌ
%ÃÀÉÄÅËÜ
%   TO EVALUATE POINTS OF NORMALIZED CORRELATION FUNCTION

[M1,M2]=size(x);
d=0;
b=0;
for i=1:M1
    for j=1:M2
        
        if((M1+1>i+m>0)&&(M2+1>j+n>0))
        d=d+x(i,j)*x(i+m,j+n);
        b=b+x(i,j)^2;
        end
    
    end
end
s=d/b;

end

