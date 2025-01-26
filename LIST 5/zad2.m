%Zad B
%Oskar Chrostowski
clear all
q1 = 10^(-6);
q2 = (-2) * 10^(-6);
q3 = 3.2 * 10^(-6);

r1 = [1,0,0];
r2 = [0,1,0];
r3 = [0,0,1];

F1 = coulomb(r2,q2,r1,q1);
F2 = coulomb(r3,q3,r1,q1);
FWyp = F1 + F2;
FWypWartosc = norm(FWyp);

hold on
plot3(1,0,0,"*")
plot3(0,1,0,"*")
plot3(0,0,1,"*")
quiver3(r1(1),r1(2),r1(3),10*F1(1),10*F1(2),10*F1(3))
quiver3(r1(1),r1(2),r1(3),10*F2(1),10*F2(2),10*F2(3))
quiver3(r1(1),r1(2),r1(3),10*FWyp(1),10*FWyp(2),10*FWyp(3))
text(0.5,0.5,"Fwyp = 0.0126 N")
legend("Q1","Q2","Q3","F1","F2","FWyp")
hold off
