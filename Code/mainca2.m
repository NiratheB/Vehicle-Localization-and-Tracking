% Select file and format
fileID = fopen('Data/s3_va.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];

%Change time step
delT = 0.1;

model = PointMassModel2(delT);
model2 = CAModel(delT);
%Select Estimator or SegmentMinimzer or VolumeMinimizer
sm_estimator = SegmentMinimizer(model);

ca_estimator = PRadius(model2);
index = 1;
t=0;
infimum_arr = [];
supremum_arr = [];

ca_infimum_arr = [];
ca_supremum_arr = [];
z_arr = [];
t_arr = [];
while ~feof(fileID)
    measurement = fscanf(fileID, formatSpec, sizeIn);
    z = transpose(measurement);
    [upper,lower] = sm_estimator.estimate(z([1,2])); % Select the inputs
    infimum_arr = [infimum_arr lower];
    supremum_arr = [supremum_arr  upper];
    
    
%     [upper,lower] = ca_estimator.estimate(z([1,2])); % Select the inputs
%     ca_infimum_arr = [ca_infimum_arr lower];
%     ca_supremum_arr = [ca_supremum_arr  upper];
    
    z_arr = [z_arr [z(1:4);0;0]];
    t_arr = [t_arr t];
    t= t+ delT;
    disp(index);
    index = index+1;
end
titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];
for i=1:6
    f=figure(i);
    plot(t_arr, infimum_arr(i,:), 'm');
    hold on;
%     plot(t_arr, ca_infimum_arr(i,:), 'c');
%     hold on;
    plot(t_arr, z_arr(i,:), 'g');
    hold on;
    plot(t_arr, supremum_arr(i,:), 'm');
    hold on;
%    plot(t_arr, ca_supremum_arr(i,:), 'c');
    xlabel('time(s)', 'FontSize', 11);
    ylabel(titles(i), 'FontSize', 11);
    legend('Point Mass Model', 'Constant Velocity Model','True Value',...
        'Location', 'Northoutside', 'Orientation', 'horizontal');
    saveas(f, 'v'+titles(i)+'.jpg', 'jpg');
end
