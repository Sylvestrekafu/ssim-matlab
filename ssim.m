clear all, close all, clc;
# importer les deux packages pour ceux qui utilisent octave à la place de matlab
#pkg load image ;
#pkg load signal ; 

lena=imread('lena.bmp');  
[h,l]=size(lena)
max(max(lena))
flena=dct2(lena);
taille =0 ;

for i=1:254
taille = taille + i;
mask = zeros(h,l);
mask(1:taille,1:taille)=1;

relena2=idct2(flena.*mask);
[h,l]=size(relena2)
max(max(relena2))
tauc(i) = 100*(1-((taille)/(l)))
psnr(i)=10*log10((max(max(lena)))*(max(max(lena))))/(((h-taille)*(h-taille))/2)
ssim(i)=(4*(h/2)*(taille/2)*(((h*taille)/2)-(h/2)*(taille/2)))./((((h*h)/2)-((h/2)*(h/2))+(taille*taille/2)-((taille/2)*(taille/2)))*(((h/2)*(h/2))+((taille/2)*(taille/2))))

end
plot(tauc,ssim,'r')
