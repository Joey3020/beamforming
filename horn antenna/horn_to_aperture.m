function [Exa, Eya, Hxa, Hya] = horn_to_aperture(a, b, d, A, B, k, num)    
    
    %assuming that the horn antenna has a 
    %uniform E field in the y direction
    
    n0 = 120 * pi();    
    Exa = zeros(num, num);
    Eya = zeros(num, num);
    Hxa = zeros(num, num);
    Hya = zeros(num, num);
    
    for i = 1:1:num
        for j = 1:1:num
            x = A * i/num - A/2;
            y = B * j/num - B/2;
            
            r = sqrt(x*x + y*y);
            R = sqrt(r*r + d*d);
            
            cos_theta = d / R;
            sin_theta = r / R;
            
            if r ==0
                cos_phi = 0;
                sin_phi = 0;
            else
                cos_phi = x / r;
                sin_phi = y / r;
            end

            coeff = 1i * a * b * k * exp(-1i * k * R) / (2 * pi() * R);
            
            X = k * a / 2 * sin_theta * cos_phi;
            Y = k * b / 2 * sin_theta * sin_phi;
            
            F = sinc_(X) * sinc_(Y);
            
            E_theta = 0.5 * coeff * sin_phi * (1 + cos_theta) * F;
            E_phi   = 0.5 * coeff * cos_phi * (1 + cos_theta) * F;
            H_theta = - E_phi / n0;
            H_phi = E_theta / n0;
            
            Exa(i, j) = E_theta * cos_theta * cos_phi - E_phi * sin_phi;
            Eya(i, j) = E_theta * cos_theta * sin_phi + E_phi * cos_phi;
            Hxa(i, j) = H_theta * cos_theta * cos_phi - H_phi * sin_phi;
            Hya(i, j) = H_theta * cos_theta * sin_phi + H_phi * cos_phi;
        end
    end
    
end