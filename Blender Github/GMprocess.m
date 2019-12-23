%% Function for a first-order time response of a Stochastic Gaussian-Markov process

function [xk] = GMprocess(Tc1,std1,len)

    w = wgn(len,1,1); %White-Gaussian-Noise
      
    for i=1:len

        if i>1
            xk(i) = exp(0.1/Tc1)*xk(i-1) + std1*w(i); % Discrete time gauss-markov
        else
            xk(i) = std1*w(i);   
        end
    end

end