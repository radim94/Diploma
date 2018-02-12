% TO CALCULATE FRACTAL DIMENSION OF 2D IMAGE BY USING 2D POWER SPECTRUM METHOD
% WEI GAO, NINGBO UNIVERSITY OF TECHNOLOGY, NINGBO, CHINA
% 02/10/2016
% REF: FRACTAL DESCRIPTORS IN THE FOURIER DOMAIN APPLIED TO COLOR TEXTURE ANALYSIS

function [FD] = Func_PS2D(I0)

% I0 - original image matrix

Num_Rad = 40; % number of points that the radius is uniformally divided
Num_Beg = 10; % 10 is a suitable number
Num_End = Num_Rad; % Num_End is less than (or equal to) Num_Rad

[M N] = size(I0);

Xc = 1+bitshift(N,-1); % the center point in x direction
Yc = 1+bitshift(M,-1); % the center point in y direction

IMean = mean(I0(:));
FI = fftshift(fft2(double(I0)-IMean));

% power spectrum
Mag = log(FI.*conj(FI)+10^(-6));
radius = zeros(Num_Rad,1); % accumulation magnitude for all directions 
radCount = zeros(Num_Rad,1); % number of magintude for all directions

% accumulation of magnitude for each radius
rmax = log(sqrt(2)*min(M,N)/2);% maximum radius
for j = 1:M
    if (j ~= Yc)
        Yv = Yc-j;
        Y2 = Yv*Yv;
        for i = 1:N
            if (i ~= Xc)
                Xv = i-Xc;
                rho = log(sqrt(Y2+Xv*Xv));
                if (rho>0 && rho<=rmax)
                    Mv = Mag(j,i);
                    k = floor(Num_Rad*rho/rmax);
                    if (k > Num_Rad-1)
                        k = Num_Rad-1;
                    end
                    if (k >= Num_Beg)                      
                        radius(k+1) = radius(k+1)+Mv;
                        radCount(k+1) = radCount(k+1)+1;
                    end
                end
            end
        end
    end
end

% compute average slope over all directions and scales
sumn = 0;
for k = (Num_Beg+1):Num_End  
    if (radCount(k) > 0)
        sumn = sumn+1;
        Y(sumn) = radius(k)/radCount(k);
        T(sumn) = (k-1)*rmax/Num_Rad;
    end
end
p = polyfit(T,Y,1);
averslope = p(1);
FD = (averslope+8)/2;

% fitln = polyval(p,T);
% figure; plot(T,Y,'bo-',T,fitln,'r-');
% title('Magn. vs Freq.');
% ylabel('Log Magnitude');
% xlabel('Log Frequency');

end