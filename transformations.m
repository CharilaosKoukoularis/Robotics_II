% Robotics II
% 1st Semester Project

syms q1 q2 q3 q4 q5 q6 q7

l1 = 0.267;
l2 = 0.293;
l3 = 0.0525;
l4 = 0.3512;
l5 = 0.1232;

theta1 = 0.2225;
theta2 = 0.6646;

x = 1;
y = 2;
z = 3;

A(:,:,1) = Rot(z,q1) * Tra(z,l1);
A(:,:,2) = Rot(x,-pi/2) * Rot(z,q2);
A(:,:,3) = Rot(x,pi/2) * Rot(z,q3) * Tra(z,l2);
A(:,:,4) = Rot(x,pi/2) * Tra(x,l3) * Rot(z,q4);
A(:,:,5) = Rot(x,pi/2) * Tra(x,l4*sin(theta1)) * Rot(z,q5) * Tra(z,l4*cos(theta1));
A(:,:,6) = Rot(x,pi/2) * Rot(z,q6);
A(:,:,7) = Rot(x,-pi/2) * Tra(x,l5*sin(theta2)) * Rot(z,q7) * Tra(z,l5*cos(theta2));

T(:,:,1) = A(:,:,1);
for i = 2:7
    T(:,:,i) = T(:,:,i-1) * A(:,:,i);
end

T(1:3,4,:)