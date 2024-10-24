function [best_params, best_fitness,mejores_parametros, mejores_fitness, mejores_residuales ] = genetic_algorithm(U, y_exp, pop_size, num_generations, param_bounds)
num_params = size(param_bounds, 1);
crossover_rate = 0.7; mutation_rate = 0.1;
num_parents = round(0.5 * pop_size);

mejores_parametros=zeros(num_generations,6);
mejores_fitness=zeros(1,num_generations);
mejores_residuales=cell(1,num_generations);

% Initialize population
population = initialize_population(pop_size, num_params, param_bounds);
population = bound_check(population, param_bounds);
% Evaluate fitness for each individual
fitness = zeros(1, pop_size);
vec_residuales=cell(1,pop_size);
for i = 1:pop_size
    fitness(i) = evaluate_fitness(population(i, :), U, y_exp, param_bounds);
end


for gen = 1:num_generations
    % Selection, crossover, and mutation
    selected_indices = tournament_selection(fitness, num_parents);
    parents = population(selected_indices, :);
    offspring = crossover(parents, crossover_rate);
    offspring = bound_check(offspring, param_bounds);
    mutated_population=mutate(offspring, mutation_rate, param_bounds);
    mutated_population = bound_check(mutated_population, param_bounds);
    population= [parents;mutated_population];
    for i = 1:pop_size
        [fitness_aux,vec_residuales_aux] = evaluate_fitness(population(i, :), U, y_exp, param_bounds);
        fitness(i)=fitness_aux;
        vec_residuales{i}=vec_residuales_aux;
    end

    % Store best individual
    [min_fitness, best_idx] = min(fitness);
    best_params = population(best_idx, :);
    residuales_mejor=vec_residuales(best_idx);
    best_fitness = min_fitness;


    mejores_parametros(gen,:)=best_params;
    mejores_fitness(gen)=best_fitness;
    mejores_residuales{gen}=residuales_mejor;
    % Display progress
    fprintf('Generation %d: Best Fitness = %d \n', gen, best_fitness);
end
end
