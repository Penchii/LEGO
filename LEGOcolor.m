clc
clear

A = fopen('HEXval.txt');

B = string(110);
i = 0;
tline = fgetl(A);

while ischar(tline)
    i = i + 1;
    B(i) = tline;
    tline = fgetl(A);
end

fclose(A);

B = convertStringsToChars(B);
rgbval(110,3) =0;

for i = 1:110
    rgbval(i,:) = hex2rgb(B(1,i));
    labval(i,:) = rgb2lab(rgbval(i,:));
end
    

