function [data] = read(file)
%READ Summary of this function goes here
%   Detailed explanation goes here
line = fgetl(file);
row = sscanf(line, '%f,');
disp(row);
data = [];
rowCnt = 1;
while ~feof(file)
    line = fgetl(file);
    in = sscanf(line, '%f,');
    data = [data in];
    rowCnt = rowCnt+1;
end
flose(file);
end

