clc, clear, close all

Tc=4.56;
stdGM=0.0068;
stdWN=sqrt(0.00022);
stdRW=sqrt(4.6398/60);
dt=0.033;
wn=randn(1400,1,1);
vn=randn(1400,1,1);

x1(1)=stdGM*sqrt(1-exp(-2*dt/Tc))*wn(1);
x2(1)=stdRW*sqrt(dt)*wn(1);


for i=2:1400
    
    x1(i)=(1-(1/Tc)*dt)*x1(i-1)+stdGM*sqrt(1-exp(-2*dt/Tc))*wn(i);
    x2(i)=x2(i-1)+stdRW*sqrt(dt)*wn(i);
    y(i)=[1 1]*[x1(i); x2(i)]+(stdWN/sqrt(dt))*vn(i);
    
end
    