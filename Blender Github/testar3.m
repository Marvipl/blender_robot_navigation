clc, clear, close all
%Simulate AR(3)
T     = 1000;                         %Set how many observations you need
y     = ones(T,1);                    %Create a vector of dim Tx1 to store the simulations in
y(1)  = 0.1;                            %Set the first obs. to 1    
y(2)  = 0.15;                          %Set the second obs. to 0.5
y(3)  = -0.5;                          %Set the third obs. to 1.5
rho1=2.582;
rho2=-2.166;
rho3=0.585;                        %Set the value of rho3 (coefficient on y(t-3))
sigma = 1;                            %Set the value of the s.d. of the error term
mu_e  = 0;                            %Set the value of the mean of the error term
eps   = normrnd(mu_e, sigma, T, 1);   %Creat a vector of normal random numbers with mean, mu_e and s.d. sigma. Dimension is Tx1 

for t=4:1000;                         %Start the loop running from obs. 4 to 1000 
    y(t) = rho1*y(t-1) + rho2*y(t-2) + rho2*y(t-3) + eps(t);    %The AR(3) model
end

%Plot the series
figure
plot(y);
title('AR(3)');
xlabel('t')
ylabel('y(t)')