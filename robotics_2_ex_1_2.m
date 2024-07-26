% Robotics II
% 1st Series of Exercises

syms q1 q2 I1 m1 l1 m2 c1 s1 dotq1 dotq2 g M11

s1 = sin(q1);
c1 = cos(q1);

J = [q2 * c1,  s1;
     q2 * s1, -c1];
   % 1      ,  0 ];

dotJ = [dotq2 * c1 - q2 * s1 * dotq1,  c1 * dotq1;
        dotq2 * s1 - q2 * c1 * dotq1, -s1 * dotq1];

h = [2 * m2 * q2 * dotq1 * dotq2 + (m1 * l1 + m2 * q2) * g * c1;
    -m2 * q2 * dotq1^2 + m2 * g * s1                           ];

% M11 = I1 + m1 * l1^2 + m2 * q2^2;

M = [M11, 0 ;
     0  , m2];

invM = inv(M);

Q = J * invM * transpose(J);

detQ = simplify(det(Q));

invQ = simplify(inv(Q));

hstar = simplify(invQ * (J * invM * h - dotJ * [dotq1; dotq2]));
