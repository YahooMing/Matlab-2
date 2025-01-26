%Długość wektora

%Funkcja, która oblicza długość zadanego wektora
%(wektor kolumnowy lub rzędowy)

function mag = wektorDlug(wektor)
[m,n]=size(wektor);
if (m~=1 && (n~=1))
    mag = 0;
    disp('Błąd - niewłaściwy rozmiar wektora');
else
    mag = sqrt(sum(wektor.^2));
end
