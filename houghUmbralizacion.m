    %%% ATENCION: Este código ha sido extraido en su mayor parte de los
    %%% apuntes de percepción. 
clear; clc; close all; 

I = imread('CuadriculaIvan.jpg');
Umbral = graythresh(I); %Obtenemos el umbral. 
I = im2bw(I, Umbral);
max_dist = sqrt(size(I,1)^2 + size(I,2)^2);
imshow(I,[]);
[E, thresOut] = edge(I,'canny');
figure,imshow(E);
[H, theta, rho] = hough(E);

% Obtenemos las lineas
peaks = houghpeaks(H,50); % 100 es el número de lineas
lines = houghlines(E, theta, rho,peaks,'FillGap',max_dist);
figure,imshow(I,[]);

for k = 1:length(lines),
    xy = [lines(k).point1; lines(k).point2];
    line(xy(:,1),xy(:,2),'LineWidth',1.5,'Color','g');
end