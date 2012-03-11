function xinum(r)

kmax = 300/r;
F = @(k)(power_spectrum(k) / k) * (sin(r*k) / (r*k+1e-20));
xinum=quad(F,1e-6,kmax);

end