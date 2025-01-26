function [wynik] = energia(x)
%Funkcja która liczy E=mc^2
%Składnia wywołania [wynik] = energia(x) lub energia(x)
%Dane wejściowe: x = liczba rzeczywista
%Wynik: wynik = energia
%Autor: Oskar Chrostowski
%---------------------
wynik = x.* (2.9979 * 10^8)^2;
%logspace został użyty w wywołaniu funkcji
subplot(1,3,1)
semilogy(wynik,x)
subplot(1,3,2)
semilogx(wynik,x)
subplot(1,3,3)
loglog(wynik,x)
end