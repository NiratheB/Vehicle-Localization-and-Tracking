% select folder
% for vehicle in vehicles
%   get_score from vehicle.z, infimum and supremum
error = [];
%directory = 'DR_USA_Intersection_GL/*.mat';
directory = 'PMModel/*.mat';
files = dir(directory);
nfiles = length(files);
vehicles = [];
avg_times = [];
vehi_count =0;
m_count = 0;
for i=1:nfiles
    data = load(files(i).folder+"/"+files(i).name);
    vehicles = data.vehicles;
    nvehicles = size(vehicles,1);
    vehi_count = vehi_count + nvehicles;
    for j=1:nvehicles
        avg_times = [avg_times mean(vehicles(j).timer_arr)];
        m_count = m_count + size(vehicles(j).timer_arr,2);
    end
end

disp(vehi_count);
disp(m_count);
disp(mean(avg_times));