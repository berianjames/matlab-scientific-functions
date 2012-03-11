function n = whist2(data,nx,ny,w,xmin,xmax,ymin,ymax)
% whist2 Weighted two-dimensional histogram
%
% n = hist2(data,[nx,ny,w,[xmin xmax ymin ymax]])
%
% Inputs: data (n x 2 vector of x,y values)
%         nx, ny (integers, number of bins in the x- and y-directions
%         w (n-vector, weights for each data point)
%         xmin, xmax, ymin, ymax (floats, limits on x and y)
%
% Berian James, 2009

if (nargin<1)
    disp('Input data required: hist2(data,[nx,ny,[xmin xmax ymin ymax]])');
    return
elseif(nargin<2)
    nx = 10; ny = 10; eps = 1e-10; w = 1+zeros([1 length(data)]);
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
elseif(nargin<3)
    ny = nx; eps = 1e-10; w = 1+zeros([1 length(data)]);
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
elseif(nargin<4)
    eps = 1e-10; w = 1+zeros([1 length(data)]);
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
elseif(nargin<5)
    eps = 1e-10;
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
end

n = zeros(nx,ny); norm = n;
nobj = length(data);
for i = 1:nobj
    xbin = fix( (data(i,1)-xmin)/(xmax-xmin) * nx) + 1; 
    ybin = fix( (data(i,2)-ymin)/(ymax-ymin) * ny) + 1;
    n(xbin,ybin) = n(xbin,ybin) + w(i);
    norm(xbin,ybin) = norm(xbin,ybin) + 1;
end

filled = find(norm>0); unfilled = find(norm==0);
n(filled) = n(filled) ./ norm(filled);
n(unfilled) = mean(n(filled));
end