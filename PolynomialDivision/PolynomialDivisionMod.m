function [quot,rem] = PolynomialDivisionMod(coeffs,div,n)
% Polynomial division mod n
%  [quot,rem] = PolynomialDivisionMod(coeffs,div,n)
%
%  Polynomials are represented as vectors of
%  coefficients, going from x^n down to x^0.
%   E.g., x^3 + 2x + 4 :: [1 0 2 4]
%
%  J. Berian James, Sept. 2009

% Pad divisor array with any necessary zeros, and take mod n.
div   = mod(padarray(div,[0 length(coeffs)-length(div)],'pre'),n);

% Calculate orders of polynomials
order = length(coeffs) - find(coeffs~=0, 1 );
dorder= length(div)    - find(div   ~=0, 1 );
pos = length(div) - dorder; % Position of leading divisor coefficient

% Initialise output arrays
quot = 0*div;
rem  = mod(coeffs,n);   % Take mod n of divisor
alpha= linspace(0,n-1,n); % For computing quotient coefficients

% Division algorithm
for i = 1:order-dorder+1
    A = find(mod(rem(i) - div(pos)*alpha,n)==0,1);
    if isempty(A)
        warning('Irreducible factor... stopping.')
        quot = coeffs; rem = div; return;
    end;
    quot(i) = alpha(A);
    rem = mod(rem - circshift(div,[0 i-pos])*quot(i),n);
end

% Arrange output array
quot = circshift(quot,[0 dorder]);