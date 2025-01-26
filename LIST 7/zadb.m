%Oskar Chrostowski

clear all
a=0.1; %długość pręta
Q=10^-9; %ładunek pręta
rho = Q/a; %liniowa gęstość ładunku
EPS0=8.85418781*10^-12; %stała epsilon 0
dl = 0.001*a; %infitezymalnie mały

%Dla pręta poziomego
xline = -a/2 : dl : a/2; %punkty do rysowania pręta w osi x
yline = zeros (1,length (xline)); %punkty do rysowania pręta w osi y
%Dla pręta pionowego
yline1 = -a/2 : dl : a/2; 
xline1 = zeros (1,length (yline1)); 
%Dla pręta pod kątem
kat=30;
yline2 = -a*cosd(kat) : dl : a/2; 
xline2 = yline2*cotd(kat); 

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

for i = 1 : M %pętla ma na celu przydzielenia każdemu punktowi na osi wektora wypadkowego innych wektorów oddziałujących na ten punkt z poszczególnych miejsc pręta 
    for j = 1 : N
        for t = 1 : length(xline1)
            r1(i,j,t,:) = [x(i,j) - xline1(t) y(i,j) - yline1(t)];
            rabs1(i,j,t) = wektorDlug(r1(i,j,t,:)); 
            runit1(i,j,t,:) = r1(i,j,t,:)/rabs1(i,j,t);
            E1(i,j,t,:) = rho*dl*runit1(i,j,t,:)/(4*pi*EPS0*rabs1(i,j,t)^2);
        end;
        Etotx1(i,j) = sum(E1(i,j,:,1));   
        Etoty1(i,j) = sum(E1(i,j,:,2));
    end;
end;

for i = 1 : M %pętla ma na celu przydzielenia każdemu punktowi na osi wektora wypadkowego innych wektorów oddziałujących na ten punkt z poszczególnych miejsc pręta 
    for j = 1 : N
        for t = 1 : length(xline2)
            r2(i,j,t,:) = [x(i,j) - xline2(t) y(i,j) - yline2(t)];
            rabs2(i,j,t) = wektorDlug(r2(i,j,t,:)); 
            runit2(i,j,t,:) = r2(i,j,t,:)/rabs2(i,j,t);
            E2(i,j,t,:) = rho*dl*runit2(i,j,t,:)/(4*pi*EPS0*rabs2(i,j,t)^2);
        end;
        Etotx2(i,j) = sum(E2(i,j,:,1));   
        Etoty2(i,j) = sum(E2(i,j,:,2));
    end;
end;
subplot(1,3,1)
line([-a/2 a/2],[0 0], 'Color','r'); %rysuje pręt 
hold on;
quiver(v,u,Etotx,Etoty); %rysuje siatke wektorów 
hold off;
%opis wykresu
title('Natężenie Pola Elektrycznego');
xlabel('x[m]');
ylabel('y[m]');

subplot(1,3,2)
line([0 0],[-a/2 a/2], 'Color','r');
hold on;
quiver(v,u,Etotx1,Etoty1); %rysuje siatke wektorów 
hold off;
%opis wykresu
title('Natężenie Pola Elektrycznego');
xlabel('x[m]');
ylabel('y[m]');

subplot(1,3,3) %źle wyrysowuje pręt pod kątem i niestety nie wiem dlaczego, więc zamieszczam plik w którym jest poprawnie rysowanie (zad1b3.m)
line([-a*cosd(kat)/2 a*cosd(kat)/2],[-a*sind(kat)/2 a*sind(kat)/2], 'Color','r'); %rysuje pręt 
hold on;
quiver(v,u,Etotx2,Etoty2); %rysuje siatke wektorów 
hold off;
%opis wykresu
title('Natężenie Pola Elektrycznego');
xlabel('x[m]');
ylabel('y[m]');