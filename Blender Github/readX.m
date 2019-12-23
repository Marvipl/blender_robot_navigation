function [X] = readX()

    txtPath = strcat(cd, '\Data\X.txt');
    file = fopen(txtPath);
    X = fscanf(file,'%f');

end