% PERFORM THE FRACTAL ANALYSIS ON A-SCAN OR B-SCAN (IMAGE)
% WEI GAO, SAMARA STATE AEROSPACE UNIVERSITY
% LAST MODIFIED DATE: 11/17/2014 (07/19/2016 DMITRY RAUPOV,  SAMARA NATIONAL
% RESEARCH UNIVERSITY)

function Main_gui(I0,A,m)

% INPUT
%   I0      -  original image

%--------------------------------------------------------------------------
% remove noise
[RtTam] = Func_Rois_gui(I0,A);
I0=im2double(I0);
bn = mean(mean(I0(30:50,:)));
Ib = I0 - bn;
I = Ib;

I = Func_FzdII(I,15,0.25,2);

[Rt] = Func_Rois_gui(I,A);
Gr(Rt);
stats=Gr(Rt);
[FD1] = Func_DBC(Rt);
[FD2] = Func_PS2D(Rt);
[FD,SD]=Func_Box(Rt);
% xlswrite('test.xls',{'FD_DBC'},'Fractal','K1');
% xlswrite('test.xls',{'FD_PS'},'Fractal','L1');
% xlswrite('test.xls',{'FD'},'Fractal','I1');
% xlswrite('test.xls',{'SD'},'Fractal','J1');
xlswrite('test.xls',FD1,'Fractal',strcat('K',num2str(m+2)));
xlswrite('test.xls',FD2,'Fractal',strcat('L',num2str(m+2)));
xlswrite('test.xls',FD,'Fractal',strcat('I',num2str(m+2)));
xlswrite('test.xls',SD,'Fractal',strcat('J',num2str(m+2)));

% xlswrite('test.xls',{'0 deg'},'Contrast','C1');
% xlswrite('test.xls',{'45 deg'},'Contrast','D1');
% xlswrite('test.xls',{'90 deg'},'Contrast','E1');
% xlswrite('test.xls',{'135 deg'},'Contrast','F1');
xlswrite('test.xls',stats(1).Contrast(1),'Contrast',strcat('C',num2str(m+2)));
xlswrite('test.xls',stats(1).Contrast(2),'Contrast',strcat('D',num2str(m+2)));
xlswrite('test.xls',stats(1).Contrast(3),'Contrast',strcat('E',num2str(m+2)));
xlswrite('test.xls',stats(1).Contrast(4),'Contrast',strcat('F',num2str(m+2)));
% xlswrite('test.xls',{'0 deg'},'Correlation','C1');
% xlswrite('test.xls',{'45 deg'},'Correlation','D1');
% xlswrite('test.xls',{'90 deg'},'Correlation','E1');
% xlswrite('test.xls',{'135 deg'},'Correlation','F1');
xlswrite('test.xls',stats(1).Correlation(1),'Correlation',strcat('C',num2str(m+2)));
xlswrite('test.xls',stats(1).Correlation(2),'Correlation',strcat('D',num2str(m+2)));
xlswrite('test.xls',stats(1).Correlation(3),'Correlation',strcat('E',num2str(m+2)));
xlswrite('test.xls',stats(1).Correlation(4),'Correlation',strcat('F',num2str(m+2)));
% xlswrite('test.xls',{'0 deg'},'Energy','C1');
% xlswrite('test.xls',{'45 deg'},'Energy','D1');
% xlswrite('test.xls',{'90 deg'},'Energy','E1');
% xlswrite('test.xls',{'135 deg'},'Energy','F1');
xlswrite('test.xls',stats(1).Energy(1),'Energy',strcat('C',num2str(m+2)));
xlswrite('test.xls',stats(1).Energy(2),'Energy',strcat('D',num2str(m+2)));
xlswrite('test.xls',stats(1).Energy(3),'Energy',strcat('E',num2str(m+2)));
xlswrite('test.xls',stats(1).Energy(4),'Energy',strcat('F',num2str(m+2)));
% % xlswrite('test.xls',{'0 deg'},'Homogeneity','C1');
% % xlswrite('test.xls',{'45 deg'},'Homogeneity','D1');
% % xlswrite('test.xls',{'90 deg'},'Homogeneity','E1');
% % xlswrite('test.xls',{'135 deg'},'Homogeneity','F1');
xlswrite('test.xls',stats(1).Homogeneity(1),'Homogeneity',strcat('C',num2str(m+2)));
xlswrite('test.xls',stats(1).Homogeneity(2),'Homogeneity',strcat('D',num2str(m+2)));
xlswrite('test.xls',stats(1).Homogeneity(3),'Homogeneity',strcat('E',num2str(m+2)));
xlswrite('test.xls',stats(1).Homogeneity(4),'Homogeneity',strcat('F',num2str(m+2)));

[ Rh,Rv,Rld,Rrd ] = MRF_Autocorrelation( Rt );
V1=var(Rh(:));
V2=var(Rv(:));  
V3=var(Rld(:));
V4=var(Rrd(:));
M1=mean(Rh(:));
M2=mean(Rv(:));  
M3=mean(Rld(:));
M4=mean(Rrd(:));


% xlswrite('test.xls',{'VarRh'},'MRFvar','C1');
% xlswrite('test.xls',{'VarRv'},'MRFvar','D1');
% xlswrite('test.xls',{'VarRld'},'MRFvar','E1');
% xlswrite('test.xls',{'VarRrd'},'MRFvar','F1');
xlswrite('test.xls',V1,'MRFvar',strcat('C',num2str(m+2)));
xlswrite('test.xls',V2,'MRFvar',strcat('D',num2str(m+2)));
xlswrite('test.xls',V3,'MRFvar',strcat('E',num2str(m+2)));
xlswrite('test.xls',V4,'MRFvar',strcat('F',num2str(m+2)));


% xlswrite('test.xls',{'MeanRh'},'MRFmean','C1');
% xlswrite('test.xls',{'MeanRv'},'MRFmean','D1');
% xlswrite('test.xls',{'MeanRld'},'MRFmean','E1');
% xlswrite('test.xls',{'MeanRrd'},'MRFmean','F1');
xlswrite('test.xls',M1,'MRFmean',strcat('C',num2str(m+2)));
xlswrite('test.xls',M2,'MRFmean',strcat('D',num2str(m+2)));
xlswrite('test.xls',M3,'MRFmean',strcat('E',num2str(m+2)));
xlswrite('test.xls',M4,'MRFmean',strcat('F',num2str(m+2)));



A=AverageEnergy(Rt);
%xlswrite('test.xls',{'AvEnergy'},'Other','B2');
xlswrite('test.xls',A,'Other',strcat('B',num2str(m+2)));

PCF00 = PoCorrFunc( Rt,0,0 );
PCF01 = PoCorrFunc( Rt,0,1 );
PCF10= PoCorrFunc( Rt,1,0 );
PCF11= PoCorrFunc( Rt,1,1 );

%xlswrite('test.xls',{'PCF00'},'Other','C2');
%xlswrite('test.xls',{'PCF01'},'Other','D2');
%xlswrite('test.xls',{'PCF10'},'Other','E2');
%xlswrite('test.xls',{'PCF11'},'Other','F2');
xlswrite('test.xls',PCF00,'Other',strcat('C',num2str(m+2)));
xlswrite('test.xls',PCF01,'Other',strcat('D',num2str(m+2)));
xlswrite('test.xls',PCF10,'Other',strcat('E',num2str(m+2)));
xlswrite('test.xls',PCF11,'Other',strcat('F',num2str(m+2)));


[ S,P,D,Irr,Kiso,Sph ] = GeometricFeat2D(Rt);
%xlswrite('test.xls',{'S'},'Geometric','B2');
%xlswrite('test.xls',{'P'},'Geometric','C2');
%xlswrite('test.xls',{'D'},'Geometric','D2');
%xlswrite('test.xls',{'Irr'},'Geometric','E2');
%xlswrite('test.xls',{'Kiso'},'Geometric','F2');
%xlswrite('test.xls',{'Sph'},'Geometric','G2');
xlswrite('test.xls',S,'Geometric',strcat('B',num2str(m+2)));
xlswrite('test.xls',P,'Geometric',strcat('C',num2str(m+2)));
xlswrite('test.xls',D,'Geometric',strcat('D',num2str(m+2)));
xlswrite('test.xls',Irr,'Geometric',strcat('E',num2str(m+2)));
xlswrite('test.xls',Kiso,'Geometric',strcat('F',num2str(m+2)));
xlswrite('test.xls',Sph,'Geometric',strcat('G',num2str(m+2)));

GS=GaborMain(Rt);
xlswrite('test.xls',GS,'Gabor',strcat('B',num2str(m+2)));

[Fcoarseness,Fcontrast,Fdirection]=TamuraM(RtTam);
%xlswrite('test.xls',{'Fcontr'},'Tamura','C2');
%xlswrite('test.xls',{'Fcoarse'},'Tamura','B2');
%xlswrite('test.xls',{'Fdir'},'Tamura','D2');
xlswrite('test.xls',Fcoarseness,'Tamura',strcat('B',num2str(m+2)));
xlswrite('test.xls',Fcontrast,'Tamura',strcat('C',num2str(m+2)));
xlswrite('test.xls',Fdirection,'Tamura',strcat('D',num2str(m+2)));

[FD,TT]=MainFD(Rt);
%xlswrite('test.xls',{'FD1Dv'},'FractalGao','D1');
%xlswrite('test.xls',{'FD1Dh'},'FractalGao','E1');
%xlswrite('test.xls',{'FD_PS'},'FractalGao','F1');
%xlswrite('test.xls',{'FD_DBC'},'FractalGao','G1');

xlswrite('test.xls',FD,'FractalGao',strcat('A',num2str(m+2)));
xlswrite('test.xls',TT,'TimeGao',strcat('A',num2str(m+2)));

%xlswrite('test.xls',{'FD1DvTime'},'TimeGao','D1');
%xlswrite('test.xls',{'FD1DhTime'},'TimeGao','E1');
%xlswrite('test.xls',{'FD_PSTime'},'TimeGao','F1');
%xlswrite('test.xls',{'FD_DBCTime'},'TimeGao','G1');

J=Smooth(Rt,1);
[fi,w]=Local_Grad_Meth_CDF( J,1 );
%figure;
%imshow(fi);
%figure;
%imshow(w);

V1=var(fi(:));
V2=var(w(:));   
%xlswrite('test.xls',25*i,'CDF',strcat('A',num2str(i)));
%xlswrite('test.xls',{'VarFi'},'CDF',strcat('B',num2str(m+2)));
xlswrite('test.xls',V1,'CDF',strcat('B',num2str(m+2)));
%xlswrite('test.xls',{'VarW'},'CDF',strcat('C',num2str(m+2)));
xlswrite('test.xls',V2,'CDF',strcat('C',num2str(m+2)));

%--------------------------------------------------------------------------

end