% select folder
% for vehicle in vehicles
%   get_score from vehicle.z, infimum and supremum
error = [];
directory = 'Segment Minimizer/DR_CHN_Merging_ZS/*.mat';
files = dir(directory);
nfiles = length(files);
vehicles = [];
errors = [];
for i=1:nfiles
    data = load(files(i).folder+"/"+files(i).name);
    vehicles = data.vehicles;
    nvehicles = size(vehicles,1);
    
    for j=1:nvehicles
        error = calculate_error(vehicles(j));
        errors = [errors error];
    end
end


titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];
%tiledlayout(model.dim_x,1);
j = 1;
disp(vehicles(j).id);
infimum_arr = vehicles(j).infimum_arr;
supremum_arr = vehicles(j).supremum_arr;
z_arr = vehicles(j).z_arr;
endtime = (vehicles(j).curr_index -2)* 0.1;
t_arr =  0:0.1:endtime;
for i = 1:6
    figure(i);
    plot(t_arr, infimum_arr(i,:), 'r');
    hold on;
    plot(t_arr, supremum_arr(i,:), 'g');
    hold on;
    if i<= 4
        plot(t_arr, z_arr(i,:), 'b');
        hold on;
    end
    xlabel('time(s)');
    ylabel(titles(i));
    %title( ax, titles(i));
    
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