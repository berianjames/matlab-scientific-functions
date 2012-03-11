function [counts,h] = imageplot_smooth(x,y,res);
% imageplot_smooth snippet produces a two-dimensional histogram
%  from (x,y) data and imageplot the result, scaling and
%  inverting the colormap to give black counts on a white
%  background. 
%
% differs from imageplot in that the output image is smoothed
%  with a two dimension gaussian of unit pixel width.
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
h = imagesc([min(x) max(x)],[min(y) max(y)],smooth2(counts,1,0)');
set(gca,'YDir','normal');
colormap gray; C = colormap; C = (1-C).^(3/2); colormap(C);
