data = load('s3_cs.mat');
t_arr = data.t_arr;
infimum_arr = data.hinf_infimum_arr;
supremum_arr = data.hinf_supremum_arr;
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
        axes('Position', [.45 .3  .3 .4])
    elseif(i< 5)
          axes('Position', [.6 .5 .3 .3])
    end
    if i< 5
        %axes('Position', [.6 .6 .3 .3])
        box on;
        
        plot(t_arr(16:26), infimum_arr(i,16:26),'b');
        hold on;
        plot(t_arr(16:26), supremum_arr(i,16:26),'r');
        hold on;
        plot(t_arr(16:26), z_arr(i,16:26),'g');
    end
    %title( ax, titles(i));
    set(gcf, 'Position', get(0, 'Screensize'));
    saveas(f,'s3csHInf'+titles(i)+'.eps', 'epsc');
end


data = load('s3_ca.mat');
t_arr = data.t_arr;
infimum_arr = data.hinf_infimum_arr;
supremum_arr = data.hinf_supremum_arr;

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
        axes('Position', [.45 .3  .3 .4])
    elseif(i< 5)
          axes('Position', [.6 .5 .3 .3])
    end
    if i< 5
        %axes('Position', [.6 .6 .3 .3])
        box on;
        
        plot(t_arr(16:26), infimum_arr(i,16:26),'b');
        hold on;
        plot(t_arr(16:26), supremum_arr(i,16:26),'r');
        hold on;
        plot(t_arr(16:26), z_arr(i,16:26),'g');
    end
    %title( ax, titles(i));
    set(gcf, 'Position', get(0, 'Screensize'));
    saveas(f,'s3caHInf'+titles(i)+'.eps', 'epsc');
end


data = load('s3_cv.mat');
t_arr = data.t_arr;
infimum_arr = data.hinf_infimum_arr;
supremum_arr = data.hinf_supremum_arr;

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
        axes('Position', [.45 .3  .3 .4])
    elseif(i< 5)
          axes('Position',[.6 .5 .3 .3])
    end
    if i< 5
        %axes('Position', [.6 .6 .3 .3])
        disp(i);
        box on;
        
        plot(t_arr(16:26), infimum_arr(i,16:26),'b');
        hold on;
        plot(t_arr(16:26), supremum_arr(i,16:26),'r');
        hold on;
        plot(t_arr(16:26), z_arr(i,16:26),'g');
    end
    %title( ax, titles(i));
    set(gcf, 'Position', get(0, 'Screensize'));
    saveas(f,'s3cvHInf'+titles(i)+'.eps', 'epsc');
end

data = load('s3_pm.mat');
infimum_arr = data.hinf_infimum_arr;
supremum_arr = data.hinf_supremum_arr;
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
        axes('Position', [.45 .3  .3 .4])
    elseif(i< 5)
          axes('Position', [.6 .5 .3 .3])
    end
    if i< 5
        %axes('Position', [.6 .6 .3 .3])
        box on;
        
        plot(t_arr(16:26), infimum_arr(i,16:26),'b');
        hold on;
        plot(t_arr(16:26), supremum_arr(i,16:26),'r');
        hold on;
        plot(t_arr(16:26), z_arr(i,16:26),'g');
    end
    %title( ax, titles(i));fdfdf
    set(gcf, 'Position', get(0, 'Screensize'));
    saveas(f,'s3pmHInf'+titles(i)+'.eps', 'epsc');
end
