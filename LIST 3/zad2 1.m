%Oskar Chrostowski

clear all
pompa = importdata("pompa.dat");
t = pompa(:,1);
p = pompa(:,2);

%Dopasowanie danych do zależności podanej w treści zadania
wsp = polyfit(t,log(p),1); 
tau = (1/wsp(1)) * (-1);
p0 = exp(wsp(2));
t2= linspace(0,20,100);
y = exp(wsp(1)*t2)*exp(wsp(2)); %ostateczny wzór funkcji

%rysowanie wykresu liniowego
figure1 = figure
subplot(1,2,1)
hold on
plot(t,p,"o",t2,y)
title("Wykres liniowy funkcji p(t)")
xlabel("t")
ylabel("p")
text(10,600,"781.14*exp(-t/2.37)")
hold off

%rysowanie wykresu półlogarytmicznego
subplot(1,2,2)
os = gca; 
semilogy(t,p,"o")
hold on
plot(t2,y)
os.YAxisLocation = 'right';
title("Wykres półlogarytmiczny funkcji p(t)")
xlabel("t")
ylabel("p")
grid on
hold off

%zapisywanie wykresów w obu formatach
saveas(figure1,'wykresyJPG.jpg')
saveas(figure1,'wykresyPNG.png')