function h = gaussian2(P1, P2)
% Construct two-dimensional isotropic gaussian
%
%   H = gausian2(N,SIGMA) returns a rotationally
%   symmetric 2D Gaussian lowpass filter with standard deviation
%   SIGMA (in pixels). N is a 1-by-2 vector specifying the number
%   of rows, columns, pages in H. (N can also be a scalar, in 
%   which case H is NxN.) If you do not specify the parameters,
%   the default values of [3 3] for N and 0.65 for
%   SIGMA.


if nargin>0,
  if ~(all(size(P1)==[1 1]) || all(size(P1)==[1 2])),
     error(id('InvalidFirstInput'),'The first parameter must be a scalar or a 1-by-2 size vector.');
  end
  if length(P1)==1, siz = [P1 P1]; else siz = P1; end
end

if nargin<1, siz = [3 3]; end
if nargin<2, std = .65; else std = P2; end
[x,y] = meshgrid(-(siz(2)-1)/2:(siz(2)-1)/2, -(siz(1)-1)/2:(siz(1)-1)/2);
h = exp(-(x.*x + y.*y)/(2*std*std));
h = h/sum(h(:));