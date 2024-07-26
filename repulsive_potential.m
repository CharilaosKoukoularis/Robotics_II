function Urep = repulsive_potential(p_robot, p_obst)
    
    Urep = 0;

    for k = 1:size(p_obst)
        p_obstk = p_obst(k,:);
        Urep = Urep + obstacle_potential(p_robot,p_obstk);
    end