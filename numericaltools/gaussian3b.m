function h = gaussian3b(P1, P2)
% Construct three-dimensional anisotropic gaussian
%
%   H = gaussian3(N,SIGMA) returns a 3D Gaussian lowpass filter 
%   with standard deviation
%   SIGMA (in pixels). N is a 1-by-3 vector specifying the number
%   of rows, columns, pages in H. (N can also be a scalar, in 
%   which case H is NxN.) If you do not specify the parameters,
%   the default values of [3 3 3] for N and 0.65 for
%   SIGMA.


if nargin>0,
  if ~(all(size(P1)==[1 1]) || all(size(P1)==[1 3])),
     error(id('InvalidFirstInput'),...
         'The first parameter must be a scalar or a 1-by-3 size vector.');
  end
  if length(P1)==1, siz = [P1 P1 P1]; else siz = P1; end
end

if nargin<1, siz = [3 3 3]; end
if nargin<2, std = [.65 .65 .65]; else std = P2; end
[x,y,z] = ndgrid(-(siz(1)-1)/2:(siz(1)-1)/2, ...
    -(siz(2)-1)/2:(siz(2)-1)/2, ...
    -(siz(3)-1)/2:(siz(3)-1)/2);

hx = exp(-x.*x/(2*std(1)*std(1)));
hy = exp(-y.*y/(2*std(2)*std(2)));
hz = exp(-z.*z/(2*std(3)*std(3)));
h = hx .* hy .* hz;

h = h / sum(h(:));