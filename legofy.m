function [legoImg, legoGen, legoSpec] = legofy(img)

% Creates lego-versions of an image

%%%%%%%%%%%%%%%%%%% In parameters %%%%%%%%%%%%%%%%%%%%%
% img               An RGB image of any size

%%%%%%%%%%%%%%%%%%% Out parameters %%%%%%%%%%%%%%%%%%%%
% legoImg           image reproduced with all 110 legos
% legoGen           image reproduced with 50 legos from general optimization
% legoSpec          image reproduced with 50 legos from image dependant optimization

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
load('legos_general');
load('dtbase_general');
n = 50;
% dtbase_spec = dtbase;
% legos_spec = legos;

% Replace the pixels with legos
[legoImg, pixelResult] = replacePixels(img, uniqueColors, legos, dtbase);       % No optimization
legoGen = replacePixels(img, uniqueColors, legos_general, dtbase_general);      % General optimization


%%%%%%%%%%%%%% IMAGE DEPENDENT OPTIMIZATION %%%%%%%%%%%%%%%%%
% Optimize the database to best cover the colors in the image
% Pick the 50 most used legos

d = size(pixelResult);
pixelResult = reshape(pixelResult, [d(1)*d(2), 3]);
uniquePx = unique(pixelResult, 'rows');             % All unique Lab values found in the image

tot = 0;
for i = 1:length(uniquePx)
    quantity(i,:) = histc(pixelResult,uniquePx(i));      % how many times each unique px occurs in the image
    tot = tot + quantity(i,1);
end
tot
% find the highest 50 numbers in quantity
% take its corresponding indices
% save those in dtbase
% remove the others

[B, I] = sort(quantity);        % B is Quantity but sorted
                                % I is index thing
                                % quantity(I(i)) gives B(i)
                                % I(i) is then the index in dtbase

% Create a vector from I with all the indices to be saved
I2 = I(1:n);

dtbase_spec = dtbase(I2, :);
legos_spec = legos(I2);

legoSpec = replacePixels(img, uniqueColors, legos_spec, dtbase_spec);

%%%%%%%%%%%%%% ALTERNATE APPROACH %%%%%%%%%%%%%%%%%
% Take the list of colors returned in pixelResult
% cluster them too by kmeans algorithm
                                
                                


end