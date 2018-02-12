% TO SELECT THE REGION OF INTEREST
% WEI GAO, NINGBO UNIVERSITY OF TECHNOLOGY, NINGBO, CHINA
% 02/13/2016

function [R] = Func_Rois2(I,Px,Py,Sx,Sy)

% INPUT
%   I       -  oct image matrix

% OUTPUT
%   R       -  region of interest

%--------------------------------------------------------------------------
%  define the region of interest

figure;imagesc(I);colormap(gray(256));hold on;

%---------------------------------------------------------------------------
%  backgroun region

% R = cell(1,9);
% R = cell(1,1);

row1 = Py;
row2 = Py+Sy;
col1 = Px;
col2 = Px+Sx;

% row1 = 130; row2 = 180; col1 = 50; col2 = 150; % 010231_Mel Scan000
% row1 = 300; row2 = 350; col1 = 20; col2 = 100; % 010231_Mel Scan025
% row1 = 300; row2 = 350; col1 = 150; col2 = 350; % 010231_Mel Scan050
% row1 = 300; row2 = 350; col1 = 150; col2 = 350; % 010231_Mel Scan075
% row1 = 300; row2 = 350; col1 = 150; col2 = 350; % 010231_Mel Scan100
% row1 = 300; row2 = 350; col1 = 150; col2 = 350; % 010231_Mel Scan125
% row1 = 300; row2 = 350; col1 = 50; col2 = 150; % 010231_Mel Scan150
% row1 = 260; row2 = 310; col1 = 150; col2 = 350; % 010231_Mel Scan175
% row1 = 200; row2 = 275; col1 = 175; col2 = 275; % 010231_Mel Scan200
% row1 = 180; row2 = 230; col1 = 175; col2 = 275; % 010231_Mel Scan225
% row1 = 165; row2 = 215; col1 = 80; col2 = 220; % 010231_Mel Scan250
% row1 = 165; row2 = 215; col1 = 80; col2 = 220; % 010231_Mel Scan275
% row1 = 135; row2 = 192; col1 = 50; col2 = 200; % 010231_Mel Scan300
% row1 = 135; row2 = 192; col1 = 50; col2 = 200; % 010231_Mel Scan325
% row1 = 100; row2 = 190; col1 = 40; col2 = 160; % 010231_Mel Scan350
% row1 = 100; row2 = 190; col1 = 40; col2 = 160; % 010231_Mel Scan375
% row1 = 130; row2 = 190; col1 = 60; col2 = 180; % 010231_Mel Scan400
% row1 = 130; row2 = 190; col1 = 60; col2 = 180; % 010231_Mel Scan425
% row1 = 140; row2 = 200; col1 = 52; col2 = 170; % 010231_Mel Scan450
% row1 = 140; row2 = 200; col1 = 52; col2 = 170; % 010231_Mel Scan475


% row1 = 300; row2 = 338; col1 = 70; col2 = 220; % 070231_Nevi Scan000
% row1 = 200; row2 = 250; col1 = 250; col2 = 320; % 070231_Nevi Scan025
% row1 = 163; row2 = 208; col1 = 30; col2 = 165; % 070231_Nevi Scan050
% row1 = 163; row2 = 208; col1 = 30; col2 = 135; % 070231_Nevi Scan075
% row1 = 185; row2 = 230; col1 = 18; col2 = 120; % 070231_Nevi Scan100
% row1 = 185; row2 = 230; col1 = 18; col2 = 120; % 070231_Nevi Scan125
% row1 = 175; row2 = 215; col1 = 18; col2 = 125; % 070231_Nevi Scan150
% row1 = 175; row2 = 215; col1 = 18; col2 = 125; % 070231_Nevi Scan175
% row1 = 173; row2 = 215; col1 = 20; col2 = 148; % 070231_Nevi Scan200
% row1 = 173; row2 = 215; col1 = 20; col2 = 148; % 070231_Nevi Scan225
% row1 = 173; row2 = 215; col1 = 20; col2 = 170; % 070231_Nevi Scan250
% row1 = 173; row2 = 215; col1 = 20; col2 = 170; % 070231_Nevi Scan275
% row1 = 139; row2 = 191; col1 = 18; col2 = 170; % 070231_Nevi Scan300
% row1 = 139; row2 = 191; col1 = 18; col2 = 170; % 070231_Nevi Scan325
% row1 = 152; row2 = 204; col1 = 25; col2 = 200; % 070231_Nevi Scan350
% row1 = 152; row2 = 204; col1 = 25; col2 = 200; % 070231_Nevi Scan375
% row1 = 178; row2 = 216; col1 = 25; col2 = 200; % 070231_Nevi Scan400
% row1 = 178; row2 = 216; col1 = 20; col2 = 175; % 070231_Nevi Scan425
% row1 = 377; row2 = 418; col1 = 320; col2 = 490; % 070231_Nevi Scan450
% row1 = 377; row2 = 418; col1 = 320; col2 = 490; % 070231_Nevi Scan475

% row1 = 295; row2 = 345; col1 = 90; col2 = 340; % 150113_Basal Scan000
% row1 = 295; row2 = 345; col1 = 90; col2 = 340; % 150113_Basal Scan025
% row1 = 250; row2 = 300; col1 = 20; col2 = 160; % 150113_Basal Scan050
% row1 = 250; row2 = 300; col1 = 20; col2 = 160; % 150113_Basal Scan075
% row1 = 235; row2 = 285; col1 = 30; col2 = 220; % 150113_Basal Scan100
% row1 = 235; row2 = 285; col1 = 30; col2 = 220; % 150113_Basal Scan125
% row1 = 205; row2 = 248; col1 = 20; col2 = 160; % 150113_Basal Scan150
% row1 = 205; row2 = 248; col1 = 20; col2 = 160; % 150113_Basal Scan175
% row1 = 260; row2 = 305; col1 = 250; col2 = 390; % 150113_Basal Scan200
% row1 = 260; row2 = 305; col1 = 250; col2 = 390; % 150113_Basal Scan225
% row1 = 258; row2 = 308; col1 = 300; col2 = 480; % 150113_Basal Scan250
% row1 = 258; row2 = 308; col1 = 300; col2 = 480; % 150113_Basal Scan275
% row1 = 153; row2 = 192; col1 = 25; col2 = 175; % 150113_Basal Scan300
% row1 = 153; row2 = 192; col1 = 25; col2 = 175; % 150113_Basal Scan325
% row1 = 130; row2 = 175; col1 = 25; col2 = 205; % 150113_Basal Scan350
% row1 = 130; row2 = 175; col1 = 25; col2 = 205; % 150113_Basal Scan375
% row1 = 85; row2 = 141; col1 = 20; col2 = 210; % 150113_Basal Scan400
% row1 = 85; row2 = 141; col1 = 20; col2 = 210; % 150113_Basal Scan425
% row1 = 82; row2 = 128; col1 = 40; col2 = 260; % 150113_Basal Scan450
% row1 = 82; row2 = 128; col1 = 40; col2 = 260; % 150113_Basal Scan475


R = I(row1:row2,col1:col2); % reference region (background)
x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');

%---------------------------------------------------------------------------
%  homogenous regions

% row1 = 110;
% row2 = 120;
% col1 = 60;
% col2 = 80;
% R{2} = I(row1:row2,col1:col2);
% x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');
% 
% row1 = 180;
% row2 = 200;
% col1 = 164;
% col2 = 184;
% R{3} = I(row1:row2,col1:col2);
% x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');
% 
% row1 = 230;
% row2 = 240;
% col1 = 260;
% col2 = 280;
% R{4} = I(row1:row2,col1:col2);
% x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');
% 
% %---------------------------------------------------------------------------
% %  nonhomogenous regions
% 
% row1 = 130;
% row2 = 160;
% col1 = 10;
% col2 = 40;
% R{5} = I(row1:row2,col1:col2);
% x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');
% 
% row1 = 280;
% row2 = 320;
% col1 = 420;
% col2 = 450;
% R{6} = I(row1:row2,col1:col2);
% x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');
% 
% row1 = 200;
% row2 = 210;
% col1 = 212;
% col2 = 226;
% R{7} = I(row1:row2,col1:col2);
% x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');
% 
% row1 = 280;
% row2 = 300;
% col1 = 260;
% col2 = 290;
% R{8} = I(row1:row2,col1:col2);
% x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');
% 
% row1 = 270;
% row2 = 315;
% col1 = 355;
% col2 = 400;
% R{9} = I(row1:row2,col1:col2);
% x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');

%--------------------------------------------------------------------------

hold off;

end