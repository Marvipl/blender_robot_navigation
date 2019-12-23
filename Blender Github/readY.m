function [Y] = readY()

    txtPath = strcat(cd, '\Data\Y.txt');
    file = fopen(txtPath);
    Y = fscanf(file,'%f');

end