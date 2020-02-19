function lego = generateLego(R, G, B);
% Takes in an RGB color and gives back a 30x30 lego of that color
% lego = 30x30x3 matrix 
% RGB range: [0,1]

load('brickStructure.mat');

R_out = zeros(30) + R;
G_out = zeros(30) + G;
B_out = zeros(30) + B;

lego = rgb2lab(cat(3, R_out, G_out, B_out));
lego(:,:,1) = lego(:,:,1) + Lmap;
lego = lab2rgb(lego);

end