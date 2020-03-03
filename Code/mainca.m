fileID = fopen('Data/measurement_with_noise.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];
delT = 0.1;
model = CAModel(delT);
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
    [upper,lower] = estimator.estimate(z([1,2,4]));
    infimum_arr(:, index) = lower;
    supremum_arr(:,index) = upper;
    z_arr(:,index) = [z([1:3]);0;z(4)];
    t_arr(index) = t;
    t= t+ delT;
    disp(index);
    index = index+1;
end

titles = ["X", "Y", "Velocity_x", "Velocity_y","Acceleration"];
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