function legoImg = legofy(img)
% Takes in an image
% Gives back the same image but recreated with LEGO's

% for testing purpose
% img = imread('refImage.jpg');

% Downsample the image in case it's too big
dim = size(img);
maxPx = 10000;
if (dim(1)*dim(2) > maxPx)
    q = sqrt(maxPx/(dim(1)*dim(2)));  % Factor for downsampling
    img = imresize(img, q, 'bicubic');
end

clear q dim maxPx

% Change the img's rgb values to CIELAB 
img = rgb2lab(img);

% loop over every pixel in img and store the value in an array
[rows, cols, chan] = size(img);
imgColors = zeros(1,3);         % replace 1 with rows*cols
index = 1;
for i = 1:rows
    for j = 1:cols
        L = img(i,j,1); a = img(i,j,2); b = img(i,j,3);
        Lab = cat(2, L, a, b);
        imgColors(index,:) = Lab;
        index = index +1;
    end
end

clear L a b Lab index rows cols chan i j 

% Find all unique colors
uniqueColors = unique(imgColors, 'rows');

load('legos');
load('dtbase');

%%%%%%%%%%%%%%% OPTIMERING 1 %%%%%%%%%%%%%%%%
% Allmän optimering

% Or, can do 50 clusters, remove all but 1 in each cluster
n = 50;
[legos_general, dtbase_general] = generalOptimization(legos, dtbase, n);
clear n

%%%%%%%%%%%%%%% OPTIMERING 2 %%%%%%%%%%%%%%%%
% Optimering beroende på bildens färginnehåll
% plocka de 50 mest använda legobitarna


% Replace the pixels with legos
legoImg = replacePixels(img, uniqueColors, legos, dtbase);



end