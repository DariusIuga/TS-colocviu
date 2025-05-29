% Matricele sistemului pentru pendulul invers
M = 2; % Masa căruciorului [kg]
m = 0.1; % Masa pendulului [kg]
g = 9.81; % Accelerația gravitațională [m/s^2]
l = 0.5; % Lungimea pendulului [m]

A = [0 1 0 0;
     (M+m)*g/(M*l) 0 0 0;
     0 0 0 1;
     -m*g/M 0 0 0];

B = [0; -1/(M*l); 0; 1/M];
C = [1 0 0 0; 0 0 1 0]; 
D = [0; 0];

Lambda_d = [-1, -1, -1, -1]; 
Lambda_e = [-2, -2, -2, -2]; 

[Ac, Bc, Fc, Gc] = compensator_dinamic_stabilizator(A, B, C, Lambda_d, Lambda_e);

disp('Matricea Ac:');
disp(Ac);
disp('Matricea Bc:');
disp(Bc);
disp('Matricea Fc:');
disp(Fc);
disp('Matricea Gc:');
disp(Gc);
