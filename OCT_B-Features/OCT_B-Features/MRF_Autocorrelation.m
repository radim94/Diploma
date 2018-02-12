function [ Rh,Rv,Rld,Rrd ] = MRF_Autocorrelation( R )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

if (iscell(R))
    
        I = R{1};
      
else
    
    I = R;
    
end

[M,N]=size(I);%I-image , we suggest image with markov random field
Rh=nan(M,N);%Matrixes of autocorrelation estimations: Rh- R horizontal
Rv=nan(M,N);%Rv- R vertical
Rld=nan(M,N);% Rld- R left diagonal(from left top corner of matrix to right bottom corner)
Rrd=nan(M,N); %Rrd- R right diagonal( other diagonal)
for x=2:M-1
for y=2:N-1

        Rv(x,y)=I(x,y).*(I(x+1,y)+I(x-1,y));
        Rh(x,y)=I(x,y).*(I(x,y+1)+I(x,y-1));
        Rld(x,y)=I(x,y).*(I(x+1,y+1)+I(x-1,y-1));
        Rrd(x,y)=I(x,y).*(I(x-1,y+1)+I(x+1,y-1));
  
end
end

        Rh(1,2:N-1)=I(1,2:N-1).*(I(1,3:N)+I(1,1:N-2));
        Rh(M,2:N-1)=I(M,2:N-1).*(I(M,3:N)+I(M,1:N-2));
        Rh(1:M,1)=I(1:M,1).*I(1:M,2);
        Rh(1:M,N)=I(1:M,N).*I(1:M,N-1);
        
        Rv(2:M-1,1)=I(2:M-1,1).*(I(3:M,1)+I(1:M-2,1));
        Rv(2:M-1,N)=I(2:M-1,N).*(I(3:M,N)+I(1:M-2,N));
        Rv(1,1:N)=I(1,1:N).*I(2,1:N);
        Rv(M,1:N)=I(M,1:N).*I(M-1,1:N);
        
        Rld(1,1:N-1)=I(1,1:N-1).*I(2,2:N);
        Rld(1,N)=0;
        Rld(2:M-1,1)=I(2:M-1,1).*I(3:M,2);
        Rld(M,1)=0;
        Rld(M,2:N)=I(M,2:N).*I(M-1,1:N-1);
        Rld(2:M-1,N)=I(2:M-1,N).*I(1:M-2,N-1);
        
        Rrd(1,1)=0;
        Rrd(1,2:N)=I(1,2:N).*I(2,1:N-1);
        Rrd(2:M,1)=I(2:M,1).*I(1:M-1,2);
        Rrd(M,1:N-1)=I(M,1:N-1).*I(M-1,2:N);
        Rrd(M,N)=0;
        Rrd(2:M-1,N)=I(2:M-1,N).*I(3:M,N-1);

end

