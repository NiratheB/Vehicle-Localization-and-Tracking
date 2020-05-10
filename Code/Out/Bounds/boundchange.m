% select folder
% for vehicle in vehicles
%   get bounds  from vehicle infimum and supremum
methods = ["Segment Minimizer", "PRadius", "Hinf"];
bounds = [];
index =1;
for method = methods %DR_USA_Intersection_G
    directory = '../'+method+'/PMModel/*.mat';
    files = dir(directory);
    nfiles = length(files);
    vehicles = [];
    errors = [];
    count = 0;
    bounds(:,:,index) = zeros(6,60);
    len = 60;
     t_arr = [0.1:0.1:len];

    

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
loyalgreen = 1/255*[128,255,0];
titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];
%tiledlayout(model.dim_x,1);
fontSize= 50;
lineWidth = 2;
set(0,'defaultAxesFontSize',fontSize);
set(0, 'DefaultLineLineWidth', 2);
for i = 1:6
    f =figure(i);
    plot(t_arr(1:len-1),diff(bounds(i,:,1))./0.1, 'm');
    hold on;
    plot(t_arr(1:len-1), diff(bounds(i,:,2))./0.1, 'c');
    hold on;
    plot(t_arr(1:len-1),diff(bounds(i,:,3))./0.1, 'Color', loyalgreen);
    xlabel('Time(s)');
    ylabel(titles(i));
    ylim([-10 10]);
    %legend('F-Radius', 'P-Radius','H-inf', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
    set(gcf, 'Position', get(0, 'Screensize'));
    saveas(f, 'pm_bound_change'+titles(i)+'.eps', 'epsc');
    %title( ax, titles(i));   
end