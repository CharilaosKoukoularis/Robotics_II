% Robotics II
% 2nd Series of Exercises

l1 = 4;
l2 = 2;
% y0 = 4;
pgoal = [5,2];
pstart = [8,2];

close all

figure
hold on
grid on

plot(pgoal(1),pgoal(2),Marker='x',Color='red',MarkerSize=8)
plot(pstart(1),pstart(2),Marker='diamond',Color='green',MarkerFaceColor='green',MarkerSize=8)

% ylim([y0 - 4, y0 + 4])
ylim([-4, 4])
xlim([0, 13])
ylabel('p_y')
xlabel('p_x')
xticks(0:1:13)

i = 0;

for q2 = -3*pi/4:pi/4:pi
    for q1 = 0:5
        i = i + 1;
        p(i,1) = l1 + q1 + l2 * cos(q2);
        p(i,2) = l2 * sin(q2);
        % p(i,2) = y0 + l2 * sin(q2);
        plot(p(i,1),p(i,2),Marker='o',Color='blue')
    end
end

for px = 6.5:0.5:7.5
    for py = 0.5:0.5:3.5
        plot(px,py,Marker='*',Color='black')
    end
end
