function bias = bias_factor(nu,type)
% Calculate bias factor for given nu
delta_c = 1.686;

if (nargin < 2)
    % Default to Press-Schechter Eulerian bias expression
    bias = 1 + (    nu.^2 - 1) / (delta_c);
elseif (type == 'JAP')
    % Peacock '07 Eulerian bias expression
    a = 1.529; b = 0.704; c = 0.412;
    bias = 1 - 1 / delta_c .*...
     -((a*b^2*nu.^b.*(-1 + a*nu.^b) + 4*c*nu.^2.*(1 + a*nu.^2).*...
      (-1 + a*(-1 + b)*nu.^b) + 4*nu.^4.*(c + a*c*nu.^b).^2 ) ./ ...
      ((1 + a*nu.^b ).*(a*b*nu.^b  + 2*c*nu.^2.*(1 + a*nu.^b ))));
elseif (type == 'ST')   
    % Sheth-Torman Eulerian bias expression
    d = 0.707; p = 0.3;
    bias = 1 + (  d*nu.^2 - 1) / delta_c + ...
        2*p ./ (1 + (d*nu.^2).^p) / delta_c;
else
    % Press-Schechter Eulerian bias expression
    bias = 1 + (    nu.^2 - 1) / (delta_c);
end