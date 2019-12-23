clc, clear, close all

X=readX;
Y=readY;
R=readRotation;
G=readGiro;

len=length(R);

%
figure (1)
subplot(2,1,1), plot(1:len, R,'b--');
subplot(2,1,2), plot(X,Y,'r*');


%Plot Giroscopio
figure (2)
plot(1:len,G);

%Estimação da posição por dados do giroscópio

psi0=pi/2;
psi(1)=psi0;
for i=1:len
    psi(i+1)=G(i)*0.033+psi(i);
end
figure (3)
plot(1:len, psi(1:1400))

figure(4)
plot(1:len, R-psi(1:1400)')

