function nu = mass2nu(mass)
global COSMOLOGY;

delta_c = 1.686;
% Calculate nu given a particular mass
if (max(mass) > log10(realmax))
    sprintf('%s',...
        'I prefer log10(mass), but the input is large - I am going to take logs!')
    mass = log10(mass);
end

r  = ( 10.^mass * 3./ (4*pi*2.78e11*COSMOLOGY(2,1)) ) .^ (1/3);
nu = delta_c./sigma_integral(r);

end