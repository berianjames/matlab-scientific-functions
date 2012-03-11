clear all; close all; clc; format compact;

global COSMOLOGY;
initialise_cosmology();
scrsz = get(0,'ScreenSize');
figure('Position',[1 scrsz(4)/2 scrsz(3)/1.3 scrsz(4)/1.25])

%% CALCULATION of power spectrum and bias functions
pts = 100;

k = logspace(-3,3,pts);
ps = power_spectrum(k);

r = logspace(-1.5,2,pts);


logmass = linspace(11.5,14.5,10);
nu = mass2nu(logmass);

% TWO-HALO TERM
xi_two = two_halo(r);
bias = bias_factor(nu,'JAP');

% ONE-HALO TERM
delta_c = critical_density(collapse_redshift(nu));
r_s = virial_radius(logmass) ./ concentration(delta_c);
for i = 1:length(logmass);
    xi_one(i,1:pts) = delta_c(i) ./ ( r/r_s(i) .* (1+r/r_s(i)).^2);
    b = bias(i);
    loglog(r,xi_one(i,:),'b:'); hold on;
    loglog(r,b*xi_two,'r:');
    loglog(r,xi_one(i,:)+b*xi_two,'k-');
end
axis(10.^[-1.5 2 -3 6]); set(gca,'FontSize',12);
xlabel('radius r (Mpc/h)'); 
ylabel('\xi(r) = \xi_1(r) + \xi_2(r) = \delta_c / [(r/r_s)(1+r/r_s)^2] + \int_0^{k_{max} = 300/r} (\Delta^2(k) / k) \times (sin(kr) / kr) dk');

axis square;
%exportfig(gcf,'xi.eps');
%eps2pdf('xi.eps');