% Select file and format
fileID = fopen('Data/s3_va.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];

%Change time step
delT = 0.1;

model = SingerModel(delT, delT*5);

%Select Estimator or SegmentMinimzer or VolumeMinimizer
estimator = SegmentMinimizer(model);
z_arr =[[]];
infimum_arr =[[]];
supremum_arr = [[]];
t_arr = [[]];
t = 0;
index = 1;
while ~feof(fileID)
    measurement = fscanf(fileID, formatSpec, sizeIn);
    z = transpose(measurement);
    [upper,lower] = estimator.estimate(z([1,2])); % Select the inputs
    infimum_arr(:, index) = lower;
    supremum_arr(:,index) = upper;
    z_arr(:,index) = [z(1:4);0;0];
    t_arr(index) = t;
    t= t+ delT;
    disp(index);
    index = index+1;
end

titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];
%tiledlayout(model.dim_x,1);
for i = 1:model.dim_x
    %ax = nexttile;
    figure(i);
    plot(t_arr, infimum_arr(i,:), 'r');
    hold on;
    plot(t_arr, supremum_arr(i,:), 'g');
    hold on;
    %if i<= size(z,1)
        plot(t_arr, z_arr(i,:), 'b');
        hold on;
    %end
    
    %title( ax, titles(i));
    
end