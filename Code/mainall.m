% go to dir
directory = 'Data/DR_USA_Intersection_GL/*.csv';
out_directory ='Out/DR_USA_Intersection_GL/';

files = dir(directory);
n = length(files);
delT = 0.1;
model = PointMassModel2(delT);

selectRange = [1,2];
for i = 1:n
    fileid = files(i).folder+"/"+files(i).name;
    f = FileReader(fileid);
    data = f.read_nextline();
    
    estimator = SegmentMinimizer(model);
    
    vehicles = [];
    vehicles_ids = zeros(5000,1);
    while(~isempty(data))
        veh_id = data(1)+1;
        list_index = vehicles_ids(veh_id);
        if(list_index == 0)
            list_index = size(vehicles,1)+1;
            new_vehicle = Vehicle(veh_id);
            new_vehicle.add_estimator(estimator);
            vehicles = [vehicles; new_vehicle];
            vehicles_ids(veh_id) = list_index;
        end
        measurement = transpose(data(2:end));
        vehicles(list_index).add_measurement(measurement, selectRange);      
        data = f.read_nextline();
    end
    filename = regexprep(files(i).name, '.csv', '.mat');
    filename = join([out_directory, filename]);
    save(filename,'vehicles');
    fprintf("%d out of %d : Done",i,n);
end
% for each csv:
    % for each line:
        % identify vehicle
        % if vehicle does not exist: add vehicle
        % vehicle.add measurement(measurement)
        
        
% Select file and format
% dir = fopen('Data/s3_va.txt');
% formatSpec = '%f %f %f %f';
% sizeIn = [4, 1];
% 
% %Change time step
% delT = 0.1;
% 
% model = CAModel(delT);
% 
% %Select Estimator or SegmentMinimzer or VolumeMinimizer
% estimator = SegmentMinimizer(model);
% v = Vehicle(1);
% selectRange = [1,2];
% v.add_estimator(estimator);
% while ~feof(fileID)
%     z = fscanf(fileID, formatSpec, sizeIn);
%     v.add_measurement(z, selectRange);
% end
% 
% titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
%     "Acceleration_y"];
% %tiledlayout(model.dim_x,1);
% endtime = (v.curr_index -2)* model.delT;
% t_arr =  0:model.delT:endtime;
% for i = 1:model.dim_x
%     %ax = nexttile;
%     figure(i);
%     plot(t_arr, v.infimum_arr(i,:), 'r');
%     hold on;
%     plot(t_arr, v.supremum_arr(i,:), 'g');
%     hold on;
%     if i<= 4
%         plot(t_arr, v.z_arr(i,:), 'b');
%         hold on;
%     end
%     
%     %title( ax, titles(i));
%     
% end