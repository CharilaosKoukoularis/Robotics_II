% Robotics II
% 1st Series of Exercises

% Define the symbolic variables
syms q1 q2 q3 q4 l real

% Define the sine and cosine terms
s2 = sin(q2);
s23 = sin(q2 + q3);
c2 = cos(q2);
c23 = cos(q2 + q3);

% Define the Jacobian matrix
J_E = [
    1, -l * s2 - (q4 + l) * s23, -(q4 + l) * s23, c23;
    0,  l * c2 + (q4 + l) * c23,  (q4 + l) * c23, s23
];

Jplus = simplify(pinv(J_E))