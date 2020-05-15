% Change filename and format
fileID = fopen('Data/sample.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];

%Change timestep
delT = 0.1;

%Select model as CVModel or CAModel or PointMassModel
model = CVModel(delT);

%Select Frad or Prad or Vol or Hinf
estimator = Frad(model);

z_arr = [];
infimum_arr = [];
supremum_arr = [];
t_arr = [];

t = 0;
index = 1;
while ~feof(fileID)
    % read measurement
    measurement = fscanf(fileID, formatSpec, sizeIn);
    z = transpose(measurement);
    [lower,upper] = estimator.estimate(z([1,2]));
    infimum_arr = [infimum_arr lower];
    supremum_arr = [supremum_arr  upper];
    z_arr = [z_arr [z(1:4);0;0]];
    t_arr = [t_arr t];
    t= t+ delT;
    index = index+1;
end


% plot
titles = ["s_x", "s_y", "v_x", "v_y", "a_x", "a_y"];
tiledlayout(model.dim_x,1);
for i = 1:model.dim_x
    ax = nexttile;
    plot(ax, t_arr, infimum_arr(i,:), 'b');
    hold on;
    plot(ax, t_arr, supremum_arr(i,:), 'r');
    hold on;
    plot(ax, t_arr, z_arr(i,:), 'g');
    hold on;
    title( ax, titles(i));
    if(i == 1)
        legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
    end
end
set(gcf, 'Position', get(0, 'Screensize'));
fclose(fileID);