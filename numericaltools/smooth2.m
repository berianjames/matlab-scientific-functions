function output = smooth2(input,width,padding)
% 2-D Gaussian smoothing using FFT
%
% Input: input (vector of scalar values)
%        width (float, width of smoothing, in pixels)
%        padding (integer, number of cells to pad with zeros)          
%
% Berian James, 2007

% Get parameters
n = size(input); nx = n(1); ny = n(2);
padding = ceil(padding);

% Pad input and transform to Fourier space
finput = fft2(input,nx+padding,ny+padding);
gauss = gaussian2([padding+nx padding+ny],width);
fgauss = fft2(fftshift(gauss));
foutput = finput.*(fgauss);
output = ifft2(foutput);

% Trim zeros
output = output(1:nx,1:ny);

end