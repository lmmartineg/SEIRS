function [best_params, best_fitness] = genetic_algorithm( y_exp, pop_size, num_generations, param_bounds,poblacion_incial_seirs)
    num_params = size(param_bounds, 1);  % Number of parameters to optimize

    % GA Parameters
    crossover_rate = 0.7;
    mutation_rate = 0.1;
    num_parents = round(0.5 * pop_size);

    % Initialize population
    population = initialize_population(pop_size, num_params, param_bounds);

    % Evolution loop
    for gen = 1:num_generations
        % Evaluate fitness for each individual
        fitness = zeros(1, pop_size);
        for i = 1:pop_size
            fitness(i) = evaluate_fitness(population{i}, y_exp,poblacion_incial_seirs);
        end

        % Selection
        selected_indices = tournament_selection(fitness, num_parents);
        parents = population(selected_indices, :);

        % Crossover
        offspring = crossover(parents, crossover_rate);

        % Mutation
        population = mutate(offspring, mutation_rate, param_bounds);

        % Store best individual
        [min_fitness, best_idx] = min(fitness);
        best_params = population(best_idx, :);
        best_fitness = min_fitness;

        fprintf('Generation %d: Best Fitness = %.6f\n', gen, best_fitness);
    end
end
 