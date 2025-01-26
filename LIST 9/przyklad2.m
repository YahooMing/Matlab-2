%Oskar Chrostowski

clear all;clf;clc
r=-1:0.1:1; %zakres
[x,y]=meshgrid(r);
R1=(x.^2+(y-0.25).^2).^0.5;
R2=(x.^2+(y+0.25).^2).^0.5;

%Zakładamy, że q/(4 pi eo) = 1
V=(1./R1)-(1./R2);
figure(1) %Potencjał V i natężenia pola E
[px, py] = gradient(-V,0.1,0.1);
contour(r,r,V,20);

hold on
quiver(r,r,px,py)
hold off
title('Linie stałego potencjału V i wektory natężenia pola E dipola')
figure (2) %wykres 3d potencjału
surf(x,y,V);
axis off;
view(- 37.5,20)
colorbar;
title('Wykred 3-D potencjału V dipola')