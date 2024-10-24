function offspring = crossover(parents, crossover_rate)
    num_parents = size(parents, 1);
    num_params = size(parents, 2);
    offspring = parents;  % Initialize offspring
    
    for i = 1:2:num_parents-1
        if rand < crossover_rate
            % Perform single-point crossover
            crossover_point = randi([1, num_params-1]);
            offspring(i, crossover_point+1:end) = parents(i+1, crossover_point+1:end);
            offspring(i+1, crossover_point+1:end) = parents(i, crossover_point+1:end);
        end
    end
end