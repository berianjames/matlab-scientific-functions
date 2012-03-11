function y = HermiteFunction(n,x,def)
% Generates Hermite function of order n over domain x, using either the physicists' or probabilists' defintion of the Hermite polynomials.

%% Determine definition
if (nargin < 3)
    def = 'phys';
end

%% Calculate
if (strcmp(def,'phys')==1)

    % Physicist's definition
    amp = 1 / sqrt( factorial(n) * 2^n * sqrt(pi) );
    weight = exp(-x.^2/2);
    core = polyval(HermitePolyGen(n,'phys'),x);
    y = amp * weight .* core;

elseif (strcmp(def,'prob')==1)

    % Probabilist's definition
    amp = 1 / sqrt( factorial(n) * sqrt(2*pi) );
    weight = exp(-x.^2/4);
    core = polyval(HermitePolyGen(n,'prob'),x);
    y = amp * weight .* core;

else
  disp("Use HermiteFunction(n,x,def) where def is 'prob' or 'phys'");
end

end