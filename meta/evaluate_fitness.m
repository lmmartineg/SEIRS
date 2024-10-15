
function fitness = evaluate_fitness(individuo, y_exp, poblacion_inicial_seirs)
    mdl = 'SEIRS_meta';
    load_system(mdl)
    path = [mdl, '/Modelo SEIRS'];

    % Convertir los valores de 'individuo' a cadenas de texto
    B_str = num2str(individuo(1));
    d_str = num2str(individuo(2));
    alpha_str = num2str(individuo(3));
    gamma_str = num2str(individuo(4));
    beta_str = num2str(individuo(5));
    nu_str = num2str(individuo(6));
    
    % Convertir las condiciones iniciales de la población a cadenas de texto
    S0_str = num2str(poblacion_inicial_seirs(1));
    E0_str = num2str(poblacion_inicial_seirs(2));
    I0_str = num2str(poblacion_inicial_seirs(3));
    R0_str = num2str(poblacion_inicial_seirs(4));

    % Asignar los valores de parámetros al modelo
    set_param(path, 'B', B_str, ...
                      'd', d_str, ...
                      'alpha', alpha_str, ...
                      'gamma', gamma_str, ...
                      'beta', beta_str, ...
                      'nu', nu_str, ...
                      'ci', ['[', S0_str, ' ', E0_str, ' ', I0_str, ' ', R0_str, ']']);
    
    % Simular el modelo
    U = y_exp.Entrada_U.signals.values;
    yest = sim("SEIRS_meta.slx").I.signals.values;
    
    % Función de coste (MSE)
    fitness = sum((y_exp.I.signals.values - yest).^2) / length(y_exp.I.signals.values);
end
