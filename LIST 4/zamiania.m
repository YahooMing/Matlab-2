function [x,y] = zamiania(x,y)
%Funkcja zamieniająca wartość x z y 
%Składnia wywołania [x,y] = zamiana(x) lub zamiana(x)
%Dane wejściowe: x = liczba rzeczywista, y = liczba rzeczywsita
%Wynik: y = x; x = y
%Autor: Oskar Chrostowski
%---------------------

temporary = x;
x = y
y = temporary
end