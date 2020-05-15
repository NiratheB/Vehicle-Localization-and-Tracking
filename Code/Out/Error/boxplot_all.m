% select folder
% for vehicle in vehicles
%   get_score from vehicle.z, infimum and supremum
methods = ["Segment Minimizer", "PRadius", "Hinf"]; %DR_USA_Intersection_GL
errors = [];
errors_all =[];
index =1;
fontSize = 36;
lineWidth = 2;
set(0,'defaultAxesFontSize',fontSize);
set(0, 'DefaultLineLineWidth', lineWidth);
for method= methods
    errors = [];
    directory ='../'+ method+'/PMModel/*.mat';
    files = dir(directory);
    nfiles = length(files);
    vehicles = [];
    for i=1:nfiles
        data = load(files(i).folder+"/"+files(i).name);
        vehicles = data.vehicles;
        nvehicles = size(vehicles,1);

        for j=1:nvehicles
            error = calculate_error(vehicles(j));
            if size(error, 1)>1
                 errors = [errors error];
            end
           
        end
    end
    errors_all(:,:,index) = errors(:, 1:10039);
    index = index+1;
    
    
    
end



titles = ["s_x", "s_y", "v_x","v_y","a_x",...
    "a_y"];
%tiledlayout(model.dim_x,1);
j = 1;
disp(vehicles(j).id);
infimum_arr = vehicles(j).infimum_arr;
supremum_arr = vehicles(j).supremum_arr;
z_arr = vehicles(j).z_arr;
endtime = 10;
t_arr =  0:0.1:endtime;
h = figure;
box_error = [transpose(errors_all(3,:,1)) transpose(errors_all(3,:,2))...
    transpose(errors_all(3,:,3))];
boxplot(box_error, ["F-Radius","P-Radius", "H-inf"]);
ylabel("RMSE in v_x");


means = [];
sds= [];
for i=1:3
    for j = 1:4
        means(i,j) = mean(errors_all(j,:,i)); 
        sds(i,j) = std(errors_all(j,:,i));
    end
    
end

saveas(h, 'boxplotall.eps', 'epsc');
disp(means);
disp(sds);



























