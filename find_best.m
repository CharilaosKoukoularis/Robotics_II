function [x,y] = find_best(open)
    
    x_pos = 2;
    y_pos = 1;
    u_pos = 3;

    minU = open(1,u_pos);
    x = open(1,x_pos);
    y = open(1,y_pos);

    for i = 2:size(open,1)
        if open(i,u_pos) < minU
            minU = open(i,u_pos);
            x = open(i,x_pos);
            y = open(i,y_pos);
        end
    end