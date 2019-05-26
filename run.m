warning off 
clc, close all, clear all;

imagen=imread('TEST_3.jpg');
imshow(imagen);
title('IMAGEN REAL')

imagen=rgb2gray(imagen);
threshold = graythresh(imagen);%función utiliza el método de Otsu
imagen =~im2bw(imagen);%convierte la imagen en escala de grises a binaria
imagen = bwareaopen(imagen,30);%Elimina todos los componentes que tengan menos de p pixeles
word=[ ];
re=imagen;
fid = fopen('text.txt', 'wt');%abrimos el txt donde vamos a escribir
load templates%cargamos el template
global templates%hacemos el template global
num_letras=size(templates,2);
while 1
    [fl re]=lines(re);
    imgn=fl;
    [L Ne] = bwlabel(imgn);    
    for n=1:Ne
        [r,c] = find(L==n);
        n1=imgn(min(r):max(r),min(c):max(c));  
        img_r=imresize(n1,[42 24]);
        letter=read_letter(img_r,num_letras);
        word=[word letter];
    end
    fprintf(fid,'%s\n',word);
    word=[ ];
    if isempty(re)
        break
    end    
end
fclose(fid);

winopen('text.txt')
clear all