function omega_m = evolve_omega_m(z)
global COSMOLOGY
om_m = COSMOLOGY(2,1); om_v = COSMOLOGY(2,2);

aa = 1 / (1+z);
omega_t = 1 + (om_m+om_v-1.0) / (1 - om_m - om_v + om_v*aa^2 + om_m/aa);
omega_m = omega_t * om_m / (om_m + om_v*aa^3);

end