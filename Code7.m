%Dilation
% read image  
I=imread('tiger.jpg');     
  
% convert to binary
I=im2bw(I);  
  
% create structuring element             
se=ones(5, 5); 
  
% store number of rows in P and number of columns in Q.           
[P, Q]=size(se); 
  
% create a zero matrix of size I.        
In=zeros(size(I, 1), size(I, 2)); 
  
for i=ceil(P/2):size(I, 1)-floor(P/2)
    for j=ceil(Q/2):size(I, 2)-floor(Q/2)
  
        % take all the neighbourhoods.
        on=I(i-floor(P/2):i+floor(P/2), j-floor(Q/2):j+floor(Q/2));  
         
        % take logical se
        nh=on(logical(se));      
        In(i, j)=max(nh(:));      
    end
end
  
imshow(In);