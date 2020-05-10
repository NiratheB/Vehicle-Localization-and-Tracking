% Select file and format
fileID = fopen('Data/s3_va.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];

%Change time step
delT = 0.1;

model = PointMassModel2(delT);

%Select Estimator or SegmentMinimzer or VolumeMinimizer
estimator = SegmentMinimizer(model);
index = 1;
t=0;
infimum_arr = [];
supremum_arr = [];
cv_infimum_arr = [];
cv_supremum_arr = [];
z_arr = [];
t_arr = [];
while ~feof(fileID)
    measurement = fscanf(fileID, formatSpec, sizeIn);
    z = transpose(measurement);
    [upper,lower] = estimator.estimate(z([1,2])); % Select the inputs
    infimum_arr = [infimum_arr lower];
    supremum_arr = [supremum_arr  upper];
    z_arr = [z_arr [z(1:4);0;0]];
    t_arr = [t_arr t];
    t= t+ delT;
    disp(index);
    index = index+1;
end
fontsize = 18;
titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];
set(gcf, 'DefaultAxesFontSize', fontsize);
set(gcf, 'Position', get(0, 'Screensize'));
%f=tiledlayout(3, 2);

for i = 1:model.dim_x
    %ax = nexttile;
    set(gcf, 'DefaultAxesFontSize', fontsize);
    set(gcf, 'Position', get(0, 'Screensize'));
    f = figure(i);
    plot(t_arr, infimum_arr(i,:), 'b');
    hold on;
    plot(t_arr, supremum_arr(i,:), 'r');
    hold on;
    if i <= 4
        plot(t_arr, z_arr(i,:), 'g');
        hold on;   
    end
    %title( ax, titles(i));
    xlabel('Time(s)', 'FontSize', fontsize);
    ylabel(titles(i), 'FontSize', fontsize);
    if(i==1)
        legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
    end
    saveas(f, 's3pmSM'+titles(i)+'.eps', 'epsc');
end
