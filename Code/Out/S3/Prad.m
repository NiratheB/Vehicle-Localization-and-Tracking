data = load('s3_pm.mat');
t_arr = data.t_arr;
infimum_arr = data.prad_infimum_arr;
supremum_arr = data.prad_supremum_arr;
z_arr = data.z_arr;
fontSize = 50;
titles = ["X", "Y", "Velocity_x","Velocity_y","Acceleration_x",...
    "Acceleration_y"];
fig_index = 1;
set(0,'defaultAxesFontSize',fontSize);
for i=1:6
    f = figure(fig_index);
    fig_index = fig_index+ 1;
    plot(t_arr, infimum_arr(i,:), 'b');
    hold on;
    plot(t_arr, supremum_arr(i,:), 'r'); 
    hold on;
    if(i<5)
        plot(t_arr, z_arr(i,:), 'g');
    end
    xlabel('Time(s)');
    ylabel(titles(i));
%     if i== 1
%         legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
%     end
    if(i<3)
        axes('Position', [.45 .3  .3 .3])
    elseif(i< 5)
          axes('Position', [.6 .5 .3 .3])
    end
    if i< 5
        %axes('Position', [.6 .6 .3 .3])
        box on;
        
        plot(t_arr(50:80), infimum_arr(i,50:80),'b');
        hold on;
        plot(t_arr(50:80), supremum_arr(i,50:80),'r');
        hold on;
        plot(t_arr(50:80), z_arr(i,50:80),'g');
    end
    %title( ax, titles(i));
    set(gcf, 'Position', get(0, 'Screensize'));
    saveas(f,'s3pmprad'+titles(i)+'.eps', 'epsc');
end


data = load('s3_ca.mat');
t_arr = data.t_arr;
infimum_arr = data.prad_infimum_arr;
supremum_arr = data.prad_supremum_arr;

for i=1:6
    f = figure(fig_index);
    fig_index = fig_index+ 1;
    plot(t_arr, infimum_arr(i,:), 'b');
    hold on;
    plot(t_arr, supremum_arr(i,:), 'r');
    hold on;
    if(i<5)
        plot(t_arr, z_arr(i,:), 'g');
    end
    xlabel('Time(s)', 'FontSize', fontSize);
    ylabel(titles(i), 'FontSize', fontSize);
%     if i== 1
%         legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
%     end
    if(i<3)
        axes('Position', [.45 .3  .3 .3])
    elseif(i< 5)
          axes('Position', [.6 .5 .3 .3])
    end
    if i< 5
        %axes('Position', [.6 .6 .3 .3])
        box on;
        
        plot(t_arr(50:80), infimum_arr(i,50:80),'b');
        hold on;
        plot(t_arr(50:80), supremum_arr(i,50:80),'r');
        hold on;
        plot(t_arr(50:80), z_arr(i,50:80),'g');
    end
    %title( ax, titles(i));
    set(gcf, 'Position', get(0, 'Screensize'));
    saveas(f,'s3caprad'+titles(i)+'.eps', 'epsc');
end


data = load('s3_cv.mat');
t_arr = data.t_arr;
infimum_arr = data.prad_infimum_arr;
supremum_arr = data.prad_supremum_arr; 

for i=1:4
    f = figure(fig_index);
    fig_index = fig_index+ 1;
    plot(t_arr, infimum_arr(i,:), 'b');
    hold on;
    plot(t_arr, supremum_arr(i,:), 'r');
    hold on;
    if(i<5)
        plot(t_arr, z_arr(i,:), 'g');
    end
    xlabel('Time(s)', 'FontSize', fontSize);
    ylabel(titles(i), 'FontSize', fontSize);
%     if i== 1
%         legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
%     end
    if(i<3)
        axes('Position', [.45 .3 .3 .3])
    elseif(i< 5)
          axes('Position', [.6 .5 .3 .3])
    end
    if i< 5
        %axes('Position', [.6 .6 .3 .3])
        box on;
        
        plot(t_arr(50:80), infimum_arr(i,50:80),'b');
        hold on;
        plot(t_arr(50:80), supremum_arr(i,50:80),'r');
        hold on;
        plot(t_arr(50:80), z_arr(i,50:80),'g');
    end
    %title( ax, titles(i));
    set(gcf, 'Position', get(0, 'Screensize'));
    saveas(f,'s3cvprad'+titles(i)+'.eps', 'epsc');
end


% data = load('s3_pm.mat');
% t_arr = data.t_arr;
% infimum_arr = data.prad_infimum_arr;
% supremum_arr = data.prad_supremum_arr;
% 
% for i=1:6
%     set(gcf, 'DefaultAxesFontSize', fontSize);
%     set(gcf, 'Position', get(0, 'Screensize'));
%     f = figure(fig_index);
%     fig_index = fig_index+ 1;
%     plot(t_arr, infimum_arr(i,:), 'b');
%     hold on;
%     plot(t_arr, supremum_arr(i,:), 'r');
%     hold on;
%     if(i<5)
%         plot(t_arr, z_arr(i,:), 'g');
%     end
%     xlabel('Time(s)', 'FontSize', fontSize);
%     ylabel(titles(i), 'FontSize', fontSize);
%     if i== 1
%         legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
%     end
%     if(i<3)
%         axes('Position', [.6 .2 .3 .3])
%     elseif(i< 5)
%           axes('Position', [.6 .6 .3 .3])
%     end
%     if i< 5
%         %axes('Position', [.6 .6 .3 .3])
%         box on;
%         
%         plot(t_arr(50:80), infimum_arr(i,50:80),'b');
%         hold on;
%         plot(t_arr(50:80), supremum_arr(i,50:80),'r');
%         hold on;
%         plot(t_arr(50:80), z_arr(i,50:80),'g');
%     end
%     %title( ax, titles(i));
%     saveas(f,'s3pmprad'+titles(i)+'.eps', 'epsc');
% end
% 
% 
