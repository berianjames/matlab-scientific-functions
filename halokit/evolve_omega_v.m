function omega_v = evolve_omega_v(z)
global COSMOLOGY
om_m = COSMOLOGY(2,1); om_v = COSMOLOGY(2,2);

aa = 1 / (1+z);

omega_t = 1.0 + (om_m+om_v-1.0) / (1 - om_m - om_v + om_v*aa^2 + om_m/aa);
omega_v = omega_t * om_v / (om_v + om_m/aa^3);

end