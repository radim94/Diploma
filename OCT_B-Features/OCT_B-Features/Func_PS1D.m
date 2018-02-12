% TO CALCULATE FRACTAL DIMENSION OF 1D IMAGE BY USING 1D POWER SPECTRUM METHOD
% WEI GAO, NINGBO UNIVERSITY OF TECHNOLOGY, NINGBO, CHINA
% 08/13/2016
% REF: FRACTAL DESCRIPTORS IN THE FOURIER DOMAIN APPLIED TO COLOR TEXTURE ANALYSIS

function [FD] = Func_PS1D(Im)

% I0 - original image matrix

Num_Rad = 40; % number of points that the radius is uniformally divided
Num_Beg = 10; % 10 is a suitable number
Num_End = Num_Rad; % Num_End is less than (or equal to) Num_Rad

if (size(Im,1) ~= 1)
    Im = Im';
end

M = length(Im);

Yc = 1+bitshift(M,-1); % the center point in y direction

IMean = mean(Im);
FI = fftshift(fft(double(Im)-IMean));

% power spectrum
Mag = log(FI.*conj(FI)+10^(-6));
radius = zeros(Num_Rad,1); % accumulation magnitude for all directions 
radCount = zeros(Num_Rad,1); % number of magintude for all directions

% accumulation of magnitude for each radius
rmax = log(M/2);% maximum radius

for j = 1:M
    if (j ~= Yc)
        Yv = Yc-j;
        Y2 = Yv*Yv;
        
        rho = log(sqrt(Y2));
        if (rho>0 && rho<=rmax)
            Mv = Mag(1,j);
            k = floor(Num_Rad*rho/rmax);
            if (k>Num_Rad-1)
                k = Num_Rad-1;
            end
            if (k>=Num_Beg)
                radius(k+1) = radius(k+1)+Mv;
                radCount(k+1) = radCount(k+1)+1;
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
FD = (averslope+5)/2;

% fitln = polyval(p,T);
% figure; plot(T,Y,'bo-',T,fitln,'r-');
% title('Magn. vs Freq.');
% ylabel('Log Magnitude');
% xlabel('Log Frequency');

end