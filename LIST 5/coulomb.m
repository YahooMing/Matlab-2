function [F] = coulomb(r1,q1,r2,q2)
%funkcja która liczy siłę Coulomba działającą miedzy dwoma ładunkami.
%Autor Oskar Chrostowski

k = 8.9875.*10^9; %[Nm2/C2]
F = (k.*q1.*q2)./(norm(r2-r1).^3).*(r2-r1);

end