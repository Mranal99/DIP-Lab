%inverse filtering image restoration
clc;
clear all;
close all;
f=rgb2gray(im2double(imread('tiger.jpg')));
f=imresize(f,[256 256])
figure,(imshow(f))
[M,N]=size(f);

h=fspecial('gaussian',260,2);
g=(imfilter(f,h,'circular'));
figure,imshow(g,[]);
G = fftshift(fft2(g));
figure,imshow(log(abs(G)),[]);
H = fftshift(fft2(h));
figure,imshow(log(abs(H)),[]);
F = zeros(size(f));
R=70;
for u=1:size(f,2)
    for v=1:size(f,1)
        du = u - size(f,2)/2;
        dv = v - size(f,1)/2;
        if du^2 + dv^2 <= R^2;
        F(v,u) = G(v,u)./H(v,u);
        end
    end
end
figure,imshow(log(abs(F)),[]);
fRestored = abs(ifft2(ifftshift(F)));
figure,imshow(fRestored, []);