% Change filename and format
fileID = fopen('Data/measurement_772.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];

%Change timestep
delT = 0.1;
x = zonotope([[0;0;0;0], eye(4)]);
A = [1 0 delT 0.5*delT*delT;
                0 1 0 0
                0 0 1 delT;
                0 0 0 1];
t = 0;
C= eye(4);
W = zonotope([zeros(4,1), diag([0.4;0.4;0.4;0.4])]);
V = zonotope([zeros(4,1), diag([0.1;0.1;0.1;0.1])]);
index = 1;
hold all;
while ~feof(fileID)
    measurement = fscanf(fileID, formatSpec, sizeIn);
%     noise = rand(model.dim_y,1).*transpose(measurement)/100;
%     noise = noise + rand(model.dim_y, 1);
    x = A*x + W;
    z = transpose(measurement);
    x_2 =C*(zonotope([z, V.generators]));
    if index == 1
        x = x_2;
    else
        zonol{1} = x;
        zonol{2} = x_2;
        plot(zonol{1},[1,2],'r');
        plot(zonol{2},[1,2],'r-+');
        x = andAveraging(zonol);
    end
    disp(x.center);
    disp(x_2.center);
    index = index+1;
    
%     [upper,lower] = estimator.estimate(z);
%     infimum_arr(:, index) = lower;
%     supremum_arr(:,index) = upper;
%     z_arr(:,index) = z;
%     t_arr(index) = t;
%     t= t+ delT;
%     index = index+1;
end

% titles = ["X", "Y", "Velocity_x", "Acceleration"];
% tiledlayout(model.dim_x,1);
% for i = 1:model.dim_x
%     ax = nexttile;
%     plot(ax, t_arr, infimum_arr(i,:), 'r');
%     hold on;
%     plot(ax, t_arr, supremum_arr(i,:), 'g');
%     hold on;
%     plot(ax, t_arr, z_arr(i,:), 'b');
%     hold on;
%     title( ax, titles(i));
%     
% end
fclose(fileID);