function z_f = collapse_redshift(nu)

% Compute the collapse redshift for given mass.
% Input is in the form of nu (run mass2nu first).

% We want z_f such that growth_factor(z_f) = 1 + 1/nu,
%  but the growth factor is not invertible analytically;
%  instead, we use bisection to find a root of the equation
%  g(z_f) - (1+1/nu) = 0, to a fixed tolerance.

for i = 1:length(nu)
   z_f(i) = fzero(@(z_f)growth_factor(z_f) - (1+1/nu(i)),1);
end

end