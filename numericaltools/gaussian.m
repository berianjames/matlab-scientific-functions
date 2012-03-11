function h = gaussian(P1, P2)
% Construct one-dimensional gaussian
%
%   H = gaussian(N,SIGMA) returns a 1D Gaussian filter with standard deviation
%   SIGMA (in pixels). N is a scalar specifying the number
%   of entries in H. If you do not specify the parameters,
%   the default values of 3 for N and 0.65 for
%   SIGMA.


if nargin>0,
  if ~(all(size(P1)==[1 1])),
     error(id('InvalidFirstInput'),'The first parameter must be a scalar.');
  end
  if length(P1)==1, siz = P1; else siz = P1; end
end

if nargin<1, siz = 3; end
if nargin<2, std = .65; else std = P2; end
x = linspace(-(siz-1)/2,(siz-1)/2,siz);
h = exp(-(x.*x)/(2*std*std));
h = h/sum(h(:));