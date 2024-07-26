% Robotics II
% 2nd Series of Exercises

x = 2; % column number
y = 1; % row number

p_start = [8,4];
p_end = [7,9];

p_range = [14,14];

p_obst = [];

for i = 5:10
    p_obst = [p_obst; [i,7]];
end

for i = 8:10 % [5,7] is already included from the previous loop
    p_obst = [p_obst; [5,i]];
end

               % left   below  right above
connectivity = [[0,-1];[-1,0];[0,1];[1,0]];

% for c = connectivity(:)
%     disp(c)
% end

U = zeros(p_range(y),p_range(x));

for i = 1:p_range(y) % rows
    for j = 1:p_range(x) % columns
        % 15 - i because the counting starts from the bottom row towards
        % the upper one.
        U(p_range(y) + 1 - i,j) = attractive_potential([i,j],p_end) + ... 
                              repulsive_potential([i,j],p_obst);
    end
end

% U = [transpose(p_range(y):-1:1) , U];
% U = [0:p_range(y) ; U];

% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % colnames = {'row/col'};
% % % % % % % % % % % % % % % % colnames = cell(1, p_range(x));
% % % % % % % % % % % % % % % % rownames = cell(1, p_range(y));
% % % % % % % % % % % % % % % % cols = cell(1, p_range(x));
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % for i = 1:p_range(y)
% % % % % % % % % % % % % % % %     % colnames{i + 1} = int2str(i);
% % % % % % % % % % % % % % % %     colnames{i} = int2str(i);
% % % % % % % % % % % % % % % %     rownames{i} = int2str(p_range(y) + 1 - i);
% % % % % % % % % % % % % % % % end
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % for j = 1:p_range(x) %+ 1
% % % % % % % % % % % % % % % %     for i = 1:p_range(y)
% % % % % % % % % % % % % % % %         cols{j}{i} = U(i,j);%U(i + 1,j);
% % % % % % % % % % % % % % % %     end
% % % % % % % % % % % % % % % %     cols{j} = transpose(cols{j});
% % % % % % % % % % % % % % % % end
% % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % tab = table(cols{:});
% % % % % % % % % % % % % % % % tab.Properties.VariableNames = colnames;
% % % % % % % % % % % % % % % % tab.Properties.RowNames = rownames;

%%

X = 1:p_range(x);
Y = transpose(p_range(y):-1:1);

[X1, X2] = meshgrid(X,Y);

close all

figure

hold on
grid on
xticks(1:14)
yticks(1:14)
xlim([0, 15])
ylim([0, 15])

for i = 1:p_range(y) % rows
    for j = 1:p_range(x) % columns
        plot(i,j,Marker='.',Color='black')
        text(i+0.05,j+0.3,string(round(U(15-j,i),2)),fontsize=8)
    end
end

for i = 5:10
    plot(7,i,Marker="square",Color='black',MarkerFaceColor='black',MarkerSize=30)
end

for i = 8:10 % [5,7] is already included from the previous loop
    plot(i,5,Marker="square",Color='black',MarkerFaceColor='black',MarkerSize=30)
end

plot(p_start(x),p_start(y),Marker="o",Color='blue',MarkerSize=8)
plot(p_end(x),p_end(y),Marker="o",Color='red',MarkerSize=8)

above = 4;
below = 2;
right = 3;
left = 1;

% sec = 0.5;
sec = 0.25;

%% start (x,y) = (j,i)

pause(sec)

p = p_start;
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")

%% (4,8)

pause(sec)

plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [above,below,right,left]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (5,8)

pause(sec)

quiver(p(x),p(y),connectivity(right,x), ...
                 connectivity(right,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(right,x);
p(y) = p(y) + connectivity(right,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [above,below,right]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (6,8)

pause(sec)

quiver(p(x),p(y),connectivity(right,x), ...
                 connectivity(right,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(right,x);
p(y) = p(y) + connectivity(right,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [above,below]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (6,7)

pause(sec)

quiver(p(x),p(y),connectivity(below,x), ...
                 connectivity(below,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(below,x);
p(y) = p(y) + connectivity(below,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [below]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (6,6)

pause(sec)

quiver(p(x),p(y),connectivity(below,x), ...
                 connectivity(below,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(below,x);
p(y) = p(y) + connectivity(below,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [left,below]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (6,5)

pause(sec)

quiver(p(x),p(y),connectivity(below,x), ...
                 connectivity(below,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(below,x);
p(y) = p(y) + connectivity(below,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [left,below]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (6,9)

pause(sec)

quiver(6,8,connectivity(above,x), ...
                 connectivity(above,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
plot(6,9,Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [above]
    pause(sec)
    plot(6+connectivity(i,x),9+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (6,4)

pause(sec)

quiver(p(x),p(y),connectivity(below,x), ...
                 connectivity(below,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(below,x);
p(y) = p(y) + connectivity(below,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [left,below]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (7,4)

pause(sec)

quiver(p(x),p(y),connectivity(right,x), ...
                 connectivity(right,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(right,x);
p(y) = p(y) + connectivity(right,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [below,right]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (8,4)

pause(sec)

quiver(p(x),p(y),connectivity(right,x), ...
                 connectivity(right,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(right,x);
p(y) = p(y) + connectivity(right,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [below,right]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (9,4)

pause(sec)

quiver(p(x),p(y),connectivity(right,x), ...
                 connectivity(right,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(right,x);
p(y) = p(y) + connectivity(right,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [below,right]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (10,4)

pause(sec)

quiver(p(x),p(y),connectivity(right,x), ...
                 connectivity(right,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(right,x);
p(y) = p(y) + connectivity(right,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [below,right]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (11,4)

pause(sec)

quiver(p(x),p(y),connectivity(right,x), ...
                 connectivity(right,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(right,x);
p(y) = p(y) + connectivity(right,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [below,right,above]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (11,5)

pause(sec)

quiver(p(x),p(y),connectivity(above,x), ...
                 connectivity(above,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(above,x);
p(y) = p(y) + connectivity(above,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [right,above]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (11,6)

pause(sec)

quiver(p(x),p(y),connectivity(above,x), ...
                 connectivity(above,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(above,x);
p(y) = p(y) + connectivity(above,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [left,right,above]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (10,6)

pause(sec)

quiver(p(x),p(y),connectivity(left,x), ...
                 connectivity(left,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(left,x);
p(y) = p(y) + connectivity(left,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [left,above]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (10,7)

pause(sec)

quiver(p(x),p(y),connectivity(above,x), ...
                 connectivity(above,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(above,x);
p(y) = p(y) + connectivity(above,y);
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")
for i = [left,right,above]
    pause(sec)
    plot(p(x)+connectivity(i,x),p(y)+connectivity(i,y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="white")
end

%% (9,7)

pause(sec)

quiver(p(x),p(y),connectivity(left,x), ...
                 connectivity(left,y), Color='#0B0',MaxHeadSize=0.3,LineWidth=1);
p(x) = p(x) + connectivity(left,x);
p(y) = p(y) + connectivity(left,y);
pause(sec)
plot(p(x),p(y),Marker="o",MarkerEdgeColor="#0B0",MarkerFaceColor="#0B0")