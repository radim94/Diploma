% USE TYPE II FUZZY ANISOTROPIC DIFFUSION ALGORITHM TO DENOISEIMAGE

% PAPER: INTERVAL TYPE-II FUZZY ANISOTROPIC DIFFUSION ALGORITHM FOR SPECKLE
% NOISE REDUCTION IN OPTICAL COHERENCE TOMOGRAPHY IMAGES 2009

% WEI GAO, BASCOM PALMER EYE INSTITUTE, UNIVERSITY OF MIAMI, MIAMI, FL

function [Iz] = Func_FzdII(I0,Ns,dt,MF)

% INPUT
%   I0  -  orginal oct image matrix
%   Ns  -  number of iterations
%   dt  -  time interval
%   MF  -  choice of membership function

% OUTPUT
%   Iz  -  denoised oct image matrix

%--------------------------------------------------------------------------
%  obtain the gaussian kernel matrix

if (nargin == 3)
    MF = 1; % default value for MF
end

format long;

N = 3; % size of gaussian kernel matrix
S = 1; % default variance of gaussian function
% S = 0.84089642;
% S = sqrt(2*dt)^0.5;

Gs = zeros(N,N);
for i = 1:N
    for j = 1:N
        x = i-(N+1)/2;
        y = j-(N+1)/2;
        Gs(i,j) = 1/2/pi/S^2*exp(-(x^2+y^2)/2/S^2);
    end
end

%--------------------------------------------------------------------------
%  first difference operators

[r c] = size(I0);
dx = [-1 0 1; -1 0 1; -1 0 1];
dy = [1 1 1; 0 0 0; -1 -1 -1];

%--------------------------------------------------------------------------
%  obtain the lower & upper threshold value

PL = 0.85; % define by user
PU = 0.95;
% [KL,KU] = Kv(I0,Gs,PL,PU);

%--------------------------------------------------------------------------
%  denoise the image

I2 = I0;
for k = 1:Ns
    
    [KL,KU] = Func_Kv(I2,Gs,PL,PU);
    disp(['Number of iteration is: ', num2str(k)]);
    
    %----------------------------------------------------------------------
    %  variable of function g

    Igs = conv2(I2,Gs,'same');
    Idx = conv2(Igs,dx,'same');
    Idy = conv2(Igs,dy,'same');

    Ixy = sqrt((abs(Idx)).^2+(abs(Idy)).^2);
    Im = medfilt2(Ixy);

    %----------------------------------------------------------------------
    %  edginess & noisiness measure

    IE = conv2(Im,Gs,'same');

    N = 3 ; % define the range of local pixels (2k+1 by 2k+1 square)
    IN = zeros(size(I2));
    
%     for i = 1:r
%         for j = 1:c
%             maxi = max(i-N,1);
%             maxj = max(j-N,1);
%             mini = min(i+N,r);
%             minj = min(j+N,c);
%             A = I2(maxi:mini,maxj:minj);
%             IN(i,j) = abs(I2(i,j)-1/(numel(A)-1)*(sum(sum(A))-I2(i,j))); % average 
%         end
%     end

    for i = 1:r;
        j = 1:c;
        IN(i,j) = abs(I2(i,j)-(sum(sum(I2(max(i-N,1):min(i+N,r),max(j-N,1):min(j+N,c))))-I2(i,j))/(numel(I2(max(i-N,1):min(i+N,r),max(j-N,1):min(j+N,c)))-1));    
    end;
             
    IE = IE/max(max(IE)); % edginess measure
    IN = IN/max(max(IN)); % noisiness measure

    %----------------------------------------------------------------------
    %
    
    %  apply the membership function to obtain anisotropic diffusion coe.
    
    switch MF % explain in the doc file
        case 1
            L1 = 1./(1+IE.^2/KL.^2);
            U1 = 1./(1+IE.^2/KU.^2);
            L2 = 1-L1;
            U2 = 1-U1;
%             L2 = 1-1./(1+IN.^2/KL.^2);
%             U2 = 1-1./(1+IN.^2/KU.^2);
        case 2
            L1 = (1./(1+IE.^2/KL.^2)).^2;
            U1 = (1./(1+IE.^2/KL.^2)).^0.5;
%             L2 = (1-L1).^2;
%             U2 = (1-U1).^0.5;
            L2 = (1-1./(1+IN.^2/KL.^2)).^2;
            U2 = (1-1./(1+IN.^2/KU.^2)).^0.5;
        case 3
            L1 = (1./(1+IE.^2/KL.^2)).^1.5;
            U1 = (1./(1+IE.^2/KL.^2)).^0.75;           
%             L2 = (1-L1).^1.5;
%             U2 = (1-U1).^0.75;
            L2 = (1-1./(1+IN.^2/KL.^2)).^1.5;
            U2 = (1-1./(1+IN.^2/KU.^2)).^0.75;
        case 4
            L1 = exp(-(IE/KL).^2);
            U1 = exp(-(IE/KU).^2);
%             L2 = 1-L1;
%             U2 = 1-U1;
            L2 = 1-exp(-(IN/KL).^2);
            U2 = 1-exp(-(IN/KU).^2);
        case 5
            L1 = (exp(-(IE/KL).^2)).^2;
            U1 = (exp(-(IE/KL).^2)).^0.5;
%             L2 = (1-L1).^2;
%             U2 = (1-U1).^0.5;
            L2 = (1-exp(-(IN/KL).^2)).^2;
            U2 = (1-exp(-(IN/KL).^2)).^0.5;
        case 6
            L1 = (exp(-(IE/KL).^2)).^1.5;
            U1 = (exp(-(IE/KL).^2)).^0.75;
%             L2 = (1-L1).^1.5;
%             U2 = (1-U1).^0.75;            
            L2 = (1-exp(-(IN/KL).^2)).^1.5;
            U2 = (1-exp(-(IN/KL).^2)).^0.75;
    end
    
  Cd = (L1.*L2+U1.*U2)/2;

	Cn = ([Cd(1,:); Cd(1:r-1,:)]+Cd)/2;
	Cs = ([Cd(2:r,:); Cd(r,:)]+Cd)/2;
	Ce = ([Cd(:,2:c) Cd(:,c)]+Cd)/2;
	Cw = ([Cd(:,1) Cd(:,1:c-1)]+Cd)/2;
    
    %----------------------------------------------------------------------
    % Calculating diffusion coefficients in all directions
	
%     Igx = [Igs(:,1) Igs(:,1:(c-1))]-2*Igs+[Igs(:,2:c) Igs(:,c)];
%     Igy = [Igs(1,:);Igs(2:r,:)]-2*Igs+[Igs(2:r,:);Igs(r,:)];
%     
%     Igs2 = zeros(r+2,c+2); Igs2(2:r+1,2:c+1) = Igs;
%     Igs2(2:r+1,1) = Igs(:,1); Igs2(2:r+1,c+2) = Igs(:,c);
%     Igs2(1,2:c+1) = Igs(1,:); Igs2(r+2,2:c+1) = Igs(r,:);
%     Igs2(1,1) = Igs(1,1); Igs2(1,c+2) = Igs(1,c);
%     Igs2(r+2,1) = Igs(r,1); Igs2(r+2,c+2) = Igs(r,c);
%     Igxy = (Igs2(1:r,1:c)+Igs2(3:r+2,3:c+2)+Igs2(1:r,3:c+2)+Igs2(3:r+2,1:c))/4;
%     
%     Ai = Igx.^2+Igy.^2+2*Igxy.^2;
%     
%     Xn = [Ixy(1,:);Ixy(1:r-1,:)].^2+Ai;
%     Xs = [Ixy(2:r,:);Ixy(r,:)].^2+Ai;
%     Xe = [Ixy(:,2:c) Ixy(:,c)].^2+Ai;
%     Xw = [Ixy(:,1) Ixy(:,1:c-1)].^2+Ai;
%     
%     Cn = 1./(1+sqrt(Xn)/KU^2);
%     Cs = 1./(1+sqrt(Xs)/KU^2);
%     Ce = 1./(1+sqrt(Xe)/KU^2);
%     Cw = 1./(1+sqrt(Xw)/KU^2);
    
    %----------------------------------------------------------------------
    % Calculating diffusion coefficients in all directions  
    
    In = [I2(1,:); I2(1:r-1,:)]-I2;
	Is = [I2(2:r,:); I2(r,:)]-I2;
	Ie = [I2(:,2:c) I2(:,c)]-I2;
    Iw = [I2(:,1) I2(:,1:c-1)]-I2;
    
    Iz = I2+dt*(Cn.*In + Cs.*Is + Ce.*Ie + Cw.*Iw);
    I2 = Iz;

%     [Smse(k),Mse(k)] = Smse2(I0,I2);
        
end

% Res = zeros(Ns-1,1);
% for i = 1:(Ns-1)
%     Res(i) = abs((Mse(i+1)-Mse(i))/Mse(i));
% end
% figure;plot(Res(end-5:end),'ro-');

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%