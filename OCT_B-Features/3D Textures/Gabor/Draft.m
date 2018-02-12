Gabor Features
G=zeros(m,n);

for t1=1:m
    for t2=1:n
deg=-((t1-t10)^2/(2*sigma1^2)+(t2-t20)^2/(2*sigma2^2))+1i*(w10*t1+w20*t2);% only half of spectrum
G(t1,t2)=exp(deg);
    end
end
a=0;

for t1=1:m
    for t2=1:n
    a=a+ x0(t1,t2)*G(t1,t2);    
    end
    
end

for t1=1:m
    for t2=1:n
deg1=-0.5*(sigma1^2*(w1-w10)^2+sigma2^2*(w2-w20)^2);
deg2=-1i*((w1-w10)*t1+(w2-w20)*t2);
Gs=2*pi*sigma1*sigma2*exp(deg1)*exp(deg2);% only half of spectrum
    end
end

xs0=fft2(x0);

for t1=1:m
    for t2=1:n
    a=a+ xs0(t1,t2)*Gs(t1,t2);    
    end  
end

[m,n]=size(x);
s=max(m,n);
v=ceil(log2(s));
v=2^v;
X=zeros(v,v);

for i=1:m
    for j=1:n
    X(i,j)=x(i,j);    
    end
end

Wk=zeros(v,v);
for m1=1:v
    for m2=1:v
deg=-(((m1-m10(k))^2/(2*sigma1(k)^2))+((m2-m20(k))^2/(2*sigma2(k)^2)));
Wk(m1,m2)=exp(deg);
    end
end

ysk=zeros(v,v);
for m1=1:v
    for m2=1:v
ysk(m1,m2)=xs(m1,m2)*(Wk(m1,m2)+Wsk(m1,m2));
    end
end

gk=0;
yssk=conj(ysk);
for m1=1:v
    for m2=1:v
gk=gk+1/(M*N)*ysk(m1,m2)*yssk(m1,m2);
    end
end




