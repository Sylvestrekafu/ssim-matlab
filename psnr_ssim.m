#compression d'images

clear all, close all, clc;

#pkg load image
#pkg load signal
lena=imread('lena.bmp');  
lena=double(lena);
[h,l]=size(lena)

lenafloat=double(lena);
len2float=lenafloat./max(max(lenafloat));
# COMPRESSION
#  calcul de la DCT de l'image 
flena=dct2(lena);
for taille =190:3:200;

mask = zeros(h,l);
mask(1:taille,1:taille) = 1 ; #masque de taille NxN
tauc = 100*(1-((taille/h).*(taille/l)));

relena=idct2(flena.*mask);
relena=double(relena);
mse = sum((lena(:)-relena(:)).^2) / prod(size(lena));
figure(1),
subplot(333),
imagesc(log(abs((flena.*mask)))), colorbar, colormap(jet)
daspect([1,1,1])
subplot(332),imagesc(log(abs(flena))); colormap(jet); colorbar;
daspect([1,1,1]),title('coefficients DCT de lena');
psnr = 10*log10(255*255/mse);

#[ssimval, ssimmap] = ssim(lena,lena);
subplot(331),imagesc(lena),colorbar, daspect([1,1,1]);
 title('image originale');
#subplot(334), imagesc(lena), daspect([1,1,1]),colormap(gray), colorbar, title('image initiale');
subplot(334), imagesc(relena), daspect([1,1,1]), colorbar, title(['image compress�e avec taux (%) = ',num2str(tauc)]);
colormap(gray);
figure(2),
imagesc(relena),colormap(gray);
#a=psnr(lena, relena);
end


lena=imread('lena.bmp');  
[h,l]=size(lena)
max(max(lena))
flena=dct2(lena);
taille =0 ;

for i=1:200
taille = taille + i;
mask = zeros(h,l);
mask(1:taille,1:taille)=1;

relena2=idct2(flena.*mask);
[h,l]=size(relena2)
max(max(relena2))
tauc(i) = 100*(1-((taille)/(l)))
%psnr(i)=10*log10((max(max(lena2)))*(max(max(lena2))))/(((h-taille)*(h-taille))/2)
ssim(i)=(4*(h/2)*(taille/2)*(((h*taille)/2)-(h/2)*(taille/2)))./((((h*h)/2)-((h/2)*(h/2))+(taille*taille/2)-((taille/2)*(taille/2)))*(((h/2)*(h/2))+((taille/2)*(taille/2))))
plot(tauc,ssim,'r')
end
plot(tauc,ssim,'r')
xlabel('variation du taux de compression'),
ylabel('variation du SSIM  '),
title('Graphe montrant la variation de SSim en faction du taux de compression')

 
