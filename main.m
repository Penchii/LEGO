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
[legoImg, legoGen] = legofy(refImg);

figure
subplot(1,2,1)
imshow(legoImg)
subplot(1,2,2)
imshow(legoGen)




