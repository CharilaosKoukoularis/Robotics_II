function [] = best_first(p_start,p_end,p_obst,p_range)
    
    x = 2;
    y = 1;

    direction = ["below","left","right","above"];
    movement = {[-1,0],[0,-1],[0,1],[1,0]};
    connectivity = dictionary(direction,movement);

    visited = zeros(p_range(y),p_range(x));
    
    OPEN = {[p_start,repulsive_potential(p_start,p_obst) + attractive_potential(p_start,p_end)]};
    visited(p_start(x),p_start(y)) = 1;
    while isempty(OPEN) == false
        find_best(OPEN)
    end
end