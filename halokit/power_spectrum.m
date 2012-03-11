function ps = power_spectrum(k)
global COSMOLOGY
%% Halokit toolbox function to calculate power spectrum
%  ps = power_spectrum(k)
% 
%  Inputs: k, vector of wavenumbers
% 
%  Output: power_spectrum, power spectrum evaulated at each rk
%%
om_m = COSMOLOGY(1,1); om_v = COSMOLOGY(1,2); om_b = COSMOLOGY(1,3);
h = COSMOLOGY(1,4); p_index = COSMOLOGY(1,5); sig8 = COSMOLOGY(1,6);
pfac = COSMOLOGY(1,7);

% Approximate COBE normalization allowing for p_index
tilt=p_index-1;

if(om_v > 0)
    dh=1.94e-5*(om_m^(-0.785-0.05*log(om_m)))*exp(-0.95*tilt-0.169*tilt^2);
else
    dh=1.95e-5*(om_m^(-0.35-0.19*log(om_m)-0.17*tilt))*exp(-tilt-0.14*tilt^2);
end

ps = dh^2 * (3000*k).^(3+p_index) .* transfer_function(k).^2 * pfac;

end