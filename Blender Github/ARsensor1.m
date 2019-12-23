clc, clear, close all

%Parameters
dt=1/30; %Sample-Time
x=readX; %Robot-X
y=readY; %Robot-Y
psi=readRotation; %Robot-psi
len=length(x); %Vector Size

%AR Parameters
%X
xbetaw=sqrt(2.129*10^-10); %Variance of white-noise
xalpha1=-1; %alpha1
%Y
ybetaw=sqrt(1.148*10^-9); %Variance of white-noise
yalpha1=-1; %alpha1
%psi
rbetaw=sqrt(8.066*10^-11); %Variance of white-noise
ralpha1=-1; %alpha1

figure(1)
subplot (311), plot(1:len,x)
title('Position X');
xlabel('steps')
ylabel('meters')
subplot (312), plot(1:len,y)
title('Position Y');
xlabel('steps')
ylabel('meters')
subplot (313), plot(1:len,psi)
title('Angle Psi');
xlabel('steps')
ylabel('rad')

%Velocity X
aux=zeros(len,1);
aux(1:(len-1))=x(2:len);
dx=(aux-x)/dt;
%Velocity Y
aux=zeros(len,1);
aux(1:(len-1))=y(2:len);
dy=(aux-y)/dt;
%Velocity psi
aux=zeros(len,1);
aux(1:(len-1))=psi(2:len);
dpsi=(aux-psi)/dt;
%Velocities Plots
figure(2)
subplot (311), plot(1:len,dx)
title('Veocity X');
xlabel('steps')
ylabel('meters/sec')
subplot (312), plot(1:len,dy)
title('Veocity Y');
xlabel('steps')
ylabel('meters/sec')
subplot (313), plot(1:len,dpsi)
title('Ang Velocity');
xlabel('steps')
ylabel('rad/sec')

%Acceleration X
aux=zeros(len,1);
aux(1:(len-1))=dx(2:len);
ddx=(aux-dx)/dt;
%Acceleration Y
aux=zeros(len,1);
aux(1:(len-1))=dy(2:len);
ddy=(aux-dy)/dt;
%Acceleration Plots
figure(3)
subplot(211), plot(1:len,ddx)
title('Acc X');
xlabel('steps')
ylabel('meters/{sec}^2')
subplot(212), plot(1:len,ddy)
title('Acc Y');
xlabel('steps')
ylabel('meters/{sec}^2')

%Errors
xk=AR1st(xbetaw,xalpha1,len);
yk=AR1st(ybetaw,yalpha1,len);
psik=AR1st(rbetaw,ralpha1,len);

%Add to the original signal
Accx=ddx+xk;
Accy=ddy+yk;
Velpsi=dpsi+psik;

%Velocity X
Velx(1)=0;
for i=2:len
    Velx(i,1)=Velx(i-1)+Accx(i)*dt;
end
Velx(3:len)=Velx(2:len-1);
%Velocity Y
Vely(1)=0;
for i=2:len
    Vely(i,1)=Vely(i-1)+Accy(i)*dt;
end
Vely(3:len)=Vely(2:len-1);

%Position X
PosiX(1)=0;
for i=2:len
    PosiX(i,1)=PosiX(i-1)+Velx(i)*dt;
end
PosiX(3:len)=PosiX(2:len-1);
%Position Y
PosiY(1)=0;
for i=2:len
    PosiY(i,1)=PosiY(i-1)+Vely(i)*dt;
end
PosiY(3:len)=PosiY(2:len-1);
%Angle Psi
Angle(1)=0;
for i=2:len
    Angle(i,1)=Angle(i-1)+Velpsi(i)*dt;
end
Angle(3:len)=Angle(2:len-1);
Angle=Angle+ones(len,1)*pi/2;

%X plots
figure(4)
subplot(311), plot(1:len,ddx)
title('Acc X');
axis([0 len -0.15 0.15]);
subplot(312), plot(1:len,Accx)
axis([0 len -0.15 0.15]);
subplot(313), plot(1:len,Accx-ddx)

figure(5)
subplot(311), plot(1:len,dx)
title('Velocity X');
subplot(312), plot(1:len,Velx)
subplot(313), plot(1:len,Velx-dx)

figure(6)
subplot(311), plot(1:len,x)
title('Position X');
subplot(312), plot(1:len,PosiX)
subplot(313), plot(1:len,PosiX-x)

%Y plots
figure(7)
subplot(311), plot(1:len,ddy)
title('Acc Y');
axis([0 len -0.15 0.15]);
subplot(312), plot(1:len,Accy)
axis([0 len -0.15 0.15]);
subplot(313), plot(1:len,Accy-ddy)

figure(8)
subplot(311), plot(1:len,dy)
title('Velocity Y');
subplot(312), plot(1:len,Vely)
subplot(313), plot(1:len,Vely-dy)

figure(9)
subplot(311), plot(1:len,y)
title('Position Y');
subplot(312), plot(1:len,PosiY)
subplot(313), plot(1:len,PosiY-y)

%Angle plots

figure(10)
subplot(311), plot(1:len,dpsi)
title('Angle Vel');
subplot(312), plot(1:len,Velpsi)
subplot(313), plot(1:len,Velpsi-dpsi)

figure(11)
subplot(311), plot(1:len,psi)
title('Angle');
subplot(312), plot(1:len,Angle)
subplot(313), plot(1:len,Angle-psi)

%Write 'X'
path=strcat(cd,'\Data');
writevtxt(PosiX,path,'MatXwError.txt');
%Write 'Y'
writevtxt(PosiY,path,'MatYwError.txt');
%Write 'Angle'
writevtxt(Angle,path,'MatAngwError.txt');


%Plot Traj
figure
plot(x,y)
title('Original Traj X,Y');
figure
plot(PosiX,PosiY)
title('Modified Traj X,Y');
