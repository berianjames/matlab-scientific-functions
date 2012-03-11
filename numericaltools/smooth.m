function output = smooth(input,width,padding)
% 1-D Gaussian smoothing using FFT
%
% Input: input (vector of scalar values)
%        width (float, width of smoothing, in pixels)
%        padding (integer, number of cells to pad with zeros)          
%
% Berian James, 2007

% Get parameters
nx = length(input);
padding = ceil(padding);

% Pad input and transform to Fourier space
finput = fft(input,nx+padding); 
gauss = gaussian(padding+nx,width); 
fgauss = fft(fftshift(gauss)); 
foutput = finput.*(fgauss); 
output = ifft(foutput);

% Trim zeros
output = output(1:nx);

end