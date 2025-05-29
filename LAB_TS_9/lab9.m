% Valori 
M = 2; % [kg] - masa caruciorului
m = 0.1; % [kg] - masa pendulului
g = 9.81; % [m/s^2] - acceleratia gravitationala 
l = 0.5; % [m] - lungimea pendulului 

% Matricile sistemului A, B, C, D

A = [0, 1, 0, 0; 
    ((M+m) * g) / (M * l), 0, 0, 0; 
    0, 0, 0, 1;
    m * g/ M, 0 ,0, 0];

B = [ 0; -(1/M * l); 0; 1 / M];

C = [1, 0, 0, 0;
    0, 0, 1, 0];

D = [0; 0];

% Ex 1
% Valorile proprii ale pendulului invers 

lambda = eig(A);
disp("Valorile proprii ale sistemului sunt: ");
disp(lambda);

% Analiza stabilitatii interne 
if all(real(lambda) < 0) 
    disp ("Sistemul este intern stabil");
elseif any(real(lambda) > 0)
    disp ("Sistemul este instabil");
else
    disp ("Sistemul este marginal stabil");
end


% Ex 2

% Stabilitatea interna folosind Routh-Hurwitz

syms S;
pol_caracteristic = det(S * eye(size(A)) - A);
coeficienti = sym2poly(pol_caracteristic);

if all(coeficienti > 0)
    disp("Toti coeficientii sunt pozitivi, deci se poate aplica criteriul Routh-hurwitz");
    [H, delta] = hurwitz(coeficienti);
    disp("Matricea Hurwitz: ");
    disp(H);
    disp("Minorii principali sunt: ");
    disp(delta);
    
    if all(delta > 0)
        disp ("Sistemul este asimptotic stabil");
    elseif any(delta <= 0)
        disp("Sistemul este instabil sau la limita de  stabilitate");
    end
else 
    disp("Nu toti coeficientii sunt pozitivi, sistemul poate fi instabil");
end

% Ex 3
% Polii pendulului invers si stabilitatea externa 
[num, den] = ss2tf(A, B, C, D, 1);
poli = roots(den);
disp ("Polii functiei de transfer: ");
disp(poli);

if all(real(poli) < 0)
    disp("Sistemul este extern stabil");
else
    disp("Sistemul este extern instabil");
end

% Ex 4 - Criterul Hurwitz pt stabilitate externa

if all(den > 0)
    disp("Toti coeficientii sunt pozitivi");
    [H1, delta1] = hurwitz(den);
    disp("Matricea Hurwitz");
    disp(H1);
    disp("Minorii principali");
    disp(delta1);
    
    if all(delta1 > 0)
        disp ("Sistemul este extern stabil conform criterului R-H");
    else
        disp("Sistemul este extern instabil sau la limitate de stabilitate");
    end
else
    disp("Nu toti coeficientii sunt pozitivi, sistemul poate fi instabil");
end



