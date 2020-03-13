%function result = compareIMG(img, dtbase, imgColors)
% This function takes in an image and an rgb-color database to then compare
% their CIELAB values and replace the images original colors with the
% colors from the database.
load('testImg.mat');
load('labval.mat');
load('uniqueColors.mat');
img = legoImg;
dtbase = labval;
imgColors = uniqueColors;
% Example databases
imgColors(50,3) = 0;

deltaE = zeros(1,110);
E = zeros(1,50);

dBase = size(dtbase);
dColors = size(imgColors);

% Compare the CIELAB value of the rgb-color database and the selected imgColors
for i = 1:dColors(1)
    for j = 1:dBase(1)
      deltaE(j) = sqrt((imgColors(i,1) - dtbase(j,1)).^2 + (imgColors(i,2) - dtbase(j,2)).^2 + (imgColors(i,3) - dtbase(j,3)).^2); 
    end
    % Find out the minimum value in the deltaE array and take its index and
    % put it in E.
    [M,I] = min(deltaE);
    E(i) = I;
end

dImg = size(img);

for i = 1:dImg(1)
    for j = 1:dImg(2)
        color = img(i,j,:);
        idx = find(imgColors==color);
        idxFind = E(idx(1));
        result(i,j,:) = dtbase(idxFind,:);
    end
end

result = lab2rgb(result);

imshow(result);


