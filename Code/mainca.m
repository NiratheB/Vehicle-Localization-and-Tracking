% Select file and format
fileID = fopen('Data/s2_ca.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];

%Change time step
delT = 0.1;

model = CAModel(delT);

%Select Estimator or SegmentMinimzer or VolumeMinimizer
estimator = Estimator(model);
sm_estimator = SegmentMinimizer(model);
pr_estimator = PRadius(model);
index = 1;
t=0;
infimum_arr = [];
supremum_arr = [];
sm_infimum_arr = [];
sm_supremum_arr = [];
pr_infimum_arr = [];
pr_supremum_arr = [];
z_arr = [];
t_arr = [];
while ~feof(fileID)
    measurement = fscanf(fileID, formatSpec, sizeIn);
    z = transpose(measurement);
    [upper,lower] = estimator.estimate(z([1,2])); % Select the inputs
    infimum_arr = [infimum_arr lower];
    supremum_arr = [supremum_arr  upper];
    [upper, lower] = sm_estimator.estimate(z([1,2]));
    sm_infimum_arr = [sm_infimum_arr lower];
    sm_supremum_arr =[sm_supremum_arr upper];
    
    [upper, lower] = pr_estimator.estimate(z([1,2]));
    pr_supremum_arr = [pr_supremum_arr upper];
    pr_infimum_arr = [pr_infimum_arr lower];
    z_arr = [z_arr [z(1:4);0;0]];
    t_arr = [t_arr t];
    t= t+ delT;
    disp(index);
    index = index+1;
end

titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];
%tiledlayout(model.dim_x,1);
sm_errors = sm_infimum_arr + sm_supremum_arr;
sm_errors = sm_errors./2;
sm_errors = abs(sm_errors(1:4,:) - z_arr(1:4,:));

errors = infimum_arr + supremum_arr;
errors = errors./2;
errors = abs(errors(1:4,:) - z_arr(1:4,:));

pr_errors = pr_infimum_arr + pr_supremum_arr;
pr_errors = pr_errors./2;
pr_errors = abs(pr_errors(1:4,:) - z_arr(1:4,:));
for i = 1:4
    %ax = nexttile;
    f= figure(i);
    plot(t_arr(1:50), errors(i,1:50), 'k:', 'LineWidth',2);
    hold on;
    plot(t_arr(1:50), sm_errors(i,1:50), 'k--', 'LineWidth', 2);
    hold on;
    plot(t_arr(1:50), pr_errors(i,1:50), 'k-', 'LineWidth', 2);
    xlabel('Time (s)');
    ylabel('Error in '+titles(i));
    legend('Interval Estimation', 'Segment Minimization','P-Radius');
    %title( ax, titles(i));
    saveas(f,'errors'+titles(i)+'.eps', 'epsc');
end