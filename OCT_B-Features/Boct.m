% CALCULATE THE FRACTAL DIMENSION (FD) USING THE BOX COUNTING METHOD
% WEI GAO, BASCOM PALMER EYE INSTITUTE, UNIVERSITY OF MIAMI
% LAST MODIFIED DATE: 06/02/2010

function [FD,SD] = Boct(I0,varargin)

% INPUT
%   I0  -  matrix of intensity of rois
%   G   -  gray level for the intensity image (varargin);

% OUTPUT
%   FD  -  fractal dimension
%   SD  -  derivation of fractal dimension

%--------------------------------------------------------------------------
%  input

I = I0 - min(min(I0))+1; % make sure intensity value is greater than 0;


if (nargin == 1)
    G = max(max(I));
%     G = 2^16; % gray level+1
elseif (nargin ==2)
    G = varargin{1}; % could be the maximum intensity value
else
    error('Please check the input for function Cov!');
end
[r c] = size(I);

%--------------------------------------------------------------------------
%  define the box size X & Y

% r1 = 2^ceil(log2(r));
% g1 = 2^ceil(log2(G));

r1 = r; g1 = ceil(G-min(min(I0))+1);

%--------------------------------------------------------------------------
%  calculate the FD for each A-scan within ROI

tem = zeros(1,c);
for k = 1:c
    V = round(I(:,k)); % each A-scan within the selected ROI
    M = zeros(r1,g1);
    for i = 1:length(V)
        M(i,V(i)) = 1;
    end
    
    tb = zeros(r1,2);
    for nB = 1:r1
        sx = floor(r1/nB);
        sy = floor(g1/nB);
        fg = zeros(nB,nB);
        for ik = 1:nB
            for jk = 1:nB
                xs = (ik-1)*sx+1;
                xe = ik*sx;
                ys = (jk-1)*sy+1;
                ye = jk*sy;
                bl = M(xs:xe,ys:ye);
                fg(ik,jk) = any(bl(:));
            end
        end
        bc = nnz(fg);
        tb(nB,1) = nB; % numBlocks
        tb(nB,2) = bc; % boxCount
    end
    
    
    
    x = tb(:,1); y = tb(:,2);
    p1  = polyfit(x,y,1);
    p2 = polyval(p1,x);

%     figure; hold on; grid on;
%     plot(x,y,'ko','LineWidth',1)
%     plot(x,p2,'k-','LineWidth',2)
%     xlabel('Number of blocks, N','FontSize',12)
%     ylabel('Box Count, N(s)','FontSize',12)

    % calculate Hausdorff Dimension
    x2 = log(x); y2 = log(y);
    p3 = polyfit(x2,y2,1);
    p4 = polyval(p3,x2);

%     figure; hold on; grid on;
%     plot(x2,y2,'bo','LineWidth',1)
%     plot(x2,p4,'b-','LineWidth',2)
%     xlabel('Number of blocks, log N','FontSize',12)
%     ylabel('Box Count, log N(s)'    ,'FontSize',12)

    HD = p3(:,1);
    tem(k) = 2- HD;
end

FD = mean(tem);
SD = std(tem);

end