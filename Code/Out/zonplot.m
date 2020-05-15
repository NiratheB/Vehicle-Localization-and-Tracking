z = zonotope([[0;0], [1 2 3; 3 2 1]]);
i = interval(z);
fontsize = 50;
lineWidth = 10;
set(gcf, 'DefaultAxesFontSize', fontsize);

set(0, 'DefaultLineLineWidth', lineWidth);
f= figure(1);
plot(z,[1,2], 'r');
hold on;
plot(i, [1,2], 'k--');
xlabel('x_1');
ylabel('x_2');
set(gcf, 'Position', get(0, 'Screensize'));

saveas(f,'zonotope.eps', 'epsc');