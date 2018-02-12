function [Id2] = Func_Complexdiff(I,N,k,theta,dt)

% this function is to calculate the complex scattering coefficient
% complexdiff=complexdiff(I,50,10,pi/30,0.2,0.5)
% complexdiff=complexdiff(I,50,10,pi/30,0.24,1)
% complex Diffusion Filter

% K    edge threshold parameter
% N    number of iterations
% dt   time increment (0 < dt <= 0.25, default 0.2)
% sigma2 - if present, calculates gradients of diffusion coefficient
%          convolved with gaussian of var sigma2 

[rows,cols] = size(I);
j = sqrt(-1);
Id2 = double(I);

for i = 1:N
    
    Id1 = Id2;
    % calculating gradient in all directions (N,S,E,W)
    In = [Id1(1,:);Id1(1:rows-1,:)]-Id1;
    Is = [Id1(2:rows,:);Id1(rows,:)]-Id1;
    Ie = [Id1(:,2:cols) Id1(:,cols)]-Id1;
    Iw = [Id1(:,1) Id1(:,1:cols-1)]-Id1;
    
    % calculating diffusion coefficients in all directions
    Cn = exp(j*theta)./(1+(imag(In)/(k*theta)).^2);
    Cs = exp(j*theta)./(1+(imag(Is)/(k*theta)).^2);
    Ce = exp(j*theta)./(1+(imag(Ie)/(k*theta)).^2);
    Cw = exp(j*theta)./(1+(imag(Iw)/(k*theta)).^2);
	
    Id2 = Id1+dt*(Cn.*In+Cs.*Is+Ce.*Ie+Cw.*Iw);

end

end