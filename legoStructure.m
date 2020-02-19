% code for creating the matrix used in function generateLego
% The matrix defines the structure of the lego

% DO IN CIELAB PLES
% Create a map for higher and lower L values

clear all
redBrick = rgb2lab(imread('30red.jpg'));
redColor = cat(3, ones(30), zeros(30), zeros(30));
redColor = rgb2lab(redColor);

% compare the Luma channel

Lmap = redBrick(:,:,1) - redColor(:,:,1);


greenBasecolor = cat(3, zeros(30), ones(30), zeros(30));
greenBasecolor = rgb2lab(greenBasecolor);

greenBasecolor(:,:,1) =  greenBasecolor(:,:,1) + Lmap;

greenBrick = lab2rgb(greenBasecolor);
imshow(greenBrick)

