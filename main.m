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




