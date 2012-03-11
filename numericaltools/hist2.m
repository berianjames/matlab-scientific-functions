function n = hist2(data,nx,ny,xmin,xmax,ymin,ymax)
% hist2 Two-dimensional histogram
%
% n = hist2(data,[nx,ny,[xmin xmax ymin ymax]])
%
% Inputs: data (n x 2 vector of x,y values)
%         nx, ny (integers, number of bins in the x- and y-directions
%         xmin, xmax, ymin, xmax (floats, limits on x and y)
%
% Berian James, 2009

if (nargin<1)
    disp('Input data required: hist2(data,[nx,ny,[xmin xmax ymin ymax]])');
    return
elseif(nargin<2)
    nx = 10; ny = 10; eps = 1e-10;
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
elseif(nargin<3)
    if numel(nx>1), ny = nx(2); nx = nx(1); 
    else
        nx = nx(1); ny = nx; 
    end
    eps = 1e-10;
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
elseif(nargin<4)
    eps = 1e-8;
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
end

n = zeros(nx,ny);
nobj = length(data);
for i = 1:nobj
    xbin = fix( (data(i,1)-xmin)/(xmax-xmin) * nx) + 1; 
    ybin = fix( (data(i,2)-ymin)/(ymax-ymin) * ny) + 1;
    n(xbin,ybin) = n(xbin,ybin) + 1;
end

end