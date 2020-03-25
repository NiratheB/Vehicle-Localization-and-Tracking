% Change filename and format
fileID = fopen('Data/measurement_772.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];

%Change timestep
delT = 0.1;
dim_x = 2;
dim_y = 2;
x = conZonotope([zeros(dim_x,1), eye(dim_x)], zeros(1,dim_x), 0);

A = [1 0;
    0  1];
t = 0;
C= [1 0;
    0 1];
W = conZonotope([zeros(dim_x,1), diag([0.4;0.4])],zeros(1,dim_x),0);
V = conZonotope([zeros(dim_y,1), diag([0.1;0.1])],zeros(1,dim_y),0);
index = 1;
hold all;
z_arr =[[]];
infimum_arr =[[]];
supremum_arr = [[]];
t_arr = [[]];
while ~feof(fileID)
    % get measurement
    measurement = fscanf(fileID, formatSpec, sizeIn);
    z = transpose(measurement);
    z = z(1:2);
    % predict x
    x_p = A*x + W;
    
    % update x
    if index == 1
        x = z + (-1*V);
    else
        % intersect x_p and m
        x_m = z + (-1*V);
 
        x = generalized_intersection(x_p, x_m, C);
    end
     bounds = interval(x);
    %get upper and lower bounds
    upper = supremum(bounds);
    lower = infimum(bounds);
    estimate = (upper+lower)/2;
    error = estimate - z;
    infimum_arr(:, index) = lower;
    supremum_arr(:,index) = upper;
    z_arr(:,index) = z;
    t_arr(index) = t;
    t= t+ delT;
    disp(error);
    index = index+1;
    x = x.reduce('girard', 20,5);
end

titles = ["X", "Y", "Velocity_x", "Acceleration"];
tiledlayout(dim_x,1);
for i = 1:dim_x
    ax = nexttile;
    plot(ax, t_arr, infimum_arr(i,:), 'r');
    hold on;
    plot(ax, t_arr, supremum_arr(i,:), 'g');
    hold on;
    plot(ax, t_arr, z_arr(i,:), 'b');
    hold on;
    title( ax, titles(i));
    
end
fclose(fileID);