fontSize = 8;
set(gcf, 'DefaultAxesFontSize', fontSize);
f=figure(1);
subplot(1,1,1)
plot(0,0,'b','LineWidth',2);
hold on;
plot(0,0,'r','LineWidth',2);
hold on;
plot(0,0,'g','LineWidth',2 );
axis off
legend('Lower Bound', 'Upper Bound','True Value','Orientation', 'horizontal');
saveas(f,'legend.eps','epsc');    