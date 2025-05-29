function F = alocare(A, B, Lambda_d)
    % Verificăm dacă sistemul este controlabil
    if rank(ctrb(A, B)) ~= size(A, 1)
        error('Sistemul nu este controlabil');
    end
    
    % Pasul 1: Generăm aleator g și F0
    m = size(B, 2);
    n = size(A, 1);
    g = rand(m, 1);
    F0 = rand(m, n);
    
    % Pasul 2: Calculăm A0 și b0
    A0 = A + B * F0;
    b0 = B * g;
    
    % Pasul 3: Verificăm dacă perechea (A0, b0) este controlabilă
    while rank(ctrb(A0, b0)) ~= n
        g = rand(m, 1);
        F0 = rand(m, n);
        A0 = A + B * F0;
        b0 = B * g;
    end
    
    % Pasul 4: Calculăm f_T care alocă Lambda_d perechii (A0, b0)
    R0 = ctrb(A0, b0);
    q_T = inv(R0);
    q_T = q_T(end, :);
    chi_d = poly(Lambda_d);
    f_T = -q_T * polyvalm(chi_d, A0);
    
    % Pasul 5: Calculăm F
    F = F0 + g * f_T;
end
