%Coarseness
%   Textural Features Corresponding to
%Visual Perception Tamura part of algorithm for evaluating coarseness
%%1 step
s=0;
for i=x-2^(k-1):x+2^(k-1)-1
    for j=y-2^(k-1):y+2^(k-1)-1
Ak(x,y)= s+f(i,j)/(2^(2*k));
    end
end
%%2 step
%need other directions
Ekh(x,y)=abs(Ak(x+2^(k-1),y)-Ak(x-2^k-1,y));
%%3 step
Sbest(x,y)=2^k;
Ek=Emax=max(E1,E2,..,EL);

s=0;
for i=1:M
    for j=1:N
Fcrs=s+1/(m*n)*Sbest(i,j);
    end
end

%%Directionality
n=16;
t=12;

deltaH=[-1 0 1;-1 0 1;-1 0 1];
deltaV=[1 1 1;0 0 0;-1 -1 -1];
a=abs(conv2(deltaH,I));
b=abs(conv2(deltaV,I));
det(deltaG)=(a+b)/2;
theta=atan(b/a)+pi/2;

s=0;
for i=1:n-1
 s=s+Ntheta(i);
end

for k=1:n-1
HD(k)=Ntheta(k)/s;
end;

(2*k-1)*pi/(2*n)<=theta<(2*k+1)*pi/(2*n);
abs(deltaG)>t;

s=0;
for i=1:n-1
 s=s+Ntheta(i);
end

Fair=1-r*np* 

Nsum=0;
Nteta =zeros(1,n-1);
for k=0:n-1% trouble!!!
    Nteta(k)=0;
    for i=1:m
        for j=1:n
            if ((2*k-1)*pi/(2*n)<=theta<(2*k+1)*pi/(2*n))
              if (deltaG(i,j)>=t)
                Nteta(k)=Nteta(k)+1;  
              end
            end
        end
    end
    Nsum=Nsum+Nteta(k);
end

HD =zeros(1,n-1);
for k=0:n-1%trouble!!!
    HD(k)=Nteta(k)/Nsum;
end
