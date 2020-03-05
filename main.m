%% Project image reproduction
% The purpose of this project is to reproduce an image using LEGO bricks. 



n = 50;         % Number of pieces to use in general and image specific optimization

%% Create general database 

load('legos');
load('dtbase');
[legos_general, dtbase_general] = kmeansOptimization(legos, dtbase, n);


%% Code for creating legofied image

refImg = imread('refImage.jpg');
[legoImg, legoGen, legoSpec] = legofy(refImg, n, legos, dtbase, legos_general, dtbase_general);

figure
subplot(1,3,1)
imshow(legoImg)
subplot(1,3,2)
imshow(legoGen)
subplot(1,3,3)
imshow(legoSpec)

%% More legofied images

for var = 1:6
    im  = imread(strcat('image', int2str(var), '.png'));
    [legoImg, legoGen, legoSpec] = legofy(im, n, legos, dtbase, legos_general, dtbase_general);
    figure
    subplot(2,2,1)
    imshow(im)
    title('Original')
    subplot(2,2,2)
    imshow(legoImg)
    title('110 bricks')
    subplot(2,2,3)
    imshow(legoGen)
    title(sprintf('%d bricks general optimization', n))
    subplot(2,2,4)
    imshow(legoSpec)
    title(sprintf('%d bricks image dependent optimization (most used)', n))
end



