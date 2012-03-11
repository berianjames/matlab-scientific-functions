function A = grfPk(N,L,Pfn)
% ------------------------------grf.m-------------------------------------
% Script: grf.m                     Creation: Oct 2005                    
% Author: J. Berian James           Revision: Dec 05, Jul 10                      
% Purpose: Generate normalised three-dimensional Gaussian random field    
% ----------------------------Comments------------------------------------
%  Free parameters for the field are the dimension length N and the index 
% the Fourier amplitude power spectrum (we appoximate the power spectrum  
% by P(k) = k^index and use the central limit theorem; see Peacock 1999). 
%  The field is created by generating an array of random densities in    
% configuration space and then normalising the amplitudes of the Fourier  
% transform components to obey a power spectrum with correct index. This 
% preserves the random phase conditions that are the essence of the GRF. 
%
% References: Peacock, J.A. (1999) 'Cosmological Physics', CUP           
% ------------------------------------------------------------------------

if length(N) == 1
     N = [N N N];
end

if length(L) == 1
    L = [L L L];
end

%% Generate Fourier-space field with correct symmetries
A = rand([N(1) N(2) N(3)]);
fA = fftn(A);

% Locations of conjugate symmetric elements are [mf ml] pairs
[~,mf] = unique(real(fA),'first');
[~,ml] = unique(real(fA),'last');

%% Create array of Fourier space distances k for all wavenumbers.
if (mod(N(1),2)==0),
    wpre = 0:N(1)/2;
    wpost = -(N(1)/2-1):-1;
    wvecx = 2*pi/L(1) * cat(2,wpre,wpost);
else
    wpre = 0:(N(1)/2-1/2);
    wpost = -(N(1)/2-1/2):-1;
    wvecx = 2*pi/L(1) * cat(2,wpre,wpost);
end

if (mod(N(2),2)==0),
    wpre = 0:N(2)/2;
    wpost = -(N(2)/2-1):-1;
    wvecy = 2*pi/L(2) * cat(2,wpre,wpost);
else
    wpre = 0:(N(2)/2-1/2);
    wpost = -(N(2)/2-1/2):-1;
    wvecy = 2*pi/L(2) * cat(2,wpre,wpost);
end

if (mod(N(3),2)==0),
    wpre = 0:N(3)/2;
    wpost = -(N(3)/2-1):-1;
    wvecz = 2*pi/L(3) * cat(2,wpre,wpost);
else
    wpre = 0:(N(3)/2-1/2);
    wpost = -(N(3)/2-1/2):-1;
    wvecz = 2*pi/L(3) * cat(2,wpre,wpost);
end
[kx,ky,kz] = ndgrid(wvecx,wvecy,wvecz);
wnum = sqrt(kx.^2 + ky.^2 + kz.^2); 
clear kx ky kz;

% Construct power spectrum
P = 0*wnum;
if nargin < 3, % No power spectrum provided, use k^n
    P(mf) = min(wnum(mf),wnum(ml)).^0.96; 
else
    mfwnum = min(wnum(mf),wnum(ml));
    P(mf) = max( Pfn(mfwnum) , 0 );
end
P(ml) = P(mf);

% Make \delta_ks dimensionless
%P = P  / prod(L);

% Construct Fourier amplitude with correct symmetries
afA = 0*P;
%afA(mf) = sqrt(P(mf));
afA(mf) = raylrnd(sqrt(P(mf)/2)); 
afA(ml) = afA(mf);

% Construct phases with correct symmetries
pfA = 0*fA;
pfA(mf) = 2*pi*rand(size(mf));
pfA(ml) = -pfA(mf);
pfA(intersect(mf,ml)) = 0;

% Fourier space field with correct amplitudes, phases and symmetries.
fA = afA .* exp(sqrt(-1)*pfA);

% Transform to real space
fA(1,1,1) = 0; % Set offset to zero
A = ifftn(fA);

if (max(max(max(imag(A)./real(A))))) < 1e-5,
    A = real(A);
end

end
