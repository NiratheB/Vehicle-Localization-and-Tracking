z = zonotope([[0;0], [1 2 3; 3 2 1]]);
i = interval(z);

f= figure('DefaultAxesFontSize',24);
plot(z,[1,2], 'r');
hold on;
plot(i, [1,2], 'k--');
xlabel('x_1');
ylabel('x_2');