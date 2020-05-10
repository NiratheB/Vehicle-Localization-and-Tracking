fontSize = 11;
set(gcf, 'DefaultAxesFontSize', fontSize);
f=figure(1);
loyalgreen = 1/255*[128,255,0];    
subplot(1,1,1)
plot(0,0,'m','LineWidth',2);
hold on;
plot(0,0,'c','LineWidth',2);
hold on;
plot(0,0,'Color',loyalgreen,'LineWidth',2 );
axis off
legend('F-Radius', 'P-Radius','H-inf','Orientation', 'horizontal');

saveas(f,'ratelegend.eps','epsc');    