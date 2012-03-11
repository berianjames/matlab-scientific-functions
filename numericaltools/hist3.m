function n = hist3(data,nx,ny,nz)
% hist3 Three-dimensional histogram
%
% n = hist3(data,[nx,ny,nz,[xmin xmax ymin ymax zmin zmax]])
%
% Inputs: data (n x 3 vector of x, y, z values)
%         nx, ny, nz (integers, number of bins in the x-, y- and z-directions
%         xmin, xmax, ymin, xmax, zmin, zmax (floats, limits on x, y and z)
%
% Berian James, 2009

if (nargin<1)
    disp('Input data required: hist3(data,[nx,ny,nz,[xmin xmax ymin ymax zmin zmax]])');
    return
elseif(nargin<2)
    nx = 10; ny = 10; nz = 10; eps = 1e-10;
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
    zmin = min(data(:,3)-eps); zmax = max(data(:,3)+eps);
elseif(nargin<4)
    ny = nx; nz = nx; eps = 1e-10;
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
    zmin = min(data(:,3)-eps); zmax = max(data(:,3)+eps);
elseif(nargin<5)
    eps = 1e-10;
    xmin = min(data(:,1)-eps); xmax = max(data(:,1)+eps);
    ymin = min(data(:,2)-eps); ymax = max(data(:,2)+eps);
    zmin = min(data(:,3)-eps); zmax = max(data(:,3)+eps);
end

n = zeros(nx,ny,nz);
nobj = length(data);
for i = 1:nobj
    xbin = fix( (data(i,1)-xmin)/(xmax-xmin) * nx) + 1; 
    ybin = fix( (data(i,2)-ymin)/(ymax-ymin) * ny) + 1;
    zbin = fix( (data(i,3)-zmin)/(zmax-zmin) * nz) + 1;
    n(xbin,ybin,zbin) = n(xbin,ybin,zbin) + 1;
end

end