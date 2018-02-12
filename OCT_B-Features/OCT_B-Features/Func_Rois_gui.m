% TO SELECT THE REGION OF INTEREST
% WEI GAO

function [R] = Func_Rois(I,A)

%figure;imagesc(I);colormap(gray(256));
% hold on;

row1 = A{1}; row2 = A{2}; col1 = A{3}; col2 = A{4};

R = I(row1:row2,col1:col2); % rference region (background)
% x = [col1,col2,col2,col1,col1]; y = [row1,row1,row2,row2,row1]; plot(x,y,'r-');

% hold off;

end