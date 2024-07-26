function [R] = Rot(axis, theta)
    
    axis = string(axis);
    map = containers.Map(["x", "y", "z", "1", "2", "3"], ...
                         [ 1,   2,   3,   1,   2,   3]);
    axis = map(axis);

    R = sym(eye(4));
    switch axis 
        case 1
            R(1:3,1:3) = [1 0           0         ;
                          0 cos(theta) -sin(theta);
                          0 sin(theta)  cos(theta)];
        case 2
            R(1:3,1:3) = [cos(theta) 0 sin(theta);
                          0          1 0         ;
                         -sin(theta) 0 cos(theta)];
        case 3
            R(1:3,1:3) = [cos(theta) -sin(theta) 0;
                          sin(theta)  cos(theta) 0;
                          0           0          1];        
    end

    if class(theta) ~= "sym"
        R = round(R,15);
    end