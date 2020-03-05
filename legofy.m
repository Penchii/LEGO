function [legoImg, legoGen, legoSpec] = legofy(img, n, legos, dtbase, legos_general, dtbase_general)

% Creates lego-versions of an image

%%%%%%%%%%%%%%%%%%% In parameters %%%%%%%%%%%%%%%%%%%%%
% img               An RGB image of any size
% n                 How many bricks the output should consist of
% legos             Database of legos
% dtbase            List of Lab colors in the legos database
% legos_general     Database of legos that has undergone general optimization
% dtbase_general    List of Lab colors in legos_general

%%%%%%%%%%%%%%%%%%% Out parameters %%%%%%%%%%%%%%%%%%%%
% legoImg           image reproduced with all 110 legos
% legoGen           image reproduced with n legos from general optimization
% legoSpec          image reproduced with n legos from image dependant optimization

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

% load('legos');
% load('dtbase');
% load('legos_general');
% load('dtbase_general');

% Replace the pixels with legos
[legoImg, pixelResult] = replacePixels(img, uniqueColors, legos, dtbase);       % No optimization
legoGen = replacePixels(img, uniqueColors, legos_general, dtbase_general);      % General optimization


%%%%%%%%%%%%%% IMAGE DEPENDENT OPTIMIZATION %%%%%%%%%%%%%%%%%
% Optimize the database to best cover the colors in the image
% Pick the n most used legos

d = size(pixelResult);
pixelResult = reshape(pixelResult, [d(1)*d(2), 3]);
uniquePx = unique(pixelResult, 'rows');             % All unique Lab values found in the image

tot = 0;
for i = 1:length(uniquePx)
    quantity(i,:) = histc(pixelResult,uniquePx(i));      % how many times each unique px occurs in the image
    tot = tot + quantity(i,1);
end

[B, I] = sort(quantity(:,1,1));        % B is Quantity but sorted
                                % I is index thing
                                % quantity(I(i)) gives B(i)

% Create a vector from I with all the indices to be saved
if (length(I) < n)
    I2 = I;
else     
    I2 = I(length(I)-n+1:length(I));
end
dtbase_spec = uniquePx(I2, :);         % This is list of all the most common pixels

% Convert to RGB
RGB = lab2rgb(dtbase_spec);
% Generate lego database
legos_spec = generateLego(RGB);

legoSpec = replacePixels(img, uniqueColors, legos_spec, dtbase_spec);

% %%%%%%%%%%%%%% KMEANS %%%%%%%%%%%%%%%%%
% % Take uniquePx
% % cluster them by kmeans algorithm
%                                 
% d = size(pixelResult);
% pixelResult = reshape(pixelResult, [d(1)*d(2), 3]);
% 
% dtbase_spec = unique(pixelResult, 'rows');             % All unique Lab values found in the image
% 
% % Convert to RGB
% RGB = lab2rgb(dtbase_spec);
% % Generate lego database
% legos_spec = generateLego(RGB);
% 
% if (n<length(dtbase_spec))
%     [legos_spec, dtbase_spec] = kmeansOptimization(legos_spec, dtbase_spec, n)
% end
% legoSpec = replacePixels(img, uniqueColors, legos_spec, dtbase_spec);
% 
% clear dtbase_spec legos_spec pixelResult uniqueColors imgColors index
                                


end