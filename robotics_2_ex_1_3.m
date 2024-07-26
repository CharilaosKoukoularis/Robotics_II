% Robotics II
% 1st Series of Exercises

syms r1 r2 r h d q1 q2 q3 q4 q5 q6 theta

%% (a)

rot = Rot("z", pi);
Roc(:,:,1) = rot(1:3,1:3);
rot = Rot("z", pi);
Roc(:,:,2) = rot(1:3,1:3);
rot = Rot("z", 0);
Roc(:,:,3) = rot(1:3,1:3);

Bc{1} = [0;1;0;0;0;0];
Bc{2} = [0;1;0;0;0;0];
Bc{3} = [1 0 0;
         0 1 0;
         0 0 1;
         0 0 0;
         0 0 0;
         0 0 0;];

roc(:,:,1) = [r2;d/2;0];
roc(:,:,2) = [-r1;d/2;0];
roc(:,:,3) = [h;-d/2;0];

for i = 1:3

    rcross(:,:,i) = Cross(roc(:,:,i));

    Wc(:,:,i) = [Roc(:,:,i)                , zeros(3,3);
                 rcross(:,:,i) * Roc(:,:,i), Roc(:,:,i)];

    G{:,:,i} = Wc(:,:,i) * Bc{i};
end

%% (b)

cminus = 3;
cplus = 4;

rot = Rot("z", pi);
Roc(:,:,1) = rot(1:3,1:3);
rot = Rot("z", pi);
Roc(:,:,2) = rot(1:3,1:3);
rot = Rot("z", theta);
Roc(:,:,cminus) = rot(1:3,1:3);
rot = Rot("z", -theta);
Roc(:,:,cplus) = rot(1:3,1:3);

Bc{1} = [0;1;0;0;0;0];
Bc{2} = [0;1;0;0;0;0];
Bc{cminus} = [0;1;0;0;0;0];
Bc{cplus} = [0;1;0;0;0;0];

roc(:,:,1) = [r2;d/2;0];
roc(:,:,2) = [-r1;d/2;0];
roc(:,:,cminus) = [h;-d/2;0];
roc(:,:,cplus) = [h;-d/2;0];

G = [];
for i = 1:4

    rcross(:,:,i) = Cross(roc(:,:,i));

    Wc(:,:,i) = [Roc(:,:,i)                , zeros(3,3);
                 rcross(:,:,i) * Roc(:,:,i), Roc(:,:,i)];

    Gc{i} = Wc(:,:,i) * Bc{i};
    G = [G Gc{i}];
end

G2d = [G(1:2,:);
       G(6,:)  ];

v = simplify(cross(G2d(:,3),G2d(:,4)));

u = [d/2 h -1];

columnProduct = u * G2d;
% ... => h < r

%% (c)

rot = Rot("z", pi);
Roc(:,:,1) = rot(1:3,1:3);
rot = Rot("z", pi);
Roc(:,:,2) = rot(1:3,1:3);
rot = Rot("z", 0);
Roc(:,:,3) = rot(1:3,1:3);

Reo = eye(3);

Bc{1} = [0;1;0;0;0;0];
Bc{2} = [0;1;0;0;0;0];
Bc{3} = [1 0 0;
         0 1 0;
         0 0 1;
         0 0 0;
         0 0 0;
         0 0 0;];


JL(:,:,1) = [1  0;
             0 -1;
             0  0];

JA(:,:,1) = [0 0;
             0 0;
             0 0];

J(:,:,1) = [JL(:,:,1);
            JA(:,:,1)];

JL(:,:,2) = [1  0;
             0 -1;
             0  0];

JA(:,:,2) = [0 0;
             0 0;
             0 0];

J(:,:,2) = [JL(:,:,2);
            JA(:,:,2)];

JL(:,:,3) = [1 0;
             0 1;
             0 0];

JA(:,:,3) = [0 0;
             0 0;
             0 0];

J(:,:,3) = [JL(:,:,3);
            JA(:,:,3)];


for i = 1:3
    
    Rce(:,:,i) = transpose(Reo(:,:,1) * Roc(:,:,i));

    Tce(:,:,i) = [Rce(:,:,i), zeros(3,3);
                  zeros(3,3), Rce(:,:,i)];

    Jh{i} = transpose(Bc{i}) * Tce(:,:,i) * J(:,:,i);
end

Jhand = blkdiag(Jh{1},Jh{2},Jh{3});