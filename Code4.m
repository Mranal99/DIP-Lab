%Arithmetic operations
clc;clear;close all;
#we first read the image whose operation is to performed
a=imread('tiger.jpg');
figure
subplot(2,4,1);image(a);
title('orignal image');
#we perform a addition operation;
A = a+60;
subplot(2,4,2);
image(A);
title('addition');
#we perform a subtraction operation;
B = a-100;
subplot(2,4,3);
image(B);
title('subtraction');
#we perform a multiply operation;
C = a.*2;
subplot(2,4,4);
image(C);
title('multiply');
#we perform a divide operation;
D = a./2;
subplot(2,4,5);
image(D);
title('divide');

