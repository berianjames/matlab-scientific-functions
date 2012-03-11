function grow = growth_factor(z)
global COSMOLOGY

om_m = COSMOLOGY(2,1); 
om_v = COSMOLOGY(2,2);
om_mz=evolve_omega_m(z);
om_vz=evolve_omega_v(z);

grow  =(5./2.) * om_mz / (om_mz^(4/7)-om_vz+(1+om_mz/2)*(1+om_vz/70));
grow0 =(5./2.) * om_m  / ( om_m^(4/7)-om_v +(1+om_m/2) *(1+om_v/70) );

grow=(1+z)*grow0/grow;

end





