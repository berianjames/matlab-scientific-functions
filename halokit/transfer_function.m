function tk = transfer_function(k)
global COSMOLOGY
%% Halokit toolbox function to calculate transfer function using
%  the "astonishing" D.J. Eisenstein & W. Hu fitting formula
%  (see ApJ 496 605 [1998]).
% 
%  Inputs: k, vector of wavenumbers
% 
%  Output: power_spectrum, power spectrum evaulated at each rk
%%
% om_m is the total matter density parameter - i.e. CDM + baryons
om_m = COSMOLOGY(2,1); om_v = COSMOLOGY(2,2); om_b = COSMOLOGY(1,3);
h = COSMOLOGY(1,4); p_index = COSMOLOGY(1,5); sig8 = COSMOLOGY(1,6);

% Fitting formula is in pure, rather than comoving, wavenumber.
k = k*h;

e=exp(1.);
thet = 2.728/2.7;

b1 = 0.313 * (om_m*h^2)^(-0.419) * (1+0.607*(om_m*h^2)^0.674);
b2 = 0.238 * (om_m*h^2)^0.223;
zd = 1291 * (1+b1*(om_b*h^2)^b2) * (om_m*h^2)^0.251 / ...
    (1+0.659*(om_m*h^2)^0.828);
ze = 2.50e4 * om_m * h^2 / thet^4;
rd = 31500 * om_b * h^2 /thet^4 / zd;
re = 31500 * om_b * h^2 /thet^4 / ze;
rke= 7.46e-2*om_m*h^2/thet^2;
s  = (2/3/rke) * sqrt(6/re )* log((sqrt(1+rd)+sqrt(rd+re))/(1+sqrt(re)));
rks= 1.6 * (om_b*h^2)^0.52 * (om_m*h^2)^0.73 * (1+(10.4*om_m*h^2)^(-0.95));

q = k / 13.41 / rke;

y = (1+ze) / (1+zd);
g = y * (-6*sqrt(1+y)+(2+3*y)*log((sqrt(1+y)+1)/(sqrt(1+y)-1)));
ab= g * 2.07 * rke * s / (1+rd)^(0.75);

a1 = (46.9*om_m*h^2)^0.670 * (1+(32.1*om_m*h^2)^(-0.532));
a2 = (12.0*om_m*h^2)^0.424 * (1+(45.0*om_m*h^2)^(-0.582));
ac = (a1^(-om_b/om_m)) * (a2^(-(om_b/om_m)^3));

b1 = 0.944 / (1+(458*om_m*h^2)^(-0.708));
b2 = (0.395*om_m*h^2)^(-0.0266);
bc = 1 / (1+b1*((1-om_b/om_m)^b2-1));

f = 1 ./ (1+(k*s/5.4).^4);

c1 = 14.2 + 386./(1+69.9*q.^1.08);
c2 = 14.2/ac + 386./(1+69.9*q.^1.08);
tc = f .* log(e+1.8*bc*q) ./ (log(e+1.8*bc*q)+c1.*q.^2) + ...
    (1-f) .* log(e+1.8*bc*q) ./ (log(e+1.8*bc*q)+c2.*q.^2);

bb = 0.5 + (om_b/om_m) + (3-2*om_b/om_m) * sqrt((17.2*om_m*h^2)^2+1);
bn = 8.41 * (om_m*h^2)^0.435;
ss = s ./ (1+(bn./k/s).^3).^(1/3);
tb = log(e+1.8*q) ./ (log(e+1.8*q)+c1.*q.*q) ./ (1+(k*s/5.2).^2);
tb = (tb+ab*exp(-(k/rks).^1.4) ./ (1+(bb./k/s).^3)) .* sin(k.*ss) ./ k ./ ss;

tk = (om_b/om_m)*tb + (1-om_b/om_m)*tc;

end