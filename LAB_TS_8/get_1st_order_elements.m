function [u0, us, tu0, y0, ys, ty0, ty63] = get_1st_order_elements(vin, omega, timp)
    u0 = vin(1);
    y0 = omega(1);
    n = length(vin);
    us = mean(vin(round(0.9*n):end));
    ys = mean(omega(round(0.9*n):end));
    tu0 = timp(find(vin > u0, 1, 'first'));
    ty0 = timp(find(omega > y0, 1, 'first'));
    target = y0 + 0.63 * (ys - y0);
    ty63 = timp(find(omega >= target, 1, 'first'));
end

