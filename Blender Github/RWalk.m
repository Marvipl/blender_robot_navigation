clc, clear, close all
Z(1)=randi([-1,1]);
n=50;
scale=0.01;

for i=1:1
    for i=2:1400
      Z(i)=Z(i-1)+randi([-1,1]);
    end

    plot(1:1400,scale*Z)
    hold on
    
end
hold off