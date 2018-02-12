deg=-(((t1-t10)^2)/(2*sigma1^2)+((t2-t20)^2)/(2*sigma2^2))+1i*(w1*t1+w2*t2);
G(t1,t2,t10,t20,w10,w20)=exp(deg);
a(t10,t20,w10,w20)= x0(t1,t2)*G(t1,t2,t10,t20,w10,w20);
deg1=-1/2*((sigma1^2)*((w1-w10)^2)+(sigma2^2)*((w2-w20)^2));
deg2=-1i*((w1-w10)*t10+(w2-w20)*t20);
Gi(w1,w2,t1,t2,t10,t20,w10,w20,sigma1,sigma2)= 2*pi*sigma1*sigma2* exp(deg1)*exp(deg2);
a(t1,t2,w10,w20)= xi(t1,t2)*Gi(t1,t2,t10,t20,w10,w20);

xj=zeros(M,N);
for n1=1:M
    for n2=1:N
    if((1<=(n1+n10)<=M)&&(1<=(n2+n20)<=N))
xj(n1,n2)=x(n1+n10,n2+n20);
    else xj(n1,n2)=0;
    end
    end
end


deg3=-(((m1-m10(k))^2)/(2*sigma1(k)^2)+((m2-m20(k))^2)/(2*sigma2(k)^2));
Wk(M1,M2)=exp(deg3);

yk(m1,m2)=xi(m1,m2)*(Wk(M1,M2)+W_k(M1,M2));
s=0;
for m1=-((Mi-1)/2):((Mi-1)/2)
    for m2=-((Ni-1)/2):((Ni-1)/2)
      gk=s+1/(Mi*Ni)*yk(m1,m2)*yik(m1,m2)  
    end
end
