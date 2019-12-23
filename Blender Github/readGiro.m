function [rotation] = readGiro()

    txtPath = strcat(cd, '\Data\Giro.txt');
    file = fopen(txtPath);
    rotation = fscanf(file,'%f');

end