function population = initialize_population(pop_size, num_params, param_bounds)
    population = rand(pop_size, num_params);  % Random population
    % Scale population to the parameter bounds
    for i = 1:num_params
        population(:, i) = param_bounds(i, 1) + ...
            (param_bounds(i, 2) - param_bounds(i, 1)) * population(:, i);
    end
end