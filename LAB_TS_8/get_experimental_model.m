function [K, T, Td] = get_experimental_model(u0, us, tu0, y0, ys, ty0, ty63)

    delta_u = us - u0;
    delta_y = ys - y0;
    K = delta_y / delta_u;
    T = ty63 - ty0;
    Td = ty0 - tu0;

end