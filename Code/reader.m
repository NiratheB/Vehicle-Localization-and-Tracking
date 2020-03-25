% Change filename and format
fileID = fopen('Data/s1_cv.txt');
formatSpec = '%f %f %f %f';
sizeIn = [4,1];

%Change timestep
delT = 0.1;
index = 1;
hold all;
z_arr =[[]];
t_arr = [[]];
t= 0;
while ~feof(fileID)
    % get measurement
    z = fscanf(fileID, formatSpec, sizeIn);
    disp(z);
    %z = transpose(measurement);
    z_arr(:,index) = z;
    t_arr(:,index) = t;
    t= t+ delT;
    index = index+1;
end

titles = ["X", "Y", "Velocity_x", "Velocity_y"];
for i = 1:4
    figure(i);
    figure('Name', titles(i));
    plot(t_arr, z_arr(i,:), 'b');
    
end
fclose(fileID);