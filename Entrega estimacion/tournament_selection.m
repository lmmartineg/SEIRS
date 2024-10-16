function selected_indices = tournament_selection(fitness, num_parents)
    pop_size = length(fitness);
    selected_indices = zeros(1, num_parents);
    for i = 1:num_parents
        i1 = randi([1, pop_size]);
        i2 = randi([1, pop_size]);
        if fitness(i1) < fitness(i2)
            selected_indices(i) = i1;
        else
            selected_indices(i) = i2;
        end
    end
end