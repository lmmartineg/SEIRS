function mutated_population = mutate(population, mutation_rate, param_bounds)
[pop_size, num_params] = size(population);
mutated_population = population;

for i = 1:pop_size
    for j = 1:num_params
        if rand < mutation_rate
            mutated_population(i, 1) = population(i, 1) + randn * 0.08; % beta
            mutated_population(i, 2) = population(i, 2) + randn * 0.08; % gamma
            mutated_population(i, 3) = population(i, 3) + randn * 0.08; % alpha
            mutated_population(i, 4) = population(i, 4) + randn * 0.008; % nu
            mutated_population(i, 5) = population(i, 5) + randn * 0.08; % B
            mutated_population(i, 6) = population(i, 6) + randn * 0.08; % d

            % Bound checking
            mutated_population(i, j) = max(param_bounds(j, 1), ...
                min(param_bounds(j, 2), mutated_population(i, j)));
        end
    end
end
end