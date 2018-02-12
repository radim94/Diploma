function [ stats ] = Gr( I )
%haralics properties
GLCM2 = graycomatrix(I,'Offset',[0 1; -1 1; -1 0;
-1 -1]);%0  45  90  135 degrees
stats = graycoprops(GLCM2);

end

