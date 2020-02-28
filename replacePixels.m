function result = replacePixels(img, imgColors, legos, dtbase)

% Takes in an image, list of the colors of the image, a set of legos, a
% list of the colors of the legos. Gives back an image where every pixel is
% replaced with a lego

%%%%%%%%%%%%%%%%%%% In parameters %%%%%%%%%%%%%%%%%%%%%
% img               image in CIELab color space
% imgColors         Mx3 double containing all unique colors in img
% legos             1x110 cell array containing 30x30x3 doubles, 
%                   that are legos in RGB color space
% dtbase            110x3 array of all the lego colors in CIELab


%%%%%%%%%%%%%%%%%%% Out parameters %%%%%%%%%%%%%%%%%%%%
% result            An image where every pixel is represented by a lego

dBase = size(dtbase);
dColors = size(imgColors);

deltaE = zeros(1,dBase(1));
E = zeros(1,dColors(1));

% Compare the CIELAB value of the rgb-color database and the selected imgColors
for i = 1:dColors(1)
    for j = 1:dBase(1)
      deltaE(j) = sqrt((imgColors(i,1) - dtbase(j,1)).^2 + (imgColors(i,2) - dtbase(j,2)).^2 + (imgColors(i,3) - dtbase(j,3)).^2); 
    end
    % Find out the minimum value in the deltaE array and take its index and
    % put it in E.
    [~,I] = min(deltaE);
    E(i) = I;
end

% Replace all the pixels with legos of the correct color
dImg = size(img);
result = zeros(dImg(1)*30, dImg(2)*30, 3);

for i = 1:dImg(1)
    for j = 1:dImg(2)
        color = img(i,j,:);
        idx = find(imgColors==color);
        idxFind = E(idx(1));
        a = 1 + 30*(i-1);
        b = 1 + 30*(j-1);
        result(a:a+29, b:b+29, :) = legos{1,idxFind};
    end
end

end

