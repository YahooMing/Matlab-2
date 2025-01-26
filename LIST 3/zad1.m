%Oskar Chrostowski
%Program do wyliczania wyrazów ciągu Fibonacciego i zapisywania ich do
%pliku

clear all
tabf=[]; %tablica na pierwsze 16 liczb ciągu
numer = [];

%Generowanie liczb
for n = 0:15
    Fn= 1/sqrt(5) * (((1+sqrt(5))/2)^n - (((1-sqrt(5))/2)^n ));
    %według treści zadania "zapisać w poniższym formacie" nie jest
    %okreslone aby było to w dwóch kolumnach
    numer = [numer;("F"+num2str(n)+" = "+num2str(Fn)) ];
end
%tworzenie tabeli z tablicy numer
wiersz = table(numer);
%zapisywanie do pliku
writetable(wiersz,"fibonacci.txt")
writetable(wiersz,"fibonacci.xlsx")