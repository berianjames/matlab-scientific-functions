function delta_c = critical_density(z_f)
global COSMOLOGY;

% Determine the critical density for a halo
% of given collapse redshift z_f.

% Formula from NFW96 and Peacock & Smith 2001.
delta_c = 3000 * (1+z_f).^3;

end