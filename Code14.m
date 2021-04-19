%image rotation, scaling and translation
clc; clear;close all;

% reading the image
I=imread('tiger.jpg');

% rotate the image
deg = -30;
I2 = imrotate(I, deg, 'bilinear', 'crop');

% resize the image(scale)
I3=imresize(I2,0.7,'nearest');

% translate the image
T = [1 0 0; 0 1 0;70 70 1];
tform_translate = maketform('affine', T);
[I4 xdata ydata] = imtransform(I3,tform_translate);
imshow(I4)
axis on
axis([0 400 0 400])