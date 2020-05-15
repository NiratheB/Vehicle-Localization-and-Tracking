% Load Data
vol = load('Data/vol.mat');
frad = load('Data/frad.mat');
prad = load('Data/prad.mat');
hinf = load('Data/hinf.mat');

% Set fontsize and linewidth
fontsize =24;
lineWidth =5;
set(gcf, 'DefaultAxesFontSize', fontsize);
set(gcf, 'DefaultLineLineWidth', lineWidth);

% Set colors
orange = 1/255*[255,128,0];
loyalgreen = 1/255*[128,255,0];

% Set time
t_arr = vol.t_arr.*10;

%Begin figure
f= figure(1);

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

% Detailed subplot
axes('Position', [.6 .6 .2 .2]);
box on;

plot(t_arr(9:15), frad.timer(9:15),'m');
hold on;
plot(t_arr(9:15), prad.timer(9:15),'c');
hold on;
plot(t_arr(9:15),hinf.timer(9:15),'Color',loyalgreen);

% Full screen
set(gcf, 'Position', get(0, 'Screensize'));

%Save figure
saveas(f,'timegraphh.eps', 'epsc');