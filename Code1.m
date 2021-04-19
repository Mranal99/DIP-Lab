%Histogram Equalization
clc; clear all; close all;

% reading image's pixel 
img=imread('tiger.jpg');

numofpixels=size(img,1)*size(img,2);

imh=uint8(zeros(size(img,1),size(img,2)));

freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);

%Calculating The probability of each occurrence.
for i=1:size(img,1)
    for j=1:size(img,2)
        value=img(i,j);
        freq(value+1)=freq(value+1)+1;
        probf(value+1)=freq(value+1)/numofpixels;
    end
end

sum=0;
no_bits=255;

%Calculating cumulative distribution probability.
for i=1:size(probf)
   sum=sum+freq(i);
   cum(i)=sum;
   probc(i)=cum(i)/numofpixels;
   output(i)=round(probc(i)*no_bits);
end

for i=1:size(img,1)
    for j=1:size(img,2)
            imh(i,j)=output(img(i,j)+1);
    end
end

%plotting original and Histogram equalization image
subplot(1, 2, 1); 
imshow(img); 
title('Original Image'); 
subplot(1, 2, 2); 
imshow(imh); 
title('Histogram equalization');