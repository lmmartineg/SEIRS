function mutated_population = mutate(population, mutation_rate, param_bounds)
    [pop_size, num_params] = size(population);
    mutated_population = population;
    
    for i = 1:pop_size
        for j = 1:num_params
            if rand < mutation_rate
                mutation_val = randn * 0.01;  % Small random mutation
                mutated_population(i, j) = population(i, j) + mutation_val;
                % Bound checking
                mutated_population(i, j) = max(param_bounds(j, 1), ...
                                               min(param_bounds(j, 2), mutated_population(i, j)));
            end
        end
    end
end