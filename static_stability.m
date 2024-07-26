% robotics-II-grasping_2022_v1.pdf
% Page 41 Example 2
% 7/5/2024

syms theta r
G = [cos(theta)    cos(theta)   -cos(theta)  -cos(theta)  ;
    -sin(theta)    sin(theta)   -sin(theta)   sin(theta)  ;
     r*sin(theta) -r*sin(theta) -r*sin(theta) r*sin(theta)];

for i = 1:3
    for j = i+1:4
        cross(G(:,i),G(:,j))
    end
end

