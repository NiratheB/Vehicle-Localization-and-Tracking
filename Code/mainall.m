% go to dir
% for each csv:
    % for each line:
        % identify vehicle
        % if vehicle does not exist: add vehicle
        % vehicle.add measurement(measurement)
        
        
% Select file and format
fileID = fopen('Data/s3_va.txt');
formatSpec = '%f %f %f %f';
sizeIn = [4, 1];

%Change time step
delT = 0.1;

model = CAModel(delT);

%Select Estimator or SegmentMinimzer or VolumeMinimizer
estimator = SegmentMinimizer(model);
v = Vehicle(1);
selectRange = [1,2];
v.add_estimator(estimator);
while ~feof(fileID)
    z = fscanf(fileID, formatSpec, sizeIn);
    v.add_measurement(z, selectRange);
end

titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];
%tiledlayout(model.dim_x,1);
endtime = (v.curr_index -2)* model.delT;
t_arr =  0:model.delT:endtime;
for i = 1:model.dim_x
    %ax = nexttile;
    figure(i);
    plot(t_arr, v.infimum_arr(i,:), 'r');
    hold on;
    plot(t_arr, v.supremum_arr(i,:), 'g');
    hold on;
    if i<= 4
        plot(t_arr, v.z_arr(i,:), 'b');
        hold on;
    end
    
    %title( ax, titles(i));
    
end