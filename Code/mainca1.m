% Select file and format
fileID = fopen('Data/s3_va.txt');
formatSpec = '%f %f %f %f';
sizeIn = [1, 4];

%Change time step
delT = 0.1;
model = PointMassModel2(delT);

%Select Estimator or SegmentMinimzer or VolumeMinimizer
sm_estimator = SegmentMinimizer(model);
prad_estimator = PRadius(model);
hinf_estimator = Estimator(model);

index = 1;
t=0;
sm_infimum_arr = [];
sm_supremum_arr = [];

prad_infimum_arr = [];
prad_supremum_arr = [];

hinf_infimum_arr = [];
hinf_supremum_arr = [];

z_arr = [];
t_arr = [];
fontSize = 11;
while ~feof(fileID)
    measurement = fscanf(fileID, formatSpec, sizeIn);
    z = transpose(measurement);
    [upper,lower] = sm_estimator.estimate(z([1,2])); % Select the inputs
    sm_infimum_arr = [sm_infimum_arr lower];
    sm_supremum_arr = [sm_supremum_arr  upper];
    z_arr = [z_arr [z(1:4);0;0]];
    t_arr = [t_arr t];
    
    [upper,lower] = prad_estimator.estimate(z([1,2])); % Select the inputs
    prad_infimum_arr = [prad_infimum_arr lower];
    prad_supremum_arr = [prad_supremum_arr  upper];
    
    [upper,lower] = hinf_estimator.estimate(z([1,2])); % Select the inputs
    hinf_infimum_arr = [hinf_infimum_arr lower];
    hinf_supremum_arr = [hinf_supremum_arr  upper];
    
    t= t+ delT;
    disp(index);
    index = index+1;
end
%tiledlayout(model.dim_x,1);
loyalgreen = 1/255*[128,255,0];
titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];

% fig_index = 1;
% for i = 1:model.dim_x
%     %ax = nexttile;
%     f = figure(fig_index);
%     fig_index = fig_index+ 1;
%     plot(t_arr, sm_infimum_arr(i,:), 'b');
%     hold on;
%     plot(t_arr, sm_supremum_arr(i,:), 'r');
%     hold on;
%     if(i<5)
%         plot(t_arr, z_arr(i,:), 'g');
%     end
%     xlabel('Time(s)', 'FontSize', fontSize);
%     ylabel(titles(i), 'FontSize', fontSize);
%     if i== 1
%         legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
%     end
%     if(i == 1)
%         axes('Position', [.6 .6 .2 .2])
%         box on;
%         
%         plot(t_arr(16:26), sm_infimum_arr(i,16:26),'b');
%         hold on;
%         plot(t_arr(16:26), sm_supremum_arr(i,16:26),'r');
%         hold on;
%         plot(t_arr(16:26), z_arr(i,16:26),'g');
%     end
%     %title( ax, titles(i));
%     saveas(f,'s3pmSM'+titles(i)+'.eps', 'epsc');
% end
% 
% for i = 1:model.dim_x
%     %ax = nexttile;
%     f = figure(fig_index);
%     fig_index = fig_index+ 1;
%     plot(t_arr, prad_infimum_arr(i,:), 'b');
%     hold on;
%     plot(t_arr, prad_supremum_arr(i,:), 'r');
%     hold on;
%     if(i<5)
%         plot(t_arr, z_arr(i,:), 'g');
%     end
%     if(i == 1)
%         legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
%     end
%     %title( ax, titles(i));
%     xlabel('Time(s)', 'FontSize', fontSize);
%     ylabel(titles(i), 'FontSize', fontSize);
%     
%     if i< 5
%         axes('Position', [.6 .6 .3 .3])
%         box on;
%         
%         plot(t_arr(100:120), prad_infimum_arr(i,10:20),'b');
%         hold on;
%         plot(t_arr(50:80), prad_supremum_arr(i,10:20),'r');
%         hold on;
%         plot(t_arr(50:80), z_arr(i,50:80),'g');
%     end
%     saveas(f,'s3pmPrad'+titles(i)+'.eps', 'epsc');
% end
% 
% 
% for i = 1:model.dim_x
%     %ax = nexttile;
%     f = figure(fig_index);
%     fig_index = fig_index+ 1;
%     plot(t_arr, hinf_infimum_arr(i,:), 'b');
%     hold on;
%     plot(t_arr, hinf_supremum_arr(i,:), 'r');
%     hold on;
%     if(i<5)
%         plot(t_arr, z_arr(i,:), 'g');
%     end
%     
%     %title( ax, titles(i));
%     xlabel('Time(s)', 'FontSize', fontSize);
%     ylabel(titles(i), 'FontSize', fontSize);
%     
%     if i< 5
%         axes('Position', [.6 .6 .3 .3])
%         box on;
%         
%         plot(t_arr(100:120), prad_infimum_arr(i,10:20),'b');
%         hold on;
%         plot(t_arr(50:80), prad_supremum_arr(i,10:20),'r');
%         hold on;
%         plot(t_arr(50:80), z_arr(i,50:80),'g');
%     end
%     legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
%     saveas(f,'s3pmHinf'+titles(i)+'.eps', 'epsc');
% 
% end