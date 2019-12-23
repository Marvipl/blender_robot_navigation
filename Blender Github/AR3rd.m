%%Auto-Regressive 3rd order simulation error

function [xk] = AR3rd(betaw,alpha1,alpha2,alpha3,len)

    w = betaw*randn(len,1,1); %White-Gaussian-Noise

    for i=1:len
        if i>3
            xk(i) = -(alpha1*xk(i-1)+alpha2*xk(i-2)+alpha3*xk(i-3))+w(i); % Discrete Ar third order
        else
            if i>2
                xk(i) = -(alpha1*xk(i-1)+alpha2*xk(i-2))+w(i);
            else
                if i>1
                    xk(i) = -(alpha1*xk(i-1))+w(i);
                else
                    xk(i) = w(i); 
                end
            end
        end
    end
    xk=xk';
    
end