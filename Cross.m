function [C] = Cross(r)
    x = 1;
    y = 2;
    z = 3;

    C = [0    -r(z)  r(y);
         r(z)  0    -r(x);
        -r(y)  r(x)  0   ];