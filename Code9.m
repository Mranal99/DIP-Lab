%Ideal Low Pass Filter  
%Reading input image 
input_image = imread('tiger.jpg');

% M=no of rows (height of the image)
% N=no of columns (width of the image)
[M, N] = size(input_image);
  
% Getting Fourier Transform of the image
FT_img = fft2(double(input_image));
  
%Cut-off Frequency  
D0 = 30; 
  
% Designing filter
u = 0:(M-1);
idx = find(u>M/2);
u(idx) = u(idx)-M;
v = 0:(N-1);
idy = find(v>N/2);
v(idy) = v(idy)-N;

[V, U] = meshgrid(v, u);
  
% Calculating Euclidean Distance
D = sqrt(U.^2+V.^2);
H = double(D <= D0);
  
% Convolution
G = H.*FT_img;

output_image = real(ifft2(double(G)));
  
% Displaying Input Image and Output Image
subplot(2, 1, 1), imshow(input_image),
subplot(2, 1, 2), imshow(output_image, [ ]);