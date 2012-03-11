function c = concentration(delta_c)

% Determine the halo concentration parameter
% from an input value of the critical density.

cinv = (400./(3*delta_c)) + (110./delta_c).^0.387;
c    = 1 ./ cinv;

end