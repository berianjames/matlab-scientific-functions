function [counts,h] = imageplot(x,y,res);
% imageplot snippet to produce a two-dimension histogram
%  from (x,y) data and imageplot the result, scaling and
%  inverting the colormap to give black counts on a white
%  background. 
%
% Input: x (vector), y (vector), res (scalar or 2-vector)
% Output: counts (2-d array), plot handle
%
% Berian James, ca. 2009

if (nargin<3)
    disp('Input data required: imageplot(x,y,res)');
    return;
end;

% Presume equal resolution
if length(res) < 2
    res = [res res];
end

% Perform counts with numericaltools hist2
counts = hist2([x y],res);
%figure;
h = imagesc([min(x) max(x)],[min(y) max(y)],counts');
set(gca,'YDir','normal');
colormap gray; C = colormap; C = (1-C).^(3/2); colormap(C);
