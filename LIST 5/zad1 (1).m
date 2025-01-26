%Zad A
%Oskar Chrostowski
clear all
q = 10^(-9); %nano coulomb
a = 0.01 ; %metry
r1 = [0,0];
r2 = [0.01,0];
r3 = [0,0.01];
r4 = [0.01, 0.01];

F1 = coulomb(r2,q,r1,q);
F2 = coulomb(r3,q,r1,q);
F3 = coulomb(r4,q,r1,q);
FWyp = F1 + F2 + F3;
FWypWart = norm(FWyp);
hold on
plot(0,0,"*",a,0,"*",0,a,"*",a,a,"*")
quiver(r1(1),r1(2),10*FWyp(1),10*FWyp(2)) %skalowanie wektora siły wypadkowej razy 10
xlim([-a 2*a])
ylim([-a 2*a])
text(0, 0.005, "FWyp = 0.000172039943918282 N")
hold off
