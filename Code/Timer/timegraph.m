vol = load('vols3_va_16.mat');
frad = load('frads3_va_16.mat');
prad = load('prads3_va_16.mat');
hinf = load('hinfs3_va_16.mat');
% titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
%     "Acceleration_y"];
% for i = 1:4
%     %ax = nexttile;
%     figure(i);
%     plot(t_arr, data.infimum_arr(i,:), 'r');
%     hold on;
%     plot(t_arr, data.supremum_arr(i,:), 'g');
%     hold on;
%     plot( t_arr, data.z_arr(i,:), 'b');
%     hold on;   
%     xlabel('time(s)');
%     ylabel(titles(i));
%     %title( ax, titles(i));
% end

fontsize =24;
lineWidth =5;
set(gcf, 'DefaultAxesFontSize', fontsize);
set(gcf, 'Position', get(0, 'Screensize'));
set(0, 'DefaultLineLineWidth', lineWidth);
f= figure(1);
orange = 1/255*[255,128,0];
loyalgreen = 1/255*[128,255,0];
t_arr = vol.t_arr.*10;
plot(t_arr, vol.timer, 'Color', orange);
hold on;
plot(t_arr, frad.timer, 'm');
hold on;
plot(t_arr, prad.timer, 'c');
hold on;
plot(t_arr, hinf.timer,'Color', loyalgreen);
xlabel('Frame number', 'FontSize', fontsize);
ylabel('Time to compute (s)' , 'FontSize', fontsize);
legend('Volume','F-Radius', 'P-Radius', 'H-inf', 'Location', 'Northoutside', 'Orientation', 'horizontal', 'FontSize', fontsize);
hold on;

axes('Position', [.6 .6 .2 .2]);
box on;

plot(t_arr(9:15), frad.timer(9:15),'m');
hold on;
plot(t_arr(9:15), prad.timer(9:15),'c');
hold on;
plot(t_arr(9:15),hinf.timer(9:15),'Color',loyalgreen);

set(gcf, 'Position', get(0, 'Screensize'));
saveas(f,'timegraphh.eps', 'epsc');