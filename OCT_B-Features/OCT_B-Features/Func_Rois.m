% TO SELECT THE REGION OF INTEREST
% WEI GAO

function [R] = Func_Rois(I)

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
%R = cell(1,1);

% row1 = 130; row2 = 180; col1 = 50; col2 = 150; % 010231_Mel Scan000
% row1 = 300; row2 = 350; col1 = 150; col2 = 350; % 010231_Mel Scan050
% row1 = 300; row2 = 350; col1 = 150; col2 = 350; % 010231_Mel Scan100
% row1 = 300; row2 = 350; col1 = 50; col2 = 150; % 010231_Mel Scan150
% row1 = 200; row2 = 275; col1 = 175; col2 = 275; % 010231_Mel Scan200
% row1 = 165; row2 = 215; col1 = 80; col2 = 220; % 010231_Mel Scan250
% row1 = 135; row2 = 192; col1 = 50; col2 = 200; % 010231_Mel Scan300
% row1 = 100; row2 = 190; col1 = 40; col2 = 160; % 010231_Mel Scan350
% row1 = 130; row2 = 190; col1 = 60; col2 = 180; % 010231_Mel Scan400
% row1 = 140; row2 = 200; col1 = 52; col2 = 170; % 010231_Mel Scan450

% row1 = 300; row2 = 338; col1 = 70; col2 = 220; % 070231_Nevi Scan000
% row1 = 163; row2 = 208; col1 = 30; col2 = 165; % 070231_Nevi Scan050
% row1 = 185; row2 = 230; col1 = 18; col2 = 120; % 070231_Nevi Scan100
% row1 = 175; row2 = 215; col1 = 18; col2 = 125; % 070231_Nevi Scan150
% row1 = 173; row2 = 215; col1 = 20; col2 = 148; % 070231_Nevi Scan200
% row1 = 173; row2 = 215; col1 = 20; col2 = 170; % 070231_Nevi Scan250
% row1 = 139; row2 = 191; col1 = 18; col2 = 170; % 070231_Nevi Scan300
% row1 = 152; row2 = 204; col1 = 25; col2 = 200; % 070231_Nevi Scan350
% row1 = 178; row2 = 216; col1 = 25; col2 = 200; % 070231_Nevi Scan400
% row1 = 377; row2 = 418; col1 = 320; col2 = 490; % 070231_Nevi Scan450

% row1 = 295; row2 = 345; col1 = 90; col2 = 340; % 150113_Basal Scan000
% row1 = 250; row2 = 300; col1 = 20; col2 = 160; % 150113_Basal Scan050
% row1 = 235; row2 = 285; col1 = 30; col2 = 220; % 150113_Basal Scan100
% row1 = 205; row2 = 248; col1 = 20; col2 = 160; % 150113_Basal Scan150
% row1 = 260; row2 = 305; col1 = 250; col2 = 390; % 150113_Basal Scan200
% row1 = 258; row2 = 308; col1 = 300; col2 = 480; % 150113_Basal Scan250
% row1 = 153; row2 = 192; col1 = 25; col2 = 175; % 150113_Basal Scan300
% row1 = 130; row2 = 175; col1 = 25; col2 = 205; % 150113_Basal Scan350
% row1 = 85; row2 = 141; col1 = 20; col2 = 210; % 150113_Basal Scan400
% row1 = 82; row2 = 128; col1 = 40; col2 = 260; % 150113_Basal Scan450

% row1 = 150; row2 = 200; col1 = 50; col2 = 200; % 180912_Mel_Skin1 Scan000
% row1 = 130; row2 = 170; col1 = 100; col2 = 230; % 180912_Mel_Skin1 Scan050
% row1 = 90; row2 = 140; col1 = 280; col2 = 420; % 180912_Mel_Skin1 Scan100
% row1 = 260; row2 = 310; col1 = 280; col2 = 420; % 180912_Mel_Skin1 Scan150
% row1 = 250; row2 = 300; col1 = 280; col2 = 420; % 180912_Mel_Skin1 Scan200
% row1 = 235; row2 = 285; col1 = 320; col2 = 450; % 180912_Mel_Skin1 Scan250
% row1 = 220; row2 = 275; col1 = 320; col2 = 450; % 180912_Mel_Skin1 Scan300
% row1 = 210; row2 = 260; col1 = 320; col2 = 450; % 180912_Mel_Skin1 Scan350
% row1 = 190; row2 = 240; col1 = 320; col2 = 450; % 180912_Mel_Skin1 Scan400
% row1 = 175; row2 = 225; col1 = 320; col2 = 450; % 180912_Mel_Skin1 Scan450

% row1 = 55; row2 = 105; col1 = 38; col2 = 150; % 290113_Basal2_Bas Scan000
% row1 = 180; row2 = 230; col1 = 230; col2 = 330; % 290113_Basal2_Bas Scan050
% row1 = 160; row2 = 210; col1 = 230; col2 = 330; % 290113_Basal2_Bas Scan100
% row1 = 165; row2 = 215; col1 = 170; col2 = 260; % 290113_Basal2_Bas Scan150
% row1 = 145; row2 = 190; col1 = 230; col2 = 360; % 290113_Basal2_Bas Scan200
% row1 = 160; row2 = 210; col1 = 90; col2 = 220; % 290113_Basal2_Bas Scan250
% row1 = 185; row2 = 230; col1 = 215; col2 = 345; % 290113_Basal2_Bas Scan300
% row1 = 135; row2 = 185; col1 = 130; col2 = 230; % 290113_Basal2_Bas Scan350
% row1 = 110; row2 = 155; col1 = 90; col2 = 210; % 290113_Basal2_Bas Scan400
%row1 = 100; row2 = 150; col1 = 130; col2 = 250; % 290113_Basal2_Bas Scan450
%row1 = 100; row2 = 150; col1 = 150; col2 = 270; %   3d3.tif Scan250
%row1 = 350; row2 =450 ; col1 = 150; col2 = 250; %   3d3.tif Scan200
%row1 = 350; row2 =450 ; col1 = 100; col2 = 200; %   3d3.tif Scan150
%row1 = 450; row2 =500 ; col1 = 1; col2 = 20; %   3d3.tif Scan50
%row1 = 450; row2 =500 ; col1 = 1; col2 = 20; %   3d3.tif Scan50
%row1 = 100; row2 = 150; col1 = 130; col2 = 250;% 3d1.tif Scan 1 
%row1 = 250; row2 = 300; col1 = 250; col2 = 370;% 3d1.tif Scan 50
%row1 = 250; row2 = 300; col1 = 250; col2 = 370;% 3d1.tif Scan 100 150 200
%250 300 350 400 450 500% basal frontier 500
%row1 = 100; row2 = 350; col1 = 120; col2 = 250;% basal frontier 450
%row1 = 100; row2 = 350; col1 = 180; col2 = 250;% basal frontier 400
%row1 = 45; row2 = 120; col1 = 370; col2 = 450;%  basal frontier 350
%row1 = 100; row2 = 150; col1 = 420; col2 = 530;% basal frontier 300
%row1 = 150; row2 = 300; col1 = 600; col2 = 650;% basal frontier 250 
%row1 = 10; row2 = 100; col1 = 520; col2 = 700;%basal frontier 200 150 100
%row1 = 10; row2 = 300; col1 = 600; col2 = 700;%basal frontier 50 1
%row1 = 330; row2 = 500; col1 = 100; col2 = 200;% mel 350
%row1 = 330; row2 = 500; col1 = 150; col2 = 250;% mel 400 450
%row1 = 300; row2 = 500; col1 = 30; col2 = 100;% mel 500
%row1 = 120; row2 = 300; col1 = 460; col2 = 510;% mel 300 250 200
%row1 = 170; row2 = 250; col1 = 440; col2 = 510;% mel 150 100 50
%row1 = 250; row2 = 500; col1 = 30; col2 = 100;% mel 1
%row1 = 50; row2 = 250; col1 = 340; col2 = 500;% nevi 1
%row1 = 50; row2 = 300; col1 = 100; col2 = 300;% nevi 50
%row1 = 10; row2 = 300; col1 = 100; col2 = 300;% nevi 100 
%row1 = 180; row2 = 280; col1 = 100; col2 = 300;% nevi 150 
%row1 = 100; row2 = 280; col1 = 150; col2 = 300;% nevi 200
%row1 = 100; row2 = 280; col1 = 200; col2 = 300;% nevi 250
%row1 = 100; row2 = 260; col1 = 250; col2 = 350;% nevi 300
%row1 = 450; row2 = 500; col1 = 400; col2 = 500;% nevi 350
%row1 = 70; row2 = 120; col1 = 400; col2 = 500;% nevi 400
%row1 = 150; row2 = 250; col1 = 500; col2 = 570;% nevi 450
%row1 = 150; row2 = 250; col1 = 470; col2 = 570;% nevi 500
%row1 = 50; row2 = 150; col1 = 70; col2 = 150;% 290113 front nevi Scan25
%row1 = 200; row2 = 250; col1 = 150; col2 = 200;% 290113 front nevi Scan75
%row1 = 200; row2 = 250; col1 = 100; col2 = 200;% 290113 front nevi Scan125
%row1 = 150; row2 = 350; col1 = 200; col2 = 250;% 290113 front nevi Scan175ללללט
%row1 = 190; row2 = 260; col1 = 170; col2 = 250;% 290113 front nevi Scan225
%row1 = 190; row2 = 260; col1 = 230; col2 = 310;% 290113 front nevi Scan275
%row1 = 150; row2 = 250; col1 = 300; col2 = 400;% 290113 front nevi Scan325
%row1 = 150; row2 = 250; col1 = 320; col2 = 420;% 290113 front nevi Scan375
%row1 = 200; row2 = 280; col1 = 470; col2 = 550;% 290113 front nevi Scan425
%row1 = 350; row2 = 450; col1 = 430; col2 = 520;% 290113 front nevi Scan475
%row1 = 250; row2 = 500; col1 = 30; col2 = 100;% 180912  melan Scan25
%row1 = 430; row2 = 500; col1 = 50; col2 = 220;% 180912  melan Scan75
%row1 = 270; row2 = 500; col1 = 200; col2 = 250;% 180912  melan Scan125
%row1 = 300; row2 = 350; col1 = 100; col2 = 200;% 180912  melan Scan175
%row1 = 105; row2 = 240; col1 = 470; col2 = 510;% 180912  melan Scan225
%row1 = 105; row2 = 240; col1 = 470; col2 = 510;% 180912  melan Scan275
%row1 = 270; row2 = 310; col1 = 400; col2 = 500;% 180912  melan Scan325
%row1 = 270; row2 = 310; col1 = 400; col2 = 500;% 180912  melan Scan375
%row1 = 270; row2 = 310; col1 = 400; col2 = 500;% 180912  melan Scan425
%row1 = 300; row2 = 500; col1 = 50; col2 = 100;% 180912  melan Scan475
%row1 = 300; row2 = 350; col1 = 640; col2 = 700;% 150113  basal front Scan 25
%row1 = 100; row2 = 150; col1 = 530; col2 = 600;% 150113  basal front Scan75
%row1 = 100 ; row2 = 150; col1 = 530; col2 = 600;% 150113  basal front Scan125
%row1 = 70 ; row2 = 120; col1 = 530; col2 = 600;% 150113  basal front Scan175
%row1 = 210 ; row2 = 250; col1 = 500; col2 = 550;% 150113  basal front Scan225
%row1 = 270 ; row2 = 350; col1 = 480; col2 = 550;% 150113  basal front Scan275
%row1 = 200 ; row2 = 300; col1 = 350; col2 = 400;% 150113  basal front Scan325
%row1 = 300 ; row2 = 400; col1 = 200; col2 = 300;% 150113  basal front Scan375
%row1 = 100 ; row2 = 300; col1 = 150; col2 = 240;% 150113  basal front Scan425
%row1 = 100 ; row2 = 300; col1 = 150; col2 = 240;% 150113  basal front Scan475
%row1 = 210 ; row2 = 280; col1 = 580; col2 = 650;% 150113  basal front Scan1 25 50 skin
%row1 = 210 ; row2 = 280; col1 = 540; col2 = 610;% 150113  basal front Scan 75 100 skin
%row1 = 400 ; row2 = 450; col1 = 600; col2 = 650;% 150113  basal front Scan 125 150 175 200skin
%row1 = 100 ; row2 = 150; col1 = 520; col2 = 570;% 150113  basal front Scan 225 250skin
%row1 = 40 ; row2 = 90; col1 = 520; col2 = 570;% 150113  basal front Scan 275 300 325skin
%row1 = 150 ; row2 = 200; col1 = 300; col2 = 350;% 150113  basal front Scan 350 375skin
%row1 = 350 ; row2 = 400; col1 = 200; col2 = 250;% 150113  basal front Scan 400 425skin
%row1 = 400 ; row2 = 450; col1 = 200; col2 = 250;% 150113  basal front Scan 450 475skin
%row1 = 150 ; row2 = 200; col1 = 550; col2 = 600;% 150113  basal front Scan 500skin
%row1 = 165 ; row2 = 215; col1 = 460; col2 = 510;% 180912 melan Scan 1 skin
%row1 = 250 ; row2 = 300; col1 = 20; col2 = 70 % 180912 melan Scan 25 50 skin
%row1 = 250 ; row2 = 300; col1 = 50; col2 = 100 % 180912 melan Scan75 skin
%row1 = 250 ; row2 = 300; col1 = 60; col2 = 110 % 180912 melan Scan100 skin
%row1 = 300 ; row2 = 350; col1 = 60; col2 = 110 % 180912 melan Scan125 150 175 skin
%row1 = 350 ; row2 = 400; col1 = 80; col2 = 130 % 180912 melan Scan200 skin
%row1 = 350 ; row2 = 400; col1 = 100; col2 = 150 % 180912 melan Scan225 250 275skin
%row1 = 350 ; row2 = 400; col1 = 110; col2 = 160 % 180912 melan Scan300 skin
%row1 = 450 ; row2 = 500; col1 = 100; col2 = 150 % 180912 melan Scan325 skin
%row1 = 450 ; row2 = 500; col1 = 120; col2 = 170 % 180912 melan Scan350 skin
%row1 = 450 ; row2 = 500; col1 = 150; col2 = 200 % 180912 melan Scan375 400 425skin
%row1 = 450 ; row2 = 500; col1 = 160; col2 = 210 % 180912 melan Scan450 475 skin
%row1 = 220 ; row2 = 270; col1 = 100; col2 = 150 % 180912 melan Scan500 skin
%row1 = 450 ; row2 = 500; col1 = 500; col2 = 550 % 180912 nevi Scan1 skin
%row1 = 250 ; row2 = 300; col1 = 100; col2 = 150 % 180912 nevi Scan25 50 75skin
%row1 = 150 ; row2 = 200; col1 = 80; col2 = 130 % 180912 nevi Scan100 skin
%row1 = 150 ; row2 = 200; col1 = 80; col2 = 130 % 180912 nevi Scan200 skin
%row1 = 260 ; row2 = 310; col1 = 210; col2 = 260 % 180912 nevi Scan225 skin
%row1 = 250 ; row2 = 300; col1 = 210; col2 = 260 % 180912 nevi Scan250 275 skin
%row1 = 180 ; row2 = 230; col1 = 300; col2 = 350 % 180912 nevi Scan 300 skin
%row1 = 375 ; row2 = 425; col1 = 400; col2 = 450 % 180912 nevi Scan 325 350 skin
%row1 = 10 ; row2 = 60; col1 = 350; col2 = 400 % 180912 nevi Scan 375 skin
%row1 = 1; row2 = 500; col1 = 350; col2 = 450;% 010213 mel Scan25
% row1 = 10; row2 = 500; col1 = 350; col2 = 450;% 010213 mel Scan50,75,100,...,200
%row1 = 10; row2 = 320; col1 = 230; col2 = 450;% 010213 mel Scan225
%row1 = 10; row2 = 320; col1 = 200; col2 = 450;% 010213 mel Scan250
% row1 = 10; row2 = 200; col1 = 150; col2 = 450;% 010213 mel Scan275,300
%row1 = 10; row2 = 200; col1 = 140; col2 = 450;% 010213 mel Scan325,...,500
%and Scan1
%row1 = 170; row2 = 500; col1 = 150; col2 = 400;% 21176 Platonov tumor Scan1
%row1 = 140; row2 = 500; col1 = 200; col2 = 400;% 21176 Platonov tumor Scan25

%row1 = 140; row2 = 500; col1 = 250; col2 = 400;% 21176 Platonov tumor Scan50,75,100
%row1 = 140; row2 = 500; col1 = 280; col2 = 420;% 21176 Platonov tumor Scan125
%row1 = 200; row2 = 500; col1 = 280; col2 = 420;% 21176 Platonov tumor Scan150
%row1 = 200; row2 = 500; col1 = 300; col2 = 450;% 21176 Platonov tumor
%Scan150,175,200,225
%row1 = 200; row2 = 500; col1 = 350; col2 = 500;% 21176 Platonov tumor Scan250
%row1 = 175; row2 = 500; col1 = 400; col2 = 500;% 21176 Platonov tumor Scan275
%row1 = 175; row2 = 500; col1 = 450; col2 = 500;% 21176 Platonov tumor Scan300
%row1 = 5; row2 = 400; col1 = 160; col2 = 300;% 21176 Platonov tumor Scan300
%row1 = 100; row2 = 500; col1 = 350; col2 = 500;% 070213 tumor Scan300
%row1 = 10; row2 = 500; col1 = 350; col2 = 500;% 070213  tumor Scan125
%row1 = 10; row2 = 500; col1 = 300; col2 = 500;% 070213  tumor Scan300
%row1 = 10; row2 = 500; col1 = 200; col2 = 400;% 070213  tumor Scan325
%row1 = 10; row2 = 450; col1 = 150; col2 = 400;% 070213  tumor Scan450
%row1 = 10; row2 = 500; col1 = 240; col2 = 400;% Doronin  tumor Scan1
%row1 = 10; row2 = 500; col1 = 350; col2 = 510;% Doronin  tumor Scan25
%row1 = 10; row2 = 500; col1 = 400; col2 = 560;% Doronin  tumor Scan125
%row1 = 10; row2 = 500; col1 = 410; col2 = 570;% Doronin  tumor Scan200
%row1 = 10; row2 = 500; col1 = 350; col2 = 570;% Doronin  tumor Scan350
%row1 = 10; row2 = 500; col1 = 325; col2 = 570;% Doronin  tumor Scan375
%row1 = 10; row2 = 500; col1 = 300; col2 = 570;% Doronin  tumor Scan400
%row1 = 10; row2 = 500; col1 = 290; col2 = 570;% Doronin  tumor Scan450
%row1 = 10; row2 = 500; col1 = 250; col2 = 530;% Doronin  tumor Scan500
%row1 = 10; row2 = 500; col1 = 150; col2 = 280;% Kudrova  tumor Scan1
%row1 = 10; row2 = 500; col1 = 150; col2 = 250;% Kudrova  tumor Scan25
%row1 = 10; row2 = 500; col1 = 170; col2 = 270;% Kudrova  tumor Scan150
% row1 = 10; row2 = 500; col1 = 140; col2 = 270;% Kudrova  tumor Scan325
% row1 = 10; row2 = 500; col1 = 200; col2 = 330;% Rubanov  tumor Scan1
% row1 = 10; row2 = 500; col1 = 510; col2 = 640;% Doronin frontier   Scan1
% row1 = 10; row2 = 500; col1 = 480; col2 = 640;% Doronin frontier  Scan100
% row1 = 10; row2 = 500; col1 = 450; col2 = 640;% Doronin frontier  Scan100
% row1 = 10; row2 = 500; col1 = 400; col2 = 640;% Doronin frontier  Scan200
%row1 = 10; row2 = 500; col1 = 350; col2 = 640;% Doronin frontier  Scan225
% row1 = 10; row2 = 500; col1 = 550; col2 = 700;% Doronin frontier  Scan250
% row1 = 10; row2 = 400; col1 = 220; col2 = 350;% 010023 frontier  Scan250
%row1 = 75; row2 = 300; col1 = 300; col2 = 400;% Platonov skin+fat Scan1
row1 = 10; row2 = 330; col1 = 400; col2 = 520;%  070213 nevi Scan1

R = I(row1:row2,col1:col2); % rference region (background)
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