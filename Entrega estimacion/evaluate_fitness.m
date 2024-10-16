function [error,residuales] = evaluate_fitness(params, U, y_exp)
    % Parameters to estimate: [beta, gamma, alpha, nu, B, d]
    beta = params(1);
    gamma = params(2);
    alpha = params(3);
    nu = params(4);
    B = params(5);
    d = params(6);

    % Set the parameters in Simulink model (assumes the model is configured for GA)
    mdl = 'SEIRS';
    load_system(mdl)
    path = [mdl, '/Modelo SEIRS'];
    set_param(path, 'beta', num2str(beta));
    set_param(path, 'gamma', num2str(gamma));
    set_param(path, 'alpha', num2str(alpha));
    set_param(path, 'nu', num2str(nu/10));
    set_param(path, 'B', num2str(B/1000));
    set_param(path, 'd', num2str(d/1000));

    simOut = sim('SEIRS');

    % Extract simulation output (e.g., infected population I)
    y_sim = simOut.get('I');
    residuales=y_exp - y_sim.signals.values;
    % Compute Mean Squared Error (MSE) between simulated and experimental data
    error = mean((residuales).^2);
    
end