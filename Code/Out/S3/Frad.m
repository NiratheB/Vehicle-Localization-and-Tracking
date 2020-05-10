data = load('s3_pm.mat');
t_arr = data.t_arr;
infimum_arr = data.sm_infimum_arr;
supremum_arr = data.sm_supremum_arr;
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
    plot(t_arr, supremum_arr(i,:), 'r'  );
    hold on;
    if(i<5)
        plot(t_arr, z_arr(i,:), 'g');
    end
    xlabel('Time(s)');
    ylabel(titles(i));
%     if i== 1
%         legend('Lower Bound', 'Upper Bound','True Value', 'Location', 'NorthOutside', 'Orientation', 'horizontal');
%     end
    if(i == 1)
        axes('Position', [.6 .7 .2 .2])
        box on;
        
        plot(t_arr(16:26), infimum_arr(i,16:26),'b');
        hold on;
        plot(t_arr(16:26), supremum_arr(i,16:26),'r');
        hold on;
        plot(t_arr(16:26), z_arr(i,16:26),'g'); 
    end
    set(gcf, 'Position', get(0, 'Screensize'));
    %title( ax, titles(i));
    saveas(f,'s3pmSM'+titles(i)+'.eps', 'epsc');
end
