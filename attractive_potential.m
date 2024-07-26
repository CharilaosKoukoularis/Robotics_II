function Uatt = attractive_potential(p_robot, p_end)
    Katt = 10;

    Uatt = 1/2 * Katt * pdist([p_robot;p_end])^2;