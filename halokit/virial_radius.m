function r_v = virial_radius(M)
global COSMOLOGY;

% Computes the virial radius of a halo
%  of a specified mass (in Solar masses).

% Formula of NFW96.
%h = COSMOLOGY(1,3);
%r_v = 1.63e-2 * (M * h).^(1/3) * ...
%    (COSMOLOGY(1,1) / COSMOLOGY(2,1))^(-1/3) * h;
% REMEMBER TO DIVIDE ANSWER BY A FACTOR OF (1+z)!

% Formula of Peacock: r_vir = r_f / 200^(1/3)
r  = ( 10.^M * 3./ (4*pi*2.78e11*COSMOLOGY(2,1)) ) .^ (1/3);
r_v = r / 200^(1/3);

end