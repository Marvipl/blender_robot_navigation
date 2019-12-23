%% Function for a Random-Walk process

function [xk] = RWprocess1(std1,dt,len)

alphaw=std1*sqrt(dt);
w = alphaw*randn(len,1,1); %White-Gaussian-Noise
      
    for i=1:len

        if i>1
            xk(i) = xk(i-1)+w(i); % Discrete time Random-Walk
        else
            xk(i) = w(i);   
        end
    end

end