function population = bound_check(population, param_bounds)
[pop_size, num_params] = size(population);
for i = 1:pop_size
    for j = 1:num_params
        population(i, j) = max(param_bounds(j, 1), min(param_bounds(j, 2), population(i, j)));
    end
end
end