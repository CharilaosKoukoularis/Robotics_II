function [T] = Tra(axis, d)
    T = sym(eye(4));
    T(axis,4) = d;