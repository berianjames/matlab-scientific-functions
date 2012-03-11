function xi = two_halo(rs)

% Generate 2-halo term in correlation function from
% quadrature integration of linear power spectrum
% from 0 to k_max = 300/r.

for counter = 1:length(rs)
    r = rs(counter);
    F = @(k)(power_spectrum(k) ./ k) .* (sin(r.*k) ./ (r.*k));
    kmax = 300/r;
    xi(counter)=quadl(F,1e-6,kmax,1e-6);
end