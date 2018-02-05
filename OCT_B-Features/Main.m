% PERFORM THE FRACTAL ANALYSIS ON A-SCAN OR B-SCAN (IMAGE)
% WEI GAO, SAMARA STATE AEROSPACE UNIVERSITY
% LAST MODIFIED DATE: 11/17/2014 (07/19/2016 DMITRY RAUPOV,  SAMARA NATIONAL
% RESEARCH UNIVERSITY)

function Main()

% INPUT
%   I0      -  original image

%--------------------------------------------------------------------------
% remove noise
I0=imread('C:\Users\User\Desktop\Science\290113\nevi\front\3d.tif',500);
I0=im2double(I0);
bn = mean(mean(I0(30:50,:)));
Ib = I0 - bn;
I = Ib;

I = Func_FzdII(I,15,0.25,2);

[Rt] = Func_Rois(I);
Gr(Rt);
stats=Gr(Rt);
[FD1] = Func_DBC(Rt);
[FD2] = Func_PS2D(Rt);
[FD,SD]=Func_Box(Rt);
xlswrite('test.xls',{'FD_DBC'},'Fractal','K1');
xlswrite('test.xls',{'FD_PS'},'Fractal','L1');
xlswrite('test.xls',FD1,'Fractal','K2');
xlswrite('test.xls',FD2,'Fractal','L2');
xlswrite('test.xls',{'FD'},'Fractal','I1');
xlswrite('test.xls',{'SD'},'Fractal','J1');
xlswrite('test.xls',FD,'Fractal','I2');
xlswrite('test.xls',SD,'Fractal','J2');

xlswrite('test.xls',{'0 deg'},'Contrast','C1');
xlswrite('test.xls',{'45 deg'},'Contrast','D1');
xlswrite('test.xls',{'90 deg'},'Contrast','E1');
xlswrite('test.xls',{'135 deg'},'Contrast','F1');
xlswrite('test.xls',stats(1).Contrast(1),'Contrast','C2');
xlswrite('test.xls',stats(1).Contrast(2),'Contrast','D2');
xlswrite('test.xls',stats(1).Contrast(3),'Contrast','E2');
xlswrite('test.xls',stats(1).Contrast(4),'Contrast','F2');
xlswrite('test.xls',{'0 deg'},'Correlation','C1');
xlswrite('test.xls',{'45 deg'},'Correlation','D1');
xlswrite('test.xls',{'90 deg'},'Correlation','E1');
xlswrite('test.xls',{'135 deg'},'Correlation','F1');
xlswrite('test.xls',stats(1).Correlation(1),'Correlation','C2');
xlswrite('test.xls',stats(1).Correlation(2),'Correlation','D2');
xlswrite('test.xls',stats(1).Correlation(3),'Correlation','E2');
xlswrite('test.xls',stats(1).Correlation(4),'Correlation','F2');
xlswrite('test.xls',{'0 deg'},'Energy','C1');
xlswrite('test.xls',{'45 deg'},'Energy','D1');
xlswrite('test.xls',{'90 deg'},'Energy','E1');
xlswrite('test.xls',{'135 deg'},'Energy','F1');
xlswrite('test.xls',stats(1).Energy(1),'Energy','C2');
xlswrite('test.xls',stats(1).Energy(2),'Energy','D2');
xlswrite('test.xls',stats(1).Energy(3),'Energy','E2');
xlswrite('test.xls',stats(1).Energy(4),'Energy','F2');
xlswrite('test.xls',{'0 deg'},'Homogeneity','C1');
xlswrite('test.xls',{'45 deg'},'Homogeneity','D1');
xlswrite('test.xls',{'90 deg'},'Homogeneity','E1');
xlswrite('test.xls',{'135 deg'},'Homogeneity','F1');
xlswrite('test.xls',stats(1).Homogeneity(1),'Homogeneity','C2');
xlswrite('test.xls',stats(1).Homogeneity(2),'Homogeneity','D2');
xlswrite('test.xls',stats(1).Homogeneity(3),'Homogeneity','E2');
xlswrite('test.xls',stats(1).Homogeneity(4),'Homogeneity','F2');

[ Rh,Rv,Rld,Rrd ] = MRF_Autocorrelation( Rt );
V1=var(Rh(:));
V2=var(Rv(:));  
V3=var(Rld(:));
V4=var(Rrd(:));
M1=mean(Rh(:));
M2=mean(Rv(:));  
M3=mean(Rld(:));
M4=mean(Rrd(:));


xlswrite('test.xls',{'VarRh'},'MRFvar','B2');
xlswrite('test.xls',V1,'MRFvar','C2');
xlswrite('test.xls',{'VarRv'},'MRFvar','D2');
xlswrite('test.xls',V2,'MRFvar','E2');
xlswrite('test.xls',{'VarRld'},'MRFvar','F2');
xlswrite('test.xls',V3,'MRFvar','G2');
xlswrite('test.xls',{'VarRrd'},'MRFvar','H2');
xlswrite('test.xls',V4,'MRFvar','I2');

xlswrite('test.xls',{'MeanRh'},'MRFmean','B2');
xlswrite('test.xls',M1,'MRFmean','C2');
xlswrite('test.xls',{'MeanRv'},'MRFmean','D2');
xlswrite('test.xls',M2,'MRFmean','E2');
xlswrite('test.xls',{'MeanRld'},'MRFmean','F2');
xlswrite('test.xls',M3,'MRFmean','G2');
xlswrite('test.xls',{'MeanRrd'},'MRFmean','H2');
xlswrite('test.xls',M4,'MRFmean','I2');


%--------------------------------------------------------------------------

end