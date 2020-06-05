function [E_theta, E_phi] = horn_to_space2(a, b, R, k ,num)
    coeff = 1i * a * b * k * exp(-1i * k * R) / (2 * pi() * R);
    theta = linspace(0, pi()/2, num)';
    phi = linspace(0, 2 * pi(), num);
    
    X = k * a / 2 * cos(phi) * sin(theta) ;
    Y = k * b / 2 * sin(phi) * sin(theta);
    
    
    F = sinc_(X) .* sinc_(Y);
    
    E_theta = 0.5 * coeff .* (1 + cos(theta)) .* sin(phi) .* F;
    E_phi =   0.5 * coeff .* (1 + cos(theta)) .* cos(phi) .* F;
end