% Select file and format
fileID = fopen('Data/measurement_772.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];

%Change time step
delT = 0.1;

model = CAModel(delT);

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
    z_arr(:,index) = z;
    t_arr(index) = t;
    t= t+ delT;
    disp(index);
    index = index+1;
end

titles = ["X", "Y", "Velocity_x","Acceleration"];
tiledlayout(model.dim_x,1);
for i = 1:model.dim_x
    ax = nexttile;
    plot(ax, t_arr, infimum_arr(i,:), 'r');
    hold on;
    plot(ax, t_arr, supremum_arr(i,:), 'g');
    hold on;
    plot(ax, t_arr, z_arr(i,:), 'b');
    hold on;
    title( ax, titles(i));
    
end