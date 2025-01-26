function [suma] = szereg(x)
%Funkcja która wypisuje wynik sumy szeregu taylora
%Składnia wywołania [suma] = szereg(x) lub szereg(x)
%Dane wejściowe: x = liczba rzeczywista
%Wynik: suma = szereg taylora
%Autor: Oskar Chrostowski
%---------------------
suma=0;
i=0;
while true
    wynik = (x^i)/factorial(i);
    if(wynik <= 10^(-6))
        break
    end
    suma = wynik + suma;
    i=i+1;
end
end