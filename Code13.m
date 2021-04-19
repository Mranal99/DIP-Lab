%Gaussian Filter
I = imread('tiger.jpg');
Iblur1 = imgaussfilt(I,2);
Iblur2 = imgaussfilt(I,4);
Iblur3 = imgaussfilt(I,8);
figure
imshow(I)
title('Original image')
figure
imshow(Iblur1)
title('Smoothed image, \sigma = 2')
figure
imshow(Iblur2)
title('Smoothed image, \sigma = 4')
figure
imshow(Iblur3)
title('Smoothed image, \sigma = 8')

IblurX1 = imgaussfilt(I,[4 1]);
IblurX2 = imgaussfilt(I,[8 1]);
figure
imshow(IblurX1)
title('Smoothed image, \sigma_x = 4, \sigma_y = 1')
figure
imshow(IblurX2)
title('Smoothed image, \sigma_x = 8, \sigma_y = 1')
