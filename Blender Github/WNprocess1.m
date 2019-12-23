%% Function for a White-Noise process

function [w] = WNprocess1(std1,len)

alphaw=std1^2;
w = alphaw*randn(len,1,1); %White-Gaussian-Noise

end