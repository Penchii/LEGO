%% Project image reproduction
% The purpose of this project is to reproduce an image with the help of
% self-programmed LEGO bricks. 

clear all
clc

% Read in a reference image, which we will later reproduce
refImg = imread('refImage.jpg');

result = legofy(refImg);
imshow(result)




