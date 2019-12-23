%%Auto-Regressive 1st order simulation error

function [xk] = AR1st(betaw,alpha1,len)

    w = betaw*randn(len,1,1); %White-Gaussian-Noise

    for i=1:len
      
        if i>1
            xk(i) = -(alpha1*xk(i-1))+w(i);
        else
            xk(i) = w(i); 
        end
         
    end
    xk=xk';
    
end