%Oskar Chrostowski

clear all
kat = 30;
a=0.1; %długość pręta
Q=10^-9; %ładunek pręta
rho = Q/a; %liniowa gęstość ładunku
EPS0=8.85418781*10^-12; %stała epsilon 0
dl = 0.001*a; %infitezymalnie mały 
yline = -a*cosd(kat) : dl : a/2; %punkty do rysowania pręta w osi x
xline = yline*cotd(kat); %punkty do rysowania pręta w osi y
v = -0.825*a: 0.15*a : 0.975*a; %v i u to punkty służące do wyliczenia siatki, aby wektory nie zostały umieszczone na pręcie
u = -0.525*a: 0.15*a : 0.675*a;
[x,y] = meshgrid(v,u); %siatka x y
[M,N] = size(x); 
for i = 1 : M %pętla ma na celu przydzielenia każdemu punktowi na osi wektora wypadkowego innych wektorów oddziałujących na ten punkt z poszczególnych miejsc pręta 
    for j = 1 : N
        for t = 1 : length(xline)
            r(i,j,t,:) = [x(i,j) - xline(t) y(i,j) - yline(t)];
            rabs(i,j,t) = wektorDlug(r(i,j,t,:)); 
            runit(i,j,t,:) = r(i,j,t,:)/rabs(i,j,t);
            E(i,j,t,:) = rho*dl*runit(i,j,t,:)/(4*pi*EPS0*rabs(i,j,t)^2);
        end;
        Etotx(i,j) = sum(E(i,j,:,1));   
        Etoty(i,j) = sum(E(i,j,:,2));
    end;
end;
line([-a*cosd(kat)/2 a*cosd(kat)/2],[-a*sind(kat)/2 a*sind(kat)/2], 'Color','r'); %rysuje pręt 
hold on;
quiver(v,u,Etotx,Etoty); %rysuje siatke wektorów 
hold off;
%opis wykresu
title('Natężenie Pola Elektrycznego');
xlabel('x[m]');
ylabel('y[m]');