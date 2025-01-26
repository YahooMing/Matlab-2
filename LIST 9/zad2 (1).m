%Oskar Chrostowski

clear all;
close all;
D = -1:0.1:1;
[X,Y] = meshgrid(-1:0.1:1);

%zakładając że q = 1 to w naszym przypadku k = 1
R1=((X-0.25).^2+(Y-0.25).^2).^0.5;
R2=((X+0.25).^2+(Y+0.25).^2).^0.5;
R3=((X+0.25).^2+(Y-0.25).^2).^0.5;
R4=((X-0.25).^2+(Y+0.25).^2).^0.5;

%Potencjał elektryczny
V=(1./R3)+(1./R4)-(1./R1)-(1./R2);
figure(1)
[DX,DY] = gradient(-V,0.1,0.1);
contour(D,D,V, 20);
hold on;
quiver(D,D,DX,DY);
hold off;
colorbar;
title('Linie stałego potencjału V i wektory natężenia pola E dipola');

%Wykres potencjału
figure(2)  
surf(X,Y,V);
axis off;
colorbar;
title("Wykres 3-D potencjału V dipola");