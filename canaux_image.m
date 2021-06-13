clear all, close all, clc ; 

%%% utile pour octave
pkg load image
pkg load signal

a = imread('flowerRGB.bmp');
whos;
figure,
imagesc(a);
colorbar;

figure,
imshow(a)

% on separe les canaux R, G, B : 

ra = a(:,:,1);
ga = a(:,:,2);
ba = a(:,:,3);

%figure,
%subplot(131), imagesc(ra), daspect([1,1,1]), title('canal ROUGE')
%subplot(132), imagesc(ga), daspect([1,1,1]), title('canal VERT')
%subplot(133), imagesc(ba), daspect([1,1,1]), title('canal BLEU')
%colormap(gray)

figure,
subplot(131), imagesc(ra), 
subplot(132), imagesc(ga), 
subplot(133), imagesc(ba),
colormap(gray)

figure,
subplot(131), imshow(ra), 
subplot(132), imshow(ga), 
subplot(133), imshow(ba),
colormap(gray)
