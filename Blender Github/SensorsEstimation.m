clc, clear ,close all

Tc1=4.56;
std1=0.0068;
std2=sqrt(0.00022);
std3=4.6398;


Xk1=GMprocess1(Tc1,std1,0.033,1400);
Xk2=RWprocess1(std3,0.033,1400);
Xk3=WNprocess1(std2,1400);

plot(1:1400,Xk1);
figure
plot(1:1400,Xk2);
figure
plot(1:1400,Xk3);

Xk=Xk1+Xk2+Xk3';

figure
plot(1:1400,Xk);

