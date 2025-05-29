% Matricile sistemului
A = [0 0 0; 1 0 -1; 0 1 2];
B = [0 -1; 1 0; 0 1];
C = [1, 0, 1];
Lambda_d = [-1, -1, -1];

% Calculul matricei F
F = alocare(A, B, Lambda_d);
disp('Matricea F:');
disp(F);

eig_values = eig(A + B * F);
disp('Valorile proprii ale matricei A + B*F:');
disp(eig_values);