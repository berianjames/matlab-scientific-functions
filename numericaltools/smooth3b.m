function output = smooth3b(input,width,padding)
% 3-D Gaussian smoothing using FFT
%
% Input: input (vector of scalar values)
%        width (float, width of smoothing, in pixels)
%        padding (integer, number of cells to pad with zeros)          
%
% Berian James, 2007

% Get parameters
n = size(input); nx = n(1); ny = n(2);  nz = n(3);
padding = ceil(padding);

% Pad input and transform to Fourier space
finput = fftn(input,[nx+padding,ny+padding,nz+padding]);
gauss = gaussian3c([padding+nx padding+ny padding+nz],width);
fgauss = fftn(fftshift(gauss));
foutput = finput.*(fgauss);
output = ifftn(foutput);

% Trim zeros
output = output(1:nx,1:ny,1:nz);

end