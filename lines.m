function [fl re]=lines(im_texto)
im_texto=clip(im_texto);%devuelve una matriz recortada o recortada que contiene solo los valores de x
num_filas=size(im_texto,1);
for s=1:num_filas
    if sum(im_texto(s,:))==0
        nm=im_texto(1:s-1, :); 
        rm=im_texto(s:end, :);
        fl = clip(nm);
        re=clip(rm);
       
        break
    else
        fl=im_texto;
        re=[ ];
    end
end

function img_out=clip(img_in)
[f c]=find(img_in);%devuelve un vector que contiene los índices lineales de cada elemento distinto de cero
img_out=img_in(min(f):max(f),min(c):max(c));