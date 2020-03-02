%% Project image reproduction
% The purpose of this project is to reproduce an image with the help of
% self-programmed LEGO bricks. 

clear all
clc

% %% Create general database 
% load('legos');
% load('dtbase');
% [legos_general, dtbase_general] = generalOptimization(legos, dtbase, 50)


%% Code for creating legofied image

refImg = imread('refImage.jpg');
[legoImg, legoGen, legoSpec] = legofy(refImg);

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
    [legoImg, legoGen, legoSpec] = legofy(im);
    figure
    subplot(2,2,1)
    imshow(im)
    subplot(2,2,2)
    imshow(legoImg)
    subplot(2,2,3)
    imshow(legoGen)
    subplot(2,2,4)
    imshow(legoSpec)
end



