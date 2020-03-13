function legoImg = legofy(img)
% Takes in an image
% Gives back the same image but recreated with LEGO's


% Downsample the image in case it's too big
dim = size(img);
maxPx = 10000;
if (dim(1)*dim(2) > maxPx)
    q = sqrt(maxPx/(dim(1)*dim(2)));  % Factor for downsampling
    legoImg = imresize(img, q, 'bicubic');
else
    legoImg = img;
end

% Change the img's rgb values to CIELAB for better color comparison
% legoImg = rgb2lab(legoImg);

% loop over every pixel in img and find the closest color match in the
% database. 




end