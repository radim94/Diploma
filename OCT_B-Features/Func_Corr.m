% CALCULATE THE CORRELATION COEFFICIENT FOR NONLINEAR CURVE FITTING

function [R] = Func_Corr(y,yf)

SSE = sum((y-yf).^2);
SST = sum((y-mean(y)).^2);

R = sqrt(1-SSE/SST);

end