%Wiener Filter
Ioriginal = imread('tiger.jpg');
imshow(Ioriginal)
title('Original Image')

PSF = fspecial('motion',21,11);
Idouble = im2double(Ioriginal);
blurred = imfilter(Idouble,PSF,'conv','circular');

imshow(blurred)
title('Blurred Image')

wnr1 = deconvwnr(blurred,PSF);
imshow(wnr1)
title('Restored Blurred Image')