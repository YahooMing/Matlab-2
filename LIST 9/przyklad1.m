%Oskar Chrostowski

clear all;
close all;
EPS0=8.854e-12;
p=1*10^(-12);
[x,z]=meshgrid(0.1:0.001:0.6, -0.25:0.001:0.25);
%odległość r
r=sqrt(x.^2 + z.^2);
%Potencjał dipola elektrycznego
V=p*(z./r)./(4*pi*EPS0*r.^2);
figure (1);
pcolor(x,z,V);
xlabel('x (m)');
ylabel('z (m)');
title('Potencjał elektrostatyczny w pobliżu dipola w płaszczyźnie y=0');
shading interp;
colorbar;
figure (2);
contour(x,z,V,'linewidth',3)
xlabel('x (m)')
ylabel('z (m)')
title('Linie ekwipotencjalne');
