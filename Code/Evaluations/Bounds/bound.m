% select folder
% for vehicle in vehicles
%   get bounds  from vehicle infimum and supremum


% select Model and dimension
model = 'CAModel';
dim_x = 6;

methods = ["Frad", "Prad", "Hinf"];
bounds = [];
index =1;

for method = methods
    % Select data
    directory = '../PrecomputedData/'+method+'/'+model+'/*.mat';
    files = dir(directory);
    nfiles = length(files);
    vehicles = [];
    errors = [];
    count = 0;
    len = 100;
    bounds(:,:,index) = zeros(dim_x,len);
    
     t_arr = [0:0.1:len];

    

    for i=1:nfiles
        data = load(files(i).folder+"/"+files(i).name);
        vehicles = data.vehicles;
        nvehicles = size(vehicles,1);
        for j=1:nvehicles
            if (size(vehicles(j).infimum_arr,2) >=len)
                count = count +1;
                bound1 = calculate_bound(vehicles(j));
                bounds(:,:,index) = bounds(:,:,index)+ bound1(:,1:len);
            end

        end

    end

    bounds(:,:,index) = bounds(:,:,index)./count;
    index = index+1;
end
titles = ["s_x", "s_y", "v_x", "v_y", "a_x", "a_y"];

mean_bounds = mean(bounds,2);


%Print mean bounds
disp("Mean bounds for "+model+":");
method_index =1;
for method=methods
    for i=1:dim_x
        disp(method+ ' '+ titles(i) + ': '+ mean_bounds(i,: ,method_index));
        
    end
    method_index = method_index +1;
end