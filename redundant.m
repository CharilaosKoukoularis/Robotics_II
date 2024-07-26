% Robotics II

close all

l1 = 1;
l2 = 1;
l3 = 0.3;

x0 = 2;
y0 = 2;

len = 4;
x = linspace(0, len, len * 1001);
y = -x + len;
x1 = 1;
y1 = x1 + 1;
x2 = 2;
y2 = - x2 + len - 1;

plot(x, x, '-', x, y, '--', x1, y1, 'o', x2, y2, 'o')