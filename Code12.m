%run length encoding
clc; clear;close all;

%% Input test image
A = imread('tiger.jpg');
A = rgb2gray(A);
imshow(A);
title('Original Image');
%% Padding zeros to image matrix
H = size(I,1);
W = size(I,2);
padded_img = [zeros(H,1),I,zeros(H,1)];
padded_img = [zeros(1,W+2);padded_img;zeros(1,W+2)];
%% Near Neighbourhood Algorithm
image_new = zeros(H,W);
for row = 1:H
  for col = 1:W
    row_init = row+1;
    col_init = col+1;
    curr_pix = padded_img(row_init,col_init);
    new_pix = 1*(curr_pix<padded_img(row_init,col_init+1))+...
    2*(curr_pix<padded_img(row_init-1,col_init+1))+...
    4*(curr_pix<padded_img(row_init-1,col_init))+...
    8*(curr_pix<padded_img(row_init-1,col_init-1))+...
    16*(curr_pix<padded_img(row_init,col_init-1))+...
    32*(curr_pix<padded_img(row_init+1,col_init-1))+...
    64*(curr_pix<padded_img(row_init+1,col_init))+...
    128*(curr_pix<padded_img(row_init+1,col_init+1));
    image_new(row,col) = new_pix;
  end
end

image_new = uint8(image_new);
%% Plotting
figure(2);
imshow(image_new);
title('Image After Applying Algorithm');
%Get input vector
vector = randi([0 1],1,100);
stm = sprintf('%d', vector);
fprintf("Original Input String: %s\n",stm);
d = my_RLE(vector);
fprintf('Run length encoded output:\n');
d'
len_output = length(d);
len_input = length(vector);
%Check for compression ratio
if (len_output / len_input) <1
  fprintf('Positive Compression with ratio = %.2d\n', len_output / len_input)
else
  fprintf('Negative compression.')
end