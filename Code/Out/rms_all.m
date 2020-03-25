% select folder
% for vehicle in vehicles
%   get_score from vehicle.z, infimum and supremum
error = [];
directory = 'TC_BGR_Intersection_VA/*.mat';
files = dir(directory);
nfiles = length(files);
for i=1:nfiles
    vehicles = [];
    data = load(files(i).folder+"/"+files(i).name);
    vehicles = data.vehicles;
    nvehicles = size(vehicles,1);
    for j=1:nvehicles
        disp(vehicles(j).id);
    end
end
% index=1;
% for i=sm.z_arr
%     avg = sm.infimum_arr(:,index)+ sm.supremum_arr(:,index);
%     avg = avg/2;
%     sm_error(:,index) = avg - i; 
%     
%     avg = es.infimum_arr(:,index)+ es.supremum_arr(:,index);
%     avg = avg/2;
%     es_error(:,index) = avg - i; 
%     index = index+1;
% end
% [sm_score,sm_mean, sm_sd] = get_score(sm_error);
% [es_score,es_mean, es_sd] = get_score(es_error);

% for i = 1:4
%     figure(i);
%     plot(sm.t_arr, sm_error(i,:), 'b');
%     hold on;
%     plot(es.t_arr, es_error(i,:), 'g');
% end