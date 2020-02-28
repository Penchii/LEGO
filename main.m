%% Project image reproduction
% The purpose of this project is to reproduce an image with the help of
% self-programmed LEGO bricks. 

clear all
clc

refImg = imread('refImage.jpg');
result = legofy(refImg);
imshow(result);




