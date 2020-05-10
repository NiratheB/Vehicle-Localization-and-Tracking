data = load('s3_cs.mat');
t_arr = data.t_arr;
i=3;
sm_vx_infimum = data.sm_infimum_arr(i,:);
sm_vx_supremum = data.sm_supremum_arr(i,:);
prad_vx_infimum = data.prad_infimum_arr(i,:);
prad_vx_supremum = data.prad_supremum_arr(i,:);
hinf_vx_infimum = data.hinf_infimum_arr(i,:);
hinf_vx_supremum = data.hinf_supremum_arr(i,:);
z_arr = data.z_arr(i,:);
fontSize = 80;
titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];
fig_index = 1;
set(gcf, 'DefaultAxesFontSize', fontSize);
set(gcf, 'Position', get(0, 'Screensize'));
% f= figure(fig_index);
% plot(t_arr, sm_vx_infimum, 'b');
% hold on;
% plot(t_arr, sm_vx_supremum, 'r');
% hold on;
% plot(t_arr, z_arr, 'g');
% xlabel('Time(s)');
% ylabel('Velocity_x');
% %legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
% saveas(f,'sm.eps', 'epsc'); 

% fig_index = fig_index+1;
% set(gcf, 'DefaultAxesFontSize', fontSize);
% set(gcf, 'Position', get(0, 'Screensize'));
% f2= figure(fig_index);
% plot(t_arr, prad_vx_infimum, 'b');
% hold on;
% plot(t_arr, prad_vx_supremum, 'r');
% hold on;
% plot(t_arr, z_arr, 'g');
% xlabel('Time(s)');
% %ylabel('Velocity_x');
% %legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
% 
% axes('Position', [.6 .5 .3 .3])
% box on;  
% plot(t_arr(50:80), prad_vx_infimum(50:80),'b');
% hold on;
% plot(t_arr(50:80), prad_vx_supremum(50:80),'r');
% hold on;
% plot(t_arr(50:80), z_arr(50:80),'g');
% saveas(f2,'prad.eps', 'epsc'); 

% 
% 
% % fig_index = fig_index+1;
set(gcf, 'DefaultAxesFontSize', fontSize);
set(gcf, 'Position', get(0, 'Screensize'));
f3= figure(fig_index);
plot(t_arr, hinf_vx_infimum, 'b');
hold on;
plot(t_arr, hinf_vx_supremum, 'r');
hold on;
plot(t_arr, z_arr, 'g');
xlabel('Time(s)');
%ylabel('Velocity_x');
%legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');

axes('Position', [.6 .5 .3 .3])
box on;  
plot(t_arr(16:26), prad_vx_infimum(16:26),'b');
hold on;
plot(t_arr(16:26), prad_vx_supremum(16:26),'r');
hold on;
plot(t_arr(16:26), z_arr(16:26),'g');

set(gcf, 'DefaultAxesFontSize', fontSize);
set(gcf, 'Position', get(0, 'Screensize'));

saveas(f3,'hinf.eps', 'epsc'); 

