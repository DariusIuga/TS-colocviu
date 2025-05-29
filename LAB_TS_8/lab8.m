[timp, vin, m, omega, ia] = read_io_data('date_identificare.xlsx');

[u0, us, tu0, y0, ys, ty0, ty63] = get_1st_order_elements(vin, omega, timp);

subplot(2,1,1);
plot(timp, omega, 'b-', 'LineWidth', 2);
title('Turatie');
subplot(2,1,2);
plot(timp, vin, 'r-', 'LineWidth', 2);
title('Tensiune de alimentare');


[K, T, Td] = get_experimental_model(u0, us, tu0, y0, ys, ty0, ty63);
s = tf('s');
Hs = K / (T*s + 1) * exp(-Td*s);

start_time = timp(1);
end_time = timp(end);
num_points = length(timp);
t_sim = linspace(start_time, end_time, num_points);

u = vin;


[y_custom, t_custom] = lsim(Hs, u, t_sim);
figure;
plot(t_custom, y_custom, 'LineWidth', 2); 
hold on;
plot(timp, omega, 'o'); 
hold off;
legend('Estimat', 'Masurat');
xlabel('Timp (s)');
ylabel('Răspuns');
title('Răspunsul Sistemului Masurat vs. Estimat');
