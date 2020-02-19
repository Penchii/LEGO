function lego = generateLego(R, G, B);
% Takes in an RGB color and gives back a 30x30 lego of that color
% lego = 30x30x3 matrix 
% RGB range: [0,1]

R_out = zeros(30) + R;
G_out = zeros(30) + G;
B_out = zeros(30) + B;

lego = double(cat(3, R_out, G_out, B_out));
end