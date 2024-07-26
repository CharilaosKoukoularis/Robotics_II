function Uobstk = obstacle_potential(p_robot, p_obst_k)
    
    Krep = 20;
    rho0  = 2;

    rho = pdist([p_robot;p_obst_k]);
    if (rho > rho0)
        Uobstk = 0;
    else
        Uobstk = 1/2 * Krep * (1/rho - 1/rho0)^2;
    end