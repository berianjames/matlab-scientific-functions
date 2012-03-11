function COSMOLOGY = initialise_cosmology()
global COSMOLOGY
%% Halo model toolkit function to initialise cosmology with
%   standard cosmological parameters
%
%  Inputs:
%  Output: vectors of six cosmological parameters
%%
% Cosmological parameters at z = 0
om_m0 = 0.3;
om_v0 = 0.7;
om_b    = 0.045;
h       = 0.73;
p_index = 0.97;
sig80 = 0.85;
pfac    = 1.0;

COSMOLOGY(1,:) = [om_m0, om_v0, om_b, h, p_index, sig80, pfac];
COSMOLOGY(2,:) = COSMOLOGY(1,:);

end