I = imread('cuadricula.jpg');

Ibw = ~im2bw(I,graythresh(I));

ele = strel('square',2);

imagen_erosionada = imopen(Ibw,ele);


cuadrados = regionprops(imagen_erosionada,'BoundingBox');
 imshow(imagen_erosionada); hold on;
for i = 2 : numel(cuadrados)
    bb = cuadrados(i).BoundingBox;
   rectangle('position',bb,'edgecolor','y');
end
% 
cuadro = imcrop(imagen_erosionada,bb);

figure ,imshow(cuadro)