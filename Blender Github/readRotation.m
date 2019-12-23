function [rotation] = readRotation()

    txtPath = strcat(cd, '\Data\Rotation.txt');
    file = fopen(txtPath);
    rotation = fscanf(file,'%f');

end