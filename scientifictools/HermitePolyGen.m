function hk = HermitePolyGen(n,def)
% Given nonnegative integer n, compute the 
% Hermite polynomial H_n. Return the result as a vector whose mth
% element is the coefficient of x^(n+1-m).
% polyval(HermitePoly(n),x) evaluates H_n(x).

% Extension of HermitePoly.m by David Terr, Raytheon, 5-10-04
% This version allows for both the physicists' and probabilists' form of the Hermite polynomials.

%% Section added by JBJ (14/04/09)
if (nargin < 2)
    core = 2; % Default to 'physicist's' polynomials
elseif (strcmp(def,'phys')==1)
    core = 2;
elseif (strcmp(def,'prob')==1)
    core = 1;
else
    core = 2;
end

%% Original code except where indicated    
if n==0 
    hk = 1;
elseif n==1
    %hk = [2 0];
    hk = [core 0];
else
    
    hkm2 = zeros(1,n+1);
    hkm2(n+1) = 1;
    hkm1 = zeros(1,n+1);
    %hkm1(n) = 2;
    hkm1(n) = core;

    for k=2:n
        
        hk = zeros(1,n+1);

        for e=n-k+1:2:n
            %hk(e) = 2*(hkm1(e+1) - (k-1)*hkm2(e));
            hk(e) = core*(hkm1(e+1) - (k-1)*hkm2(e));
        end
        
        %hk(n+1) = -2*(k-1)*hkm2(n+1);
        hk(n+1) = -core*(k-1)*hkm2(n+1);
        
        if k<n
            hkm2 = hkm1;
            hkm1 = hk;
        end
        
    end
    
end