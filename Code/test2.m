f = figure(1);
histogram(errors(1,:));
ylabel("Number of vehicles");
xlabel("Error % in x");
saveas(f,'s_caXerror.eps', 'epsc');


histogram(errors(2,:));
ylabel("Number of vehicles");
xlabel("Error % in y");
saveas(f,'s_caYerror.eps', 'epsc');


histogram(errors(3,:));
ylabel("Number of vehicles");
xlabel("Error % in v_x");
saveas(f,'s_cavXerror.eps', 'epsc');

histogram(errors(4,:));
ylabel("Number of vehicles");
xlabel("Error % in v_y");
saveas(f,'s_cavYerror.eps', 'epsc');
% plot(t_arr, infimum_arr(1,:),'r');
% hold on;
% plot(t_arr, supremum_arr(1,:),'g');
% hold on;
% plot(t_arr, z_arr(1,:),'b');
% hold on;
% ylabel('X');
% xlabel('Time (s)');
% 
% axes('Position', [.7 .7 .2 .2]);
% box on;
% 
% plot(t_arr(80:90), infimum_arr(1,80:90),'r');
% hold on;
% plot(t_arr(80:90), supremum_arr(1,80:90),'g');
% hold on;
% plot(t_arr(80:90), z_arr(1,80:90),'b');
% 
% saveas(f,'s_caXzoomed.eps', 'epsc');
% 
% f = figure(2);
% plot(t_arr, infimum_arr(2,:),'r');
% hold on;
% plot(t_arr, supremum_arr(2,:),'g');
% hold on;
% plot(t_arr, z_arr(2,:),'b');
% hold on;
% ylabel('Y');
% xlabel('Time (s)');
% 
% axes('Position', [.7 .7 .2 .2]);
% box on;
% 
% plot(t_arr(80:90), infimum_arr(2,80:90),'r');
% hold on;
% plot(t_arr(80:90), supremum_arr(2,80:90),'g');
% hold on;
% plot(t_arr(80:90), z_arr(2,80:90),'b');
