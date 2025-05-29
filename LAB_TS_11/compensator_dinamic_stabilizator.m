function [Ac, Bc, Cc, Dc] = compensator_dinamic_stabilizator(A, B, C, Lambda_d, Lambda_e)
    % Check controllability and observability
    if rank(ctrb(A, B)) ~= size(A, 1)
        error('The system is not controllable');
    end
    if rank(obsv(A, C)) ~= size(A, 1)
        error('The system is not observable');
    end

    % Step 3: Calculate F for Lambda_d allocation using alocare
    F = alocare(A, B, Lambda_d);

    % Step 4: Determine unitary state estimator
    A_t = A';
    B_t = C';
    L_t = alocare(A_t, B_t, Lambda_e);
    L = L_t';

    % Step 5: Calculate estimator matrices
    J = A + L * C;
    K = -L;
    H = B;
    M = eye(size(A));
    N = zeros(size(A, 1), size(C, 1));

    % Dynamic Stabilizing Compensator matrices
    Ac = J + H * F * M;
    Bc = K + H * F * N;
    Cc = F * M;
    Dc = F * N;
end
