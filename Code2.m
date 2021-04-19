%Bit Plane slicing
clc; clear all; close all;
  
% reading image's pixel 
img = imread('tiger.jpg'); 
imgd = double(img); 
  
% extracting all bit one by one 
img1 = mod(imgd, 2); 
img2 = mod(floor(imgd/2), 2); 
img3 = mod(floor(imgd/4), 2); 
img4 = mod(floor(imgd/8), 2); 
img5 = mod(floor(imgd/16), 2); 
img6 = mod(floor(imgd/32), 2); 
img7 = mod(floor(imgd/64), 2); 
img8 = mod(floor(imgd/128), 2); 
  
% plotting original image
subplot(2, 5, 1); 
imshow(img); 
title('Original Image'); 
  
% plotting binary image having extracted bit from 1st to 8th 
subplot(2, 5, 2); 
imshow(img1); 
title('Bit Plane 1'); 
subplot(2, 5, 3); 
imshow(img2); 
title('Bit Plane 2'); 
subplot(2, 5, 4); 
imshow(img3); 
title('Bit Plane 3'); 
subplot(2, 5, 5); 
imshow(img4); 
title('Bit Plane 4'); 
subplot(2, 5, 6); 
imshow(img5); 
title('Bit Plane 5'); 
subplot(2, 5, 7); 
imshow(img6); 
title('Bit Plane 6'); 
subplot(2, 5, 8); 
imshow(img7); 
title('Bit Plane 7'); 
subplot(2, 5, 9); 
imshow(img8); 
title('Bit Plane 8'); 
  
