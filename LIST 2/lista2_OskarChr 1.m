%Oskar Chrostowski
%Program do rysowania odpowiednich wykresów, ich niepewności oraz
%aproksymacji danych z podanego doświadczenia.

clear all
%Deklaracja wszystkich potrzebnych zmiennych
t=linspace(0,1.1,11);
dt=0.05;
x= [33.5 29.5 26.5 21.5 20.5 17.5 14.5 11.5 8.5 5.5 2.5 ];
dx = 0.5;
%Aproksymacja:
p = polyfit(t,x,1); 
f=polyval(p,t);
%Wyliczenie prędkości
V=diff(f)/diff(t)/100;
%Wyliczenie niepewności standardowej
n = 11;
D=n * sum(t.^2) - sum(t).^2;
a = (n * sum(t.*x)-sum(x).*sum(t))/D;
b = ((sum(t.^2)*sum(x))-(sum(t)*sum(x.*t)))/D;
Sy = sqrt(sum((x-(a * t + b)).^2)/(n-2) );
ua =ceil(Sy * sqrt(n/D)*10)/10; 
ub = ceil(10.* Sy.* sqrt(sum(t .^ 2) / D)) / 10;

subplot(1,2,1)
hold on
errorbar(t,x,dx,dx,dt,dt,'o')
plot(t,f)
plot(t,t*(a+ua)+b,"m--",t,t*(a-ua)+b,"m--")
xlabel("t[s]")
ylabel("x[cm]")
hold off

subplot(1,2,2)
hold on
plot(t,f)
plot(t, t*(a+ua)+b+ub, "m--", t, (a - ua) * t + (b-ub),"m--")
tekst1=['\it{x} \rm{=} ' num2str(p(1),3) '\it{t} \rm{+}' num2str(p(2),3) ];
text(1,30,tekst1,"FontSize",16)
xlabel("t[s]")
ylabel("x[cm]")
hold off

%niestety nie zdążyłem dopisać "text" do drugiego wykresu 