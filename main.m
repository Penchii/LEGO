%% Project image reproduction
% The purpose of this project is to reproduce an image with the help of
% self-programmed LEGO bricks. 

clear all
clc

% Use a function to add LEGO brick texture to solid colors.

% Read in a reference image, which we will later reproduce
refImg = imread('refImage.jpg');

% Change the refImage's rgb values to CIELAB for more correct values
refImg = rgb2lab(refImg);


