%%Write Txt

function writevtxt(data,path,filename)

%path=cd;
%filename='XwError.txt';
file=strcat(path,'\',filename);
len=length(data);
fileID = fopen(file,'w');
fprintf(fileID,'%2.4f\r\n',data);
fclose(fileID);
