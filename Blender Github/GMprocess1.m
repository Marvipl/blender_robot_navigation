%% Function for a first-order time response of a Stochastic Gaussian-Markov process

function [xk] = GMprocess1(Tc1,std1,dt,len)

alphaw=std1*sqrt((1-exp(-2*dt/Tc1)));
w = alphaw*randn(len,1,1); %White-Gaussian-Noise
      
    for i=1:len

        if i>1
            xk(i) = (1-(1/Tc1)*dt)*xk(i-1)+w(i); % Discrete time gauss-markov
        else
            xk(i) = w(i);   
        end
    end

end