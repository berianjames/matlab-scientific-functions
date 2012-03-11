function COSMOLOGY = evolve_cosmology(z)
global COSMOLOGY

om_m = evolve_omega_m(z);
om_v = evolve_omega_v(z);
om_b = 0.045;
h       = 0.73;
p_index = 0.97;
sig80   = COSMOLOGY(2,6) / growth_factor(z);
COSMOLOGY(1,1:6) = [om_m, om_v, om_b, h, p_index, sig80];
COSMOLOGY(1,7) = 1;
COSMOLOGY(1,7) = (sig80 / sigma_integral(8))^2;

end